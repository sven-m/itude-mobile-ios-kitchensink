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
#import "CustomizedViewLogic.h"
#import "CustomizedList.h"
#import "CustomizedLayout.h"
#import "PageWithXibFileViewController.h"

// Actions
#import "FireInitialOutcomes.h"
#import "ExceptionExampleAction.h"
#import "CustomAction.h"

@implementation CustomApplicationFactory

-(id<MBResultListener>) createResultListener:(NSString *)listenerClassName {
	return nil;
}

-(MBPage *) createPage:(MBPageDefinition *)definition 
			  document:(MBDocument*) document 
			  rootPath:(NSString*) rootPath 
			 viewState:(MBViewState) viewState 
		 withMaxBounds:(CGRect) bounds {
    
    if([@"PAGE-customized-view-logic" isEqualToString:definition.name]) {
        CustomizedViewLogic *myViewController = [[[CustomizedViewLogic alloc] init] autorelease];
		MBPage *page = [[[MBPage alloc] initWithDefinition:definition withViewController:myViewController document:document rootPath:rootPath viewState: viewState]autorelease];
		return page;
	}

    if([@"PAGE-customized-list" isEqualToString:definition.name]) {
		CustomizedList *myViewController = [[[CustomizedList alloc] init] autorelease];
		MBPage *page = [[[MBPage alloc] initWithDefinition:definition withViewController:myViewController document:document rootPath:rootPath viewState: viewState]autorelease];
		return page;
	}

    if([@"PAGE-customized-layout" isEqualToString:definition.name]) {
		CustomizedLayout *myViewController = [[[CustomizedLayout alloc] init] autorelease];
		MBPage *page = [[[MBPage alloc] initWithDefinition:definition withViewController:myViewController document:document rootPath:rootPath viewState: viewState]autorelease];
		return page;
	}
    if([@"PAGE-page-with-xib" isEqualToString:definition.name]) {
		PageWithXibFileViewController *myViewController = [[[PageWithXibFileViewController alloc] init] autorelease];
		MBPage *page = [[[MBPage alloc] initWithDefinition:definition withViewController:myViewController document:document rootPath:rootPath viewState: viewState]autorelease];
		return page;
	}

    
    return [super createPage:definition document:document rootPath:rootPath viewState: viewState withMaxBounds: bounds];
}


@end
