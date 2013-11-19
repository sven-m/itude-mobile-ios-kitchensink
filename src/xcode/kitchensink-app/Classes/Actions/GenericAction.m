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

#import "GenericAction.h"
#import "MBElement.h"
#import "MBLocalizationService.h"
#import "MBMacros.h"

#define XMLNS_XSI       @"http://www.w3.org/2001/XMLSchema-instance"
#define XMLNS_XSD       @"http://www.w3.org/2001/XMLSchema"
#define XMLNS_SOAP12    @"http://www.w3.org/2003/05/soap-envelope"
#define XMLNS           @"http://poseidon.itude.com/"

@implementation GenericAction

-(MBDocument *) buildPPSoapRequestDocument:(MBDocument *)doc withActionName:(NSString *)name{
    // IMPORTANT!!: need to add the additional '${DOCUMENTNAME}:' (e.g. GetCareprovidersRequest:) before the path, because it contains a ':'
    MBElement *envelope = [doc valueForPath:@"GetCareprovidersRequest:soap12:Envelope[0]"];
    [envelope setValue:XMLNS_XSI forAttribute:@"xmlns:xsi"];
    [envelope setValue:XMLNS_XSD forAttribute:@"xmlns:xsd"];
    [envelope setValue:XMLNS_SOAP12 forAttribute:@"xmlns:soap12"];
    
    MBElement *action = [doc valueForPath:[NSString stringWithFormat:@"GetCareprovidersRequest:soap12:Envelope[0]/soap12:Body[0]/%@[0]", name]];
    [action setValue:XMLNS forAttribute:@"xmlns"];
    
    return doc;
}

-(void) setRequestParameter:(NSString *)value forKey:(NSString *)key forDocument:(MBDocument *)doc{
	MBElement *request = [doc valueForPath:@"Request[0]"];
	MBElement *parameter = [request createElementWithName:@"Parameter"];
	[parameter setValue:key forAttribute:@"key"];
	[parameter setValue:value forAttribute:@"value"];
}


@end
