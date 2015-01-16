//
//  MBTextBinder.h
//  kitchensink-app
//
//  Created by Emiel Bon on 15-01-15.
//  Copyright (c) 2015 Itude Mobile. All rights reserved.
//

#import "MBBaseViewBinder.h"

@interface MBTextBinder : MBBaseViewBinder

@property (nonatomic, assign) NSString *identifier;

- (instancetype)initWithBindingIdentifier:(NSString *)identifier;

@end
