//
//  PageWithXibFileViewController.m
//  itude-mobile-ios-app
//
//  Created by Robin Puthli on 08-08-2012.
//  Copyright (c) 2012 Itude Mobile. All rights reserved.
//

#import "PageWithXibFileViewController.h"
#import "MBPage.h"
#import "MBField.h"
#import "MBDataManagerService.h"

@interface PageWithXibFileViewController ()

@end

@implementation PageWithXibFileViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // get the field and button definitions from the page (ensures localization and data parsing is handled by the framework).
    _myField = [self.page firstDescendantOfKind:[MBField class] filterUsingSelector:@selector(name) havingValue:@"inputfield"];
    _myButton = [self.page firstDescendantOfKind:[MBField class] filterUsingSelector:@selector(name) havingValue:@"button"];
    
    // copy the values from the page into the interface builder objects
    _label.text = [_myField label];
    _textField.text = [_myField value];
    [_button setTitle:_myButton.label forState:UIControlStateNormal];
    [_button.titleLabel setNeedsLayout];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

-(IBAction) buttonPressed{
    [_myField setValue:_textField.text];
    [[MBDataManagerService sharedInstance] storeDocument:self.page.document];
    
}


@end
