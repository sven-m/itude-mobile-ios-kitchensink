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

#import "CustomizedViewLogic.h"

@implementation CustomizedViewLogic 

-(void)viewDidLoad {
    [super viewDidLoad];
    [self rebuildView]; // create View out of page definition
						//[self.page registerValueChangeListener:self forPath:@"/Form[0]/@gender"];
	    [self registerOutcomeListener:self];
}

// MBValueChangeListener methods
-(void)valueChanged:(NSString *)value originalValue:(NSString *)originalValue forPath:(NSString *)path{
    if ([@"/Form[0]/@gender" isEqualToString:path]) {
        if ([@"male" isEqualToString:value]) {
            [self.page.document setValue:@"Watch Top Gear" forPath:@"/Form[0]/@comment"];
        }
        else{
            [self.page.document setValue:@"Watch Desperate Housewives" forPath:@"/Form[0]/@comment"];
        }
        [self rebuildView];
    }
}

// MBOutcomeListener methods. N.B. Outcomes are still handled by the ApplicationController
- (void) outcomeProduced:(MBOutcome*) outcome{
	if ([outcome.outcomeName isEqualToString:@"LOCAL-OUTCOME1"]) {
		MBDocument *doc = [[MBDataManagerService sharedInstance] loadDocument:@"OutcomeListenDoc"];
		[doc setValue:@"Before" forPath:@"/Message[0]/@content"];

		outcome.document = doc;

		UIAlertView *alert = [[[UIAlertView alloc] initWithTitle:@"Outcome started!" message:[outcome.document valueForPath:@"/Message[0]/@content"] delegate:nil cancelButtonTitle:@"Done!" otherButtonTitles:nil, nil] autorelease];
		[alert show];
	}
}

-(void)outcomeHandled:(MBOutcome *)outcome {
	if ([outcome.outcomeName isEqualToString:@"LOCAL-OUTCOME1"]) {
		UIAlertView *alert = [[[UIAlertView alloc] initWithTitle:@"Outcome handled!" message:[outcome.document valueForPath:@"/Message[0]/@content"] delegate:nil cancelButtonTitle:@"Done!" otherButtonTitles:nil, nil] autorelease];
		[alert show];
	}
}

@end
