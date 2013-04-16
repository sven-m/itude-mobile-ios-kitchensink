//
//  CustomRowViewBuilder 
//
//  Created by Pieter Kuijpers on 23-08-12.
//  Copyright (c) 2012 Itude Mobile. All rights reserved.
//

#import "CustomRowViewBuilder.h"
#import "MBForEachItem.h"
#import "MBPanel.h"


@implementation CustomRowViewBuilder

- (UITableViewCell *)buildTableViewCellFor:(MBPanel *)panel forIndexPath:(NSIndexPath *)indexPath viewState:(MBViewState)viewState forTableView:(UITableView *)tableView
{
    // Dequeue or create a UITableViewCell like you would in a standard UITableViewController
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: @"customRowCell"];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"customRowCell"] autorelease];
        cell.imageView.image = [UIImage imageNamed:@"trololo.jpg"];
    }
    
    // You have access to the Document through component.document
    MBDocument *document = panel.document;
    cell.textLabel.text = [document valueForPath:@"Form[0]/@title"];
    cell.detailTextLabel.text = @"CustomRowViewBuilder";
    return cell;
}


-(CGFloat)heightForPanel:(MBPanel *)panel atIndexPath:(NSIndexPath *)indexPath forTableView:(UITableView *)tableView {
    return [UIImage imageNamed:@"trololo.jpg"].size.height / 3;
}


@end