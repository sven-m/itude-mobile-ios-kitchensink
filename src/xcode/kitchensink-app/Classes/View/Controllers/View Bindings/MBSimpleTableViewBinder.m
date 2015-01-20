//
//  MBTableViewBinder.m
//  kitchensink-app
//
//  Created by Emiel Bon on 15-01-15.
//  Copyright (c) 2015 Itude Mobile. All rights reserved.
//

#import "MBSimpleTableViewBinder.h"
#import "MBBuildState.h"
#import "UIView+ViewBinding.h"

@implementation MBSimpleTableViewBinder

- (instancetype)initWithBindingIdentifier:(NSString *)identifier cellNib:(UINib *)cellNib
{
    self = [super initWithBindingIdentifier:identifier];
    if (self) {
        self.cellNib = cellNib;
    }
    return self;
}

+ (instancetype)binderWithIdentifier:(NSString *)identifier cellNib:(UINib *)cellNib
{
    return [[[MBSimpleTableViewBinder alloc] initWithBindingIdentifier:identifier cellNib:cellNib] autorelease];
}

- (void)viewWillDisappear:(BOOL)animated
{
    // Fuck this shit
}

- (void)viewDidDisappear:(BOOL)animated
{
    // Fuck this shit!!!
}

- (UIView *)bindView:(MBBuildState *)state
{
    self.state = [[state copy] autorelease];
    
    UIView *view = [self findSpecificView:state];
    
    if (view) {
        [self populateView:view withDataFromComponent:state.component];
    }
    
    return view;
}

- (void)populateView:(UIView *)view withDataFromComponent:(MBComponent *)component
{
    assert([view isKindOfClass:[UITableView class]]);
    
    self.components = [component childrenOfKind:[MBComponent class]];
    
    UITableView *tableView = (UITableView *)view;
    tableView.dataSource = self;
    tableView.delegate = self;
    [tableView reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.components.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MBBuildState *state = [[self.state copy] autorelease];
    state.component = self.components[indexPath.row];
    state.element   = [state.component.document valueForPath:state.component.absoluteDataPath];
 
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:state.component.name];
    
    if (!cell) {
        [tableView registerNib:self.cellNib forCellReuseIdentifier:state.component.name];
        cell = [tableView dequeueReusableCellWithIdentifier:state.component.name];
    }
    
    state.parent = cell;
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
