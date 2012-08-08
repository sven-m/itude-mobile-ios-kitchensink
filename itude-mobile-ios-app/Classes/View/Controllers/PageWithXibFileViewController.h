//
//  PageWithXibFileViewController.h
//  itude-mobile-ios-app
//
//  Created by Robin Puthli on 08-08-2012.
//  Copyright (c) 2012 Itude Mobile. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBBasicViewController.h"
#import "MBField.h"

@interface PageWithXibFileViewController : MBBasicViewController {
    IBOutlet UILabel * _label;
    IBOutlet UITextField * _textField;
    IBOutlet UIButton * _button;
    
    MBField *_myField;
    MBField *_myButton;
    
}

@end
