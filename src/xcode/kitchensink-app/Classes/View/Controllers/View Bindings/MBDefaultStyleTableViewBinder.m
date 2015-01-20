//
//  MBDefaultStyleTableViewBinder.m
//  kitchensink-app
//
//  Created by Emiel Bon on 20-01-15.
//  Copyright (c) 2015 Itude Mobile. All rights reserved.
//

#import "MBDefaultStyleTableViewBinder.h"

@interface MBDefaultStyleTableViewBinder ()

@property (nonatomic, retain) NSString *cellTitleBindingIdentifier;

@end

@implementation MBDefaultStyleTableViewBinder

- (instancetype)initWithBindingIdentifier:(NSString *)identifier cellTitleBindingIdentifier:(NSString *)cellTitleBindingIdentifier
{
    self = [super initWithBindingIdentifier:identifier cellNib:nil];
    if (self) {
        self.cellTitleBindingIdentifier = cellTitleBindingIdentifier;
    }
    return self;
}

+ (instancetype)binderWithIdentifier:(NSString *)identifier cellTitleBindingIdentifier:(NSString *)cellTitleBindingIdentifier
{
	return [[[MBDefaultStyleTableViewBinder alloc] initWithBindingIdentifier:identifier
                                                  cellTitleBindingIdentifier:cellTitleBindingIdentifier] autorelease];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MBBuildState *state = [[self.state copy] autorelease];
    state.component = self.components[indexPath.row];
    state.element   = [state.component.document valueForPath:state.component.absoluteDataPath];
    
    NSString *reuseIdentifier = state.component.name;
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    
    if (!cell) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier] autorelease];
    }
    
    state.view = cell;
    cell.textLabel.bindingIdentifier = self.cellTitleBindingIdentifier;
    [state.mainViewBinder bindView:state];
    
    return cell;
}

@end
