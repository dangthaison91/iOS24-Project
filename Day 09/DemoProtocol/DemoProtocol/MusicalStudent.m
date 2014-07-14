//
//  MusicalStudent.m
//  DemoProtocol
//
//  Created by techmaster on 7/8/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

#import "MusicalStudent.h"

@implementation MusicalStudent

-(void) blewHarmonica
{
    NSLog(@"%@ can blew harmonica", self.fullName);
}

-(void) playGuitar
{
    NSLog(@"%@ can play guitar", self.fullName);
}

@end
