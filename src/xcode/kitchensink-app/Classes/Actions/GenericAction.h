//
//  CustomGenericAction.h
//  itude-mobile-ios-app
//
//  Created by Ricardo de Wilde on 7/25/11.
//  Copyright 2011 Itude Mobile. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "MBDocument.h"

@interface GenericAction : NSObject {
    
}

-(MBDocument *) buildPPSoapRequestDocument:(MBDocument *)doc withActionName:(NSString *)name;
-(void) setRequestParameter:(NSString *)value forKey:(NSString *)key forDocument:(MBDocument *)doc;



@end
