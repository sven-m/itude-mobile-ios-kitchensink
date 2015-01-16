//
//  MBPageBinder.h
//  kitchensink-app
//
//  Created by Emiel Bon on 15-01-15.
//  Copyright (c) 2015 Itude Mobile. All rights reserved.
//

#import "MBBaseViewBinder.h"
#import "MBViewBinder.h"

@interface MBPageBinder : MBBaseViewBinder

- (instancetype)initWithViewController:(MBBasicViewController *)viewController;
- (void)registerBinder:(id<MBViewBinder>)binder forComponentWithName:(NSString *)componentName;
- (void)bind;

@end
