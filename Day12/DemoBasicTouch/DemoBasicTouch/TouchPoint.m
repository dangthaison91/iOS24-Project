//
//  TouchPoint.m
//  DemoBasicTouch
//
//  Created by techmaster on 1/12/13.
//  Copyright (c) 2013 TechMaster. All rights reserved.
//

#import "TouchPoint.h"

@implementation TouchPoint
- (id) init: (CGPoint) point andState: (NSInteger) state
{
    if (self = [super init])
    {
        _point = point;
        _state = state;
    }
    return self;
}
@end
