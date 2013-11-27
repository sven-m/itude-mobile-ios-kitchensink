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

//  MBMenuDialogDecorator.m
//  kitchensink-app
//  Created by Pjotter Tommassen on 2013/26/11.

#import "MBMenuDialogDecorator.h"
#import "MBDialogController.h"
#import "MBViewManager.h"
#import "MBSlidingMenuContentViewWrapper.h"
#import "MBApplicationController.h"

@implementation MBMenuDialogDecorator

static UIViewController *controller;

-(void)decorateDialog:(MBDialogController *)dialog {
	controller = [dialog.rootViewController retain];
}

-(void)presentDialog:(MBDialogController *)dialog withTransitionStyle:(NSString *)transitionStyle {

}

-(void)dismissDialog:(MBDialogController *)dialog withTransitionStyle:(NSString *)transitionStyle
{

}

@end

@implementation MBDialogSlidingMenuContentWrapper

-(UIViewController*)createMenuController {
	return controller;
}

@end