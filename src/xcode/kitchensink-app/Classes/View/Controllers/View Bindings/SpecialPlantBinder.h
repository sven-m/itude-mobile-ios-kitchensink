//
//  SpecialPlantBinder.h
//  kitchensink-app
//
//  Created by Emiel Bon on 20-01-15.
//  Copyright (c) 2015 Itude Mobile. All rights reserved.
//

#import "MBBaseViewBinder.h"

@interface SpecialPlantBinder : MBBaseViewBinder

+ (instancetype)binderWithIdentifier:(NSString *)identifier;
- (void)populateView:(UIView *)view withDataFromComponent:(MBComponent *)component;

@end
