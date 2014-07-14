//
//  Fruit.m
//  QuizThings
//
//  Created by techmaster on 6/13/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

#import "Fruit.h"

@implementation Fruit
- (instancetype) init: (NSString *)name
             andImage: (NSString*)image
           andEatable: (BOOL) eatable
{
    if (self = [super init:name andImage:image]) {
        self.eatable = eatable;
    }
    return self;
}
@end
