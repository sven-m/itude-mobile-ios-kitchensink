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

#import "CustomRowViewBuilder.h"

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
    cell.detailTextLabel.text = [panel customAttributeForKey:@"ponies"];
    return cell;
}


-(CGFloat)heightForPanel:(MBPanel *)panel atIndexPath:(NSIndexPath *)indexPath forTableView:(UITableView *)tableView {
    return [UIImage imageNamed:@"trololo.jpg"].size.height / 3;
}


@end