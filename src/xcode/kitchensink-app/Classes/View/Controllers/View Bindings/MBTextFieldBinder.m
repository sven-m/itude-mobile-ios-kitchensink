//
//  MBTextFieldBinder.m
//  kitchensink-app
//
//  Created by Emiel Bon on 16-01-15.
//  Copyright (c) 2015 Itude Mobile. All rights reserved.
//

#import "MBTextFieldBinder.h"

@implementation MBTextFieldBinder

+ (instancetype)binderWithIdentifier:(NSString *)identifier
{
    return [[[MBTextFieldBinder alloc] initWithBindingIdentifier:identifier] autorelease];
}

- (UIView *)bindSpecificView:(MBBuildState *)state
{
    //UIView *textView = [state.parent viewWithTag:self.identifier];
    UIView *textView = [state.parent viewWithBindingIdentifier:self.identifier];
    if (textView) {
        assert([textView isKindOfClass:[UITextField class]]);
        UITextField *textField = (UITextField *)textView;
        MBField *field = (MBField *)state.component;
        textField.text        = field.formattedValue;
        textField.placeholder = field.hint;
        textField.delegate    = field;
        [textField addTarget:field
                      action:@selector(textFieldDoneEditing:)
            forControlEvents: UIControlEventEditingChanged | UIControlEventEditingDidEnd | UIControlEventEditingDidEndOnExit];
    }
    return textView;
}

@end
