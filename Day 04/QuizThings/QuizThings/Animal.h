//
//  Animal.h
//  QuizThings
//
//  Created by techmaster on 6/13/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

#import "Thing.h"

@interface Animal : Thing
@property (nonatomic, assign) BOOL dangerous;
- (instancetype) init: (NSString*) name
             andImage: (NSString*) image  //* là kiểu con trỏ
         andDangerous: (BOOL) dangerous; // là kiểu assign by value


@end
