//
//  MBDefaultStyleTableViewBinder.m
//  kitchensink-app
//
//  Created by Emiel Bon on 20-01-15.
//  Copyright (c) 2015 Itude Mobile. All rights reserved.
//

#import "MBDefaultStyleTableViewBinder.h"

@implementation MBDefaultStyleTableViewBinder

+ (instancetype)binderWithIdentifier:(NSString *)identifier cellNib:(UINib *)cellNib
{
    return [[[MBDefaultStyleTableViewBinder alloc] initWithBindingIdentifier:identifier cellNib:cellNib] autorelease];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MBBuildState *state = [[self.state copy] autorelease];
    state.component = self.components[indexPath.row];
    state.element   = [state.component.document valueForPath:state.component.absoluteDataPath];
    
    NSString *reuseIdentifier = state.component.name;
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    }
    
    state.view = cell;
    
    cell.textLabel.bindingIdentifier = @"";
    
    [state.mainViewBinder bindView:state];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    MBComponent *component = self.components[indexPath.row];
    assert([component isKindOfClass:[MBPanel class]]);
    MBPanel *panel = (MBPanel *)component;
    [panel handleOutcome:panel.outcomeName withPathArgument:panel.absoluteDataPath];
}

@end
