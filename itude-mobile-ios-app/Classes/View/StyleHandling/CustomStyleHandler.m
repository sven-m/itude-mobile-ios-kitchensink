//
//  CustomStyleHandler.m
//  itude-mobile-ios-app
//
//  Created by Frank van Eenbergen on 7/20/11.
//  Copyright 2011 Itude Mobile. All rights reserved.
//

#import "CustomStyleHandler.h"
#import "CustomStyleConstants.h"
#import "CustomColor.h"

#import "MBFieldTypes.h"
#import "MBPanel.h"

@implementation CustomStyleHandler

// Override to customize the main view
- (void) applyStyle:(UIView *)contentView page:(MBPage *)page viewState:(MBViewState)viewState {
    [contentView setBackgroundColor:[UIColor lightGrayColor]];
}

-(void)styleLabel:(UIView *)view component:(MBField *)field{
    [super styleLabel:view component:field];
    
    if ([@"style2" isEqualToString:field.style ]){
        view.backgroundColor = [UIColor redColor];
    }
    if ([@"style3" isEqualToString:field.style ]){
        view.backgroundColor = [UIColor purpleColor];
    }
    
}

-(void)styleTableView:(UITableView *)tableView panel:(MBPanel *)panel viewState:(MBViewState)viewState{
    if ([@"style1" isEqualToString:panel.style ]){
        tableView.backgroundColor = [UIColor greenColor];
        tableView.contentInset = UIEdgeInsetsMake(60.0f, 0.0f, 0.0f, 60.0f);
        tableView.bounces = NO;
    }
}

- (void) styleNavigationBar:(UINavigationBar *)bar {
	bar.tintColor = [CustomStyleConstants getColor:CUSTOMNAVIGATIONBARCOLOR];
}

- (void)styleToolbar:(UIToolbar *)toolbar {
    toolbar.tintColor = [CustomStyleConstants getColor:CUSTOMTOOLBARCOLOR];
}


// Override to customize insets for a component (panel/tableview)
- (void) applyInsetsForComponent:(MBComponent *) component{

}

@end
