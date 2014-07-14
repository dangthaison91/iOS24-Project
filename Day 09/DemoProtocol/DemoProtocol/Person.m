//
//  Person.m
//  DemoProtocol
//
//  Created by techmaster on 7/8/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

#import "Person.h"

@implementation Person
- (instancetype) init: (NSString*) fullName
{
    self = [super init];
    _fullName = fullName;
    return self;
}
@end
