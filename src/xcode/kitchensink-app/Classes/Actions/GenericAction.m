//
//  CustomGenericAction.m
//  itude-mobile-ios-app
//
//  Created by Ricardo de Wilde on 7/25/11.
//  Copyright 2011 Itude Mobile. All rights reserved.
//

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
