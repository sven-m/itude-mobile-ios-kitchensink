//
//  MBTableViewBinder.h
//  kitchensink-app
//
//  Created by Emiel Bon on 15-01-15.
//  Copyright (c) 2015 Itude Mobile. All rights reserved.
//

#import "MBBaseViewBinder.h"

@interface MBTableViewBinder : MBBaseViewBinder <UITableViewDataSource>

- (instancetype)initWithTargetTag:(NSInteger)tag cellNib:(UINib *)cellNib;

@end
