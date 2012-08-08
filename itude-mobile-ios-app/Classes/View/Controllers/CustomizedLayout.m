//
//  CustomizedLayout.m
//  itude-mobile-ios-app
//
//  Created by Robin Puthli on 08-08-2012.
//  Copyright (c) 2012 Itude Mobile. All rights reserved.
//

#import "CustomizedLayout.h"
#import "MBPage.h"

@implementation CustomizedLayout

-(void)viewDidLoad {
    [super viewDidLoad];
    MBPanel *myPanel = [self.page firstChildOfKind:[MBPanel class] filterUsingSelector:@selector(name) havingValue:@"myPanel"];
    UIView *panelView = [myPanel buildViewWithMaxBounds:CGRectZero viewState:self.page.currentViewState]; 
    panelView.frame = CGRectMake(50,50,200,250);
    // instead of hard coding the dimensions you can design the view in interface builder, read the frame and use it here to dimension and position the view with the generated view.
    [self.view addSubview:panelView];
    
}

@end
