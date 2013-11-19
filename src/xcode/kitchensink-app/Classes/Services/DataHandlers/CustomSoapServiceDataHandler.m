/*
 * (C) Copyright Itude Mobile B.V., The Netherlands.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#import "CustomSoapServiceDataHandler.h"
#import "MBMacros.h"
#import "MBMetadataService.h"
#import "MBDocumentFactory.h"
#import "MBOutcome.h"
#import "MBApplicationFactory.h"
#import "MBAction.h"
#import "MBLocalizationService.h"
#import "Reachability.h"
#import <Foundation/Foundation.h>

#define SOAP_PRE_BODY       @"<?xml version=\"1.0\" encoding=\"utf-8\"?><soap12:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap12=\"http://www.w3.org/2003/05/soap-envelope\"><soap12:Body>"
#define SOAP_POST_BODY       @"</soap12:Body></soap12:Envelope>"

@interface PPRequestDelegate : NSObject
{
	
	BOOL _finished;
	NSMutableData *_data;
	NSURLConnection *_connection;
	NSError *_err;
	NSURLResponse *_response;
	
}

@property BOOL finished;
@property (nonatomic, retain) NSURLConnection *connection;
@property (nonatomic, retain) NSError *err;
@property (nonatomic, retain) NSURLResponse *response;
@property (nonatomic, retain) NSMutableData *data;

@end

@implementation PPRequestDelegate

@synthesize connection = _connection;
@synthesize err = _err;
@synthesize response = _response;
@synthesize data = _data;
@synthesize finished = _finished;

-(void) dealloc{
	self.data = nil;
	self.err = nil;
	self.response = nil;
	self.connection = nil;
	[super dealloc];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
	_finished = YES;
	self.err = error;
	
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
	[self.data appendData:data];
}


- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
	[self.data setLength:0];
	self.response = response;
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection{
	_finished = YES;
}

- (NSCachedURLResponse *)connection:(NSURLConnection *)connection willCacheResponse:(NSCachedURLResponse *)cachedResponse{
	// never cache the response of the urlConnection here.
	return nil;
}

@end


@implementation CustomSoapServiceDataHandler

- (MBDocument *) loadDocument:(NSString *)documentName withArguments:(MBDocument *)args {
    
	MBEndPointDefinition *endPoint = [self getEndPointForDocument:documentName];
	DLog(@"CustomSoapServiceDataHandler:loadDocument %@ from %@", documentName, endPoint.endPointUri);
	
	if (endPoint != nil)
	{
		NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:endPoint.endPointUri] cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:endPoint.timeout];
		[request setHTTPMethod:@"POST"];
		[request setValue:@"gzip,deflate" forHTTPHeaderField:@"Accept-Encoding"];
		//[request setValue:@"Jakarta Commons-HttpClient/3.1" forHTTPHeaderField:@"User-Agent"];
		//[request setValue:@"example.itude.com:16200" forHTTPHeaderField:@"Host"];
		//[request setValue:@"272" forHTTPHeaderField:@"Content-Length"];
        
		NSString *body = [NSString stringWithFormat:@"%@%@%@", SOAP_PRE_BODY, [[args valueForPath:@"/*[0]"] asXmlWithLevel:0], SOAP_POST_BODY];
        
		if(body != nil) [request setHTTPBody: [body dataUsingEncoding:NSUTF8StringEncoding]];
        
        NSLog(@"body=%@",body);
        
		PPRequestDelegate *delegate = [PPRequestDelegate new];
		NSString *dataString = nil;
		MBDocument *responseDoc = nil;
		@try {
			delegate.err = nil;
			delegate.response = nil;
			delegate.finished = NO;
			delegate.data = [[NSMutableData new] retain];
			
			[[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
			
			[[NSURLCache sharedURLCache] removeCachedResponseForRequest:request];
			if ((delegate.connection = [[NSURLConnection alloc] initWithRequest:request delegate:delegate])){
				while (!delegate.finished) {
					if([[Reachability reachabilityForInternetConnection] currentReachabilityStatus] == NotReachable){
						[delegate.connection cancel];
						@throw [NSException exceptionWithName:MBLocalizedString(@"Network error") reason:MBLocalizedString(@"No internet connection") userInfo:nil];
					}
					
					NSString *endPointUri = endPoint.endPointUri;
					NSURL *url = nil;
					NSString *hostName = nil;
					Reachability *reachability = nil;
					NetworkStatus networkStatus = NotReachable;
					
					if (endPointUri) {
						@try {
							url = [NSURL URLWithString:endPointUri];
						}
						@catch (NSException * e) {
							WLog(@"WARNING! CustomSoapServiceDataHandler:Prevented a crash while creating an NSURL from the endpointUri while loading document %@. Exception: %@",documentName,e);
						}						
					}else {
						WLog(@"WARNING! CustomSoapServiceDataHandler:The endpointUri (%@) could not be retrieved while loading document %@.",endPointUri,documentName);
					}
					
					if (url) {
						hostName = [url host];
					}else {
						WLog(@"WARNING! CustomSoapServiceDataHandler:The url (%@) could not be retrieved while loading document %@.",url,documentName);
					}
					
					if (hostName && ([hostName length]>0)) {
						reachability = [Reachability reachabilityWithHostName:hostName];
					} else {
						WLog(@"WARNING! CustomSoapServiceDataHandler:The hostName (%@) could not be retrieved while loading document %@.",hostName,documentName);
					}
					
					if (reachability) {
						networkStatus = [reachability currentReachabilityStatus];
					} else {
						WLog(@"WARNING! CustomSoapServiceDataHandler:The reachability (%@) could not be retrieved while loading document %@.",reachability,documentName);
					}	
                    
					if (networkStatus == NotReachable) {
						[delegate.connection cancel];
						@throw [NSException exceptionWithName:MBLocalizedString(@"Network error") reason:MBLocalizedString(@"Server unreachable") userInfo:nil];
					}
					[[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];
				}
			}
			
			dataString = [[NSString alloc] initWithData:delegate.data encoding:NSUTF8StringEncoding];
			BOOL serverErrorHandled = NO;
            
			for(MBResultListenerDefinition *lsnr in [endPoint resultListeners]) {
				if([lsnr matches:dataString]) {
					id<MBResultListener> rl = [[MBApplicationFactory sharedInstance] createResultListener:lsnr.name];
					[rl handleResult:dataString requestDocument:args definition: lsnr];
					serverErrorHandled = YES;
				}
			}
			if (delegate.err != nil) {
				[[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
				WLog(@"An error (%@) occured while accessing endpoint '%@'", delegate.err, endPoint.endPointUri);
				@throw [NSException exceptionWithName:MBLocalizedString(@"Network error") reason:[delegate.err localizedDescription] userInfo:[delegate.err userInfo]];
			}
			[[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
			
            // Remove the soap stuff
            dataString = [[dataString substringToIndex:[dataString rangeOfString:@"</soap:Body>"].location] substringFromIndex:[dataString rangeOfString:@"<soap:Body>"].location+11];
            
            // TODO: To test errors 
            /*
            dataString =  @"<soap:Fault><soap:Code><soap:Value>soap:Sender</soap:Value></soap:Code><soap:Reason><soap:Text xml:lang="en">Server was unable to read request. ---&gt; There is an error in XML document (9, 15). ---&gt; Input string was not in a correct format.</soap:Text></soap:Reason><soap:Detail /></soap:Fault>";
             */
            
			responseDoc =  [[MBDocumentFactory sharedInstance] documentWithData:[dataString dataUsingEncoding:NSUTF8StringEncoding] withType:self.documentFactoryType andDefinition:[[MBMetadataService sharedInstance] definitionForDocumentName:documentName]];
			// if the response document is empty and unhandled by endpoint listeners let the user know there is a problem
			if (!serverErrorHandled && responseDoc == nil) {
				NSString *msg = MBLocalizedString(@"The server returned an error. Please try again later");
				if(delegate.err != nil) {
					msg = [NSString stringWithFormat:@"%@ %@: %i", msg, delegate.err.domain, delegate.err.code];
				}
				@throw [NSException exceptionWithName:@"Server Error" reason: msg userInfo:nil];
			}
		}
		@catch (NSException * e) {
			DLog(@"%@",body);
			DLog(@"%@",dataString);
			@throw e;
		}
		@finally {
			[delegate release];
		}
        
		[[NSNotificationCenter defaultCenter] postNotificationName:@"NetworkActivity" object: nil];
		return responseDoc;
	}
	else {
		WLog(@"No endpoint defined for document name '%@'", documentName);
		return nil;
	}	
}

@end
