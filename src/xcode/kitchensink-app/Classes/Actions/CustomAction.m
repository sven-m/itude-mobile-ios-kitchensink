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

#import "CustomAction.h"
#import "MBOutcome.h"
#import "MBDocument.h"
#import "MBDocumentDefinition.h"
#import "MBDataManagerService.h"

@implementation CustomAction

-(MBOutcome*) execute:(MBDocument *)document withPath:(NSString *)path {
    // Do some custom logic here, for example retrieve device properties and pass them to a page

    // load a document from the central Data Manager Service
    MBDocument *doc = [[MBDataManagerService sharedInstance] loadDocument: @"ApplicationState"];    
    // change the document
    [doc setValue:[[UIDevice currentDevice] description] forPath:@"Device[0]/@deviceType"];
    
    // create the Outcome with data included in it and return it to the Application Controller
    MBOutcome *oc = [[[MBOutcome alloc] init] autorelease];
    oc.outcomeName = @"OUTCOME-display-device-info";
    oc.noBackgroundProcessing = TRUE;
    oc.transferDocument = TRUE;
    oc.document = doc;
	return oc;
}

@end
