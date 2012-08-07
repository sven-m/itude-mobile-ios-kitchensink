//
//  PilserviceApplication.m
//  itude-mobile-ios-app
//
//  Created by Ricardo de Wilde on 7/8/11.
//  Copyright 2011 Itude Mobile. All rights reserved.
//

#import "CustomApplicationFactory.h"

// Framework imports
#import "MBPage.h"

// Controllers
//#import "ExampleViewController.h"


// Actions
#import "FireInitialOutcomes.h"
#import "ExceptionExampleAction.h"
#import "CustomAction.h"

@implementation CustomApplicationFactory

-(id<MBResultListener>) createResultListener:(NSString *)listenerClassName {
	return nil;
}

-(id<MBAction>) createAction:(NSString *)actionClassName {
	if ([actionClassName isEqualToString:@"FireInitialOutcomes"]) {
		return [[FireInitialOutcomes new] autorelease];
	}
    else if ([actionClassName isEqualToString:@"CustomAction"]) {
        return [[CustomAction new] autorelease];
    }
    else if ([actionClassName isEqualToString:@"ExceptionExampleAction"]) {
        return [[ExceptionExampleAction new] autorelease];
    }
    
	return nil;
}

-(MBPage *) createPage:(MBPageDefinition *)definition 
			  document:(MBDocument*) document 
			  rootPath:(NSString*) rootPath 
			 viewState:(MBViewState) viewState 
		 withMaxBounds:(CGRect) bounds {
    

    // Home page (example)
    if([@"PAGE-home" isEqualToString:definition.name]) {
//		ExampleViewController *myViewController = [[[ExampleViewController alloc] init] autorelease];
//		MBPage *page = [[[MBPage alloc] initWithDefinition:definition withViewController:myViewController document:document rootPath:rootPath viewState: viewState]autorelease];
//		return page;
	}
     
    
    return [super createPage:definition document:document rootPath:rootPath viewState: viewState withMaxBounds: bounds];
}


@end
