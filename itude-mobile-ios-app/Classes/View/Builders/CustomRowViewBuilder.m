//
//  CustomRowViewBuilder 
//
//  Created by Pieter Kuijpers on 23-08-12.
//  Copyright (c) 2012 Itude Mobile. All rights reserved.
//

#import "CustomRowViewBuilder.h"
#import "MBRow.h"


@implementation CustomRowViewBuilder

- (UITableViewCell *)buildRowView:(MBRow *)row forIndexPath:(NSIndexPath *)indexPath viewState:(MBViewState)viewState
                     forTableView:(UITableView *)tableView
{
    // Dequeue or create a UITableViewCell like you would in a standard UITableViewController
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: @"customRowCell"];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"customRowCell"] autorelease];
        cell.imageView.image = [UIImage imageNamed:@"trololo.jpg"];
    }

    // You have access to the Document through row.document
    MBDocument *document = row.document;
    cell.textLabel.text = [document valueForPath:@"Form[0]/@title"];
    cell.detailTextLabel.text = [document valueForPath:@"Form[0]/@gender"];
    return cell;
}


@end