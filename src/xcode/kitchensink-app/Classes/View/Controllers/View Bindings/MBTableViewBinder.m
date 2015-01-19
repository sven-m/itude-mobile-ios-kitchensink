//
//  MBTableViewBinder.m
//  kitchensink-app
//
//  Created by Emiel Bon on 15-01-15.
//  Copyright (c) 2015 Itude Mobile. All rights reserved.
//

#import "MBTableViewBinder.h"
#import "MBBuildState.h"
#import "UIView+ViewBinding.h"

@interface MBTableViewBinder()

@property (nonatomic, retain) MBBuildState   *state;
@property (nonatomic, retain) NSMutableArray *components;
@property (nonatomic, retain) UINib          *cellNib;

@end

@implementation MBTableViewBinder

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
    return [[[MBTableViewBinder alloc] initWithBindingIdentifier:identifier cellNib:cellNib] autorelease];
}

- (UIView *)bindView:(MBBuildState *)state
{
    self.state = [[state copy] autorelease];
    self.components = [self.state.component childrenOfKind:[MBComponent class]];
    UIView *view = [state.parent viewWithBindingIdentifier:self.identifier];
    
    assert ([view isKindOfClass:[UITableView class]]);
    
    UITableView *tableView = (UITableView *)view;
    tableView.dataSource = self;
    [tableView reloadData];
    
    return view;
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

@end
