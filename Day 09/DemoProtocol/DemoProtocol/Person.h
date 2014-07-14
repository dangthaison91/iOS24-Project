//
//  Person.h
//  DemoProtocol
//
//  Created by techmaster on 7/8/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
@property (readonly) NSString* fullName;
- (instancetype) init: (NSString*) fullName;

@end
