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

#import "PageWithXibFileViewController.h"

@interface PageWithXibFileViewController ()

@end

@implementation PageWithXibFileViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // get the field and button definitions from the page (ensures localization and data parsing is handled by the framework).
    _myField = [self.page firstDescendantOfKind:[MBField class] filterUsingSelector:@selector(name) havingValue:@"inputfield"];
    _myButton = [self.page firstDescendantOfKind:[MBField class] filterUsingSelector:@selector(name) havingValue:@"button"];
    
    // copy the values from the page into the interface builder objects
    _label.text = [_myField label];
    _textField.text = [_myField value];
    [_button setTitle:_myButton.label forState:UIControlStateNormal];
    [_button.titleLabel setNeedsLayout];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

-(IBAction) buttonPressed{
    [_myField setValue:_textField.text];
    [[MBDataManagerService sharedInstance] storeDocument:self.page.document];
    
}


@end
