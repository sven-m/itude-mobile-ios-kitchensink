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

-(UIViewController<MBViewControllerProtocol> *)viewControllerForPageWithName:(NSString *)pageName {
    UIViewController<MBViewControllerProtocol>* viewController = nil;
    
    if([@"PAGE-customized-view-logic" isEqualToString:pageName]) {
        viewController = [[[CustomizedViewLogic alloc] init] autorelease];
    } else if([@"PAGE-customized-list" isEqualToString:pageName]) {
        viewController = [[[CustomizedList alloc] init] autorelease];
    } else if([@"PAGE-customized-layout" isEqualToString:pageName]) {
        viewController = [[[CustomizedLayout alloc] init] autorelease];
    } else if([@"PAGE-page-with-xib" isEqualToString:pageName]) {
        viewController = [[[PageWithXibFileViewController alloc] init] autorelease];
    } else if ([@"PAGE-modern-catalog" isEqualToString:pageName]) {
        viewController = [[[SimplestPlantCatalogViewBindingController alloc] init] autorelease];
    } else if ([@"PAGE-modern-catalog-2" isEqualToString:pageName]) {
        viewController = [[[PlantCatalogViewBindingController alloc] init] autorelease];
    } else if ([@"PAGE-modern-catalog-3" isEqualToString:pageName]) {
        viewController = [[[SpecialPlantCatalogViewBindingController alloc] init] autorelease];
    } else if ([@"PAGE-modern-plant-detail" isEqualToString:pageName]) {
        viewController = [[[PlantDetailViewBindingController alloc] init] autorelease];
    }
 
    return  viewController;
}

-(id<MBContentViewWrapper>)createContentViewWrapper {
	return [[[MBSlidingMenuContentViewWrapper alloc] init] autorelease];
}

@end
