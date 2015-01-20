//
//  MBDefaultStyleTableViewBinder.h
//  kitchensink-app
//
//  Created by Emiel Bon on 20-01-15.
//  Copyright (c) 2015 Itude Mobile. All rights reserved.
//

#import "MBSimpleTableViewBinder.h"

@interface MBDefaultStyleTableViewBinder : MBSimpleTableViewBinder

- (instancetype)initWithBindingIdentifier:(NSString *)identifier cellTitleBindingIdentifier:(NSString *)cellTitleBindingIdentifier;
+ (instancetype)binderWithIdentifier:(NSString *)identifier cellTitleBindingIdentifier:(NSString *)cellTitleBindingIdentifier;

@end
