//
//  MBTextBinder.m
//  kitchensink-app
//
//  Created by Emiel Bon on 15-01-15.
//  Copyright (c) 2015 Itude Mobile. All rights reserved.
//

#import "MBTextBinder.h"
#import "MBBuildState.h"

@interface MBTextBinder()

@property (nonatomic, assign) NSInteger identifier;

@end

@implementation MBTextBinder

- (instancetype)initWithTargetTag:(NSInteger)tag
{
    self = [super init];
    if (self) {
        self.identifier = tag;
    }
    return self;
}

- (UIView *)bindSpecificView:(MBBuildState *)state
{
    UIView *textView = [state.parent viewWithTag:self.identifier]; // Can be a UITextView, UITextField or UILabel, anything that responds to setText
    if (textView) {
        MBField *field = (MBField *)state.component;
        if ([textView respondsToSelector:@selector(setText:)]) {
            [(id)textView setText:field.formattedValue];
        }
    }
    return textView;
}

@end
