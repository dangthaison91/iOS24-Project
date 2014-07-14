//
//  Fruit.h
//  QuizThings
//
//  Created by techmaster on 6/13/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

#import "Thing.h"

@interface Fruit : Thing
@property (nonatomic, assign) BOOL eatable;

- (instancetype) init: (NSString *)name
             andImage: (NSString*)image
           andEatable: (BOOL) eatable;
@end
