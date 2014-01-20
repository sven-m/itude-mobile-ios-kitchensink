/*
 * (C) Copyright Itude Mobile B.V., The Netherlands.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#import "CustomStyleHandler.h"
#import "CustomStyleConstants.h"
#import "CustomColor.h"

@implementation CustomStyleHandler

// Override to customize the main view
- (void) applyStyle:(UIView *)contentView page:(MBPage *)page viewState:(MBViewState)viewState {
    [contentView setBackgroundColor:[UIColor customViewBackgroundColor]];
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
    
    // Default MOBBL there is no Separator
    tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
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
