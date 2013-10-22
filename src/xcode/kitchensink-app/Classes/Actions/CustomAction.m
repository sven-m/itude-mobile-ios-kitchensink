//
//  CustomAction.m
//  itude-mobile-ios-app
//
//  Created by Robin Puthli on 07-08-2012.
//  Copyright (c) 2012 Itude Mobile. All rights reserved.
//

#import "CustomAction.h"
#import "MBOutcome.h"
#import "MBDocument.h"
#import "MBDocumentDefinition.h"
#import "MBDataManagerService.h"

@implementation CustomAction

-(MBOutcome*) execute:(MBDocument *)document withPath:(NSString *)path {
    // Do some custom logic here, for example retrieve device properties and pass them to a page

    // load a document from the central Data Manager Service
    MBDocument *doc = [[MBDataManagerService sharedInstance] loadDocument: @"ApplicationState"];    
    // change the document
    [doc setValue:[[UIDevice currentDevice] description] forPath:@"Device[0]/@deviceType"];
    
    // create the Outcome with data included in it and return it to the Application Controller
    MBOutcome *oc = [[[MBOutcome alloc] init] autorelease];
    oc.outcomeName = @"OUTCOME-display-device-info";
    oc.noBackgroundProcessing = TRUE;
    oc.transferDocument = TRUE;
    oc.document = doc;
	return oc;
}

@end
