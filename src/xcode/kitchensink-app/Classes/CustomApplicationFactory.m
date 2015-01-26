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

#import "CustomApplicationFactory.h"

// Controllers
#import "CustomizedViewLogic.h"
#import "CustomizedList.h"
#import "CustomizedLayout.h"
#import "PageWithXibFileViewController.h"
#import "SimplestPlantCatalogViewBindingController.h"
#import "PlantCatalogViewBindingController.h"
#import "SpecialPlantCatalogViewBindingController.h"
#import "PlantDetailViewBindingController.h"

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
    
    UIViewController<MBViewControllerProtocol>* viewController = nil;
    
    if([@"PAGE-customized-view-logic" isEqualToString:definition.name]) {
        viewController = [[[CustomizedViewLogic alloc] init] autorelease];
	} else if([@"PAGE-customized-list" isEqualToString:definition.name]) {
		viewController = [[[CustomizedList alloc] init] autorelease];
	} else if([@"PAGE-customized-layout" isEqualToString:definition.name]) {
		viewController = [[[CustomizedLayout alloc] init] autorelease];
	} else if([@"PAGE-page-with-xib" isEqualToString:definition.name]) {
		viewController = [[[PageWithXibFileViewController alloc] init] autorelease];
	}
    
    if ([@"PAGE-modern-catalog" isEqualToString:definition.name]) {
        SimplestPlantCatalogViewBindingController *controller = [[[SimplestPlantCatalogViewBindingController alloc] init] autorelease];
        MBPage *page = [[[MBPage alloc] initWithDefinition:definition withViewController:controller document:document rootPath:rootPath viewState:viewState] autorelease];
        [controller rebuildView];
        return page;
    }
    if ([@"PAGE-modern-catalog-2" isEqualToString:definition.name]) {
        PlantCatalogViewBindingController *controller = [[[PlantCatalogViewBindingController alloc] init] autorelease];
        MBPage *page = [[[MBPage alloc] initWithDefinition:definition withViewController:controller document:document rootPath:rootPath viewState:viewState] autorelease];
        [controller rebuildView];
        return page;
    }
    if ([@"PAGE-modern-catalog-3" isEqualToString:definition.name]) {
        SpecialPlantCatalogViewBindingController *controller = [[[SpecialPlantCatalogViewBindingController alloc] init] autorelease];
        MBPage *page = [[[MBPage alloc] initWithDefinition:definition withViewController:controller document:document rootPath:rootPath viewState:viewState] autorelease];
        [controller rebuildView];
        return page;
    }
    if ([@"PAGE-modern-plant-detail" isEqualToString:definition.name]) {
        PlantDetailViewBindingController *controller = [[[PlantDetailViewBindingController alloc] init] autorelease];
        MBPage *page = [[[MBPage alloc] initWithDefinition:definition withViewController:controller document:document rootPath:rootPath viewState:viewState] autorelease];
        [controller rebuildView];
        return page;
    }
    
    if(viewController) {
        return [[[MBPage alloc] initWithDefinition:definition withViewController:viewController document:document rootPath:rootPath viewState: viewState] autorelease];
    }
    
    return [super createPage:definition document:document rootPath:rootPath viewState: viewState withMaxBounds: bounds];
}

-(id<MBContentViewWrapper>)createContentViewWrapper {
	return [[[MBSlidingMenuContentViewWrapper alloc] init] autorelease];
}

@end
