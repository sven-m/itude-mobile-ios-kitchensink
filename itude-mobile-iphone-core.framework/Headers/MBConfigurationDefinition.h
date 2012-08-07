//
//  MBConfigurationDefinition.h
//  Core
//
//  Created by Robert Meijer on 5/12/10.
//  Copyright 2010 Itude. All rights reserved.
//

#import "MBDomainDefinition.h"
#import "MBDocumentDefinition.h"
#import "MBAttributeDefinition.h"
#import "MBActionDefinition.h"
#import "MBOutcomeDefinition.h"
#import "MBDialogDefinition.h"
#import "MBDialogGroupDefinition.h"
#import "MBPageDefinition.h"
#import "MBDefinition.h"

#define DOC_SYSTEM_EMPTY                  @"MBEmpty"
#define DOC_SYSTEM_LANGUAGE               @"MBBundle" 
#define DOC_SYSTEM_EXCEPTION              @"MBException"
#define PATH_SYSTEM_EXCEPTION_NAME        @"/Exception[0]/@name"
#define PATH_SYSTEM_EXCEPTION_DESCRIPTION @"/Exception[0]/@description"
#define PATH_SYSTEM_EXCEPTION_ORIGIN      @"/Exception[0]/@origin"
#define PATH_SYSTEM_EXCEPTION_OUTCOME     @"/Exception[0]/@outcome" 
#define PATH_SYSTEM_EXCEPTION_PATH        @"/Exception[0]/@path" 

#define DOC_SYSTEM_PROPERTIES             @"MBApplicationProperties"

@interface MBConfigurationDefinition : MBDefinition {
	NSMutableDictionary *_domainTypes;
	NSMutableDictionary *_documentTypes;
	NSMutableDictionary *_actionTypes;
	NSMutableArray *_outcomeTypes;
	NSMutableDictionary *_pageTypes;
	NSMutableDictionary *_dialogs;
	NSMutableDictionary *_dialogGroups;
	MBDialogDefinition *_firstDialog;
}

- (NSString *) asXmlWithLevel:(int)level;
- (void) addDomain:(MBDomainDefinition*)domain;
- (void) addDocument:(MBDocumentDefinition*)document;
- (void) addAction:(MBActionDefinition*)action;
- (void) addOutcome:(MBOutcomeDefinition*)outcome;
- (void) addPage:(MBPageDefinition*)page;
- (void) addDialog:(MBDialogDefinition*)dialog;
- (void) addDialogGroup:(MBDialogGroupDefinition*)dialogGroup;

- (MBDomainDefinition *) definitionForDomainName:(NSString *)domainName;
- (MBPageDefinition*) definitionForPageName:(NSString*) name;
- (MBActionDefinition *) definitionForActionName:(NSString *)actionName;
- (MBDocumentDefinition *) definitionForDocumentName:(NSString *)documentName;
- (MBDialogDefinition *) definitionForDialogName:(NSString *)dialogName;
- (MBDialogGroupDefinition *) definitionForDialogGroupName:(NSString *)dialogGroupName;
- (NSArray*) outcomeDefinitionsForOrigin:(NSString *)originName;
- (NSArray*) outcomeDefinitionsForOrigin:(NSString *) originName outcomeName:(NSString*) outcomeName;
- (NSMutableDictionary*) dialogs;
- (NSMutableDictionary*) dialogGroups;
- (NSMutableDictionary*) domains;
- (NSMutableDictionary*) actions;
- (NSMutableArray*) outcomes;
- (NSMutableDictionary*) documents;
- (NSMutableDictionary*) pages;
- (void) addAll:(MBConfigurationDefinition*) otherConfig;
- (MBDialogDefinition *) firstDialogDefinition;


@end