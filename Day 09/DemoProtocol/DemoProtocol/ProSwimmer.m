//
//  ProSwimmer.m
//  DemoProtocol
//
//  Created by techmaster on 7/8/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

#import "ProSwimmer.h"

@implementation ProSwimmer
-(void) breastStroke
{
    NSLog(@"%@ can swim breast stroke", self.fullName);
}

-(void) freeStyle
{
    NSLog(@"%@ can swim free style super fast", self.fullName);
}

-(void) butterfly
{
    NSLog(@"%@ can swim butter fly super fast", self.fullName);
}
@end
