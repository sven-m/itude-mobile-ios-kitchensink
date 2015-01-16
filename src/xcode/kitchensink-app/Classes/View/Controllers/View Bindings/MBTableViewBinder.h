//
//  MBTableViewBinder.h
//  kitchensink-app
//
//  Created by Emiel Bon on 15-01-15.
//  Copyright (c) 2015 Itude Mobile. All rights reserved.
//

#import "MBBaseViewBinder.h"

@interface MBTableViewBinder : MBBaseViewBinder <UITableViewDataSource>

@property (nonatomic, assign) NSString *identifier;

- (instancetype)initWithBindingIdentifier:(NSString *)identifier cellNib:(UINib *)cellNib;
+ (instancetype)binderWithIdentifier:(NSString *)identifier cellNib:(UINib *)cellNib;

@end
