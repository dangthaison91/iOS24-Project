//
//  Animal.m
//  QuizThings
//
//  Created by techmaster on 6/13/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

#import "Animal.h"

@implementation Animal
- (instancetype) init: (NSString*) name
             andImage: (NSString*) image  //* là kiểu con trỏ
         andDangerous: (BOOL) dangerous
{
    if (self = [super init:name andImage:image]) {
        self.dangerous = dangerous;
    }
    
    return self;
}
@end
