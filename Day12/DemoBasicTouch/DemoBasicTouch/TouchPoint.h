//
//  TouchPoint.h
//  DemoBasicTouch
//
//  Created by techmaster on 1/12/13.
//  Copyright (c) 2013 TechMaster. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TouchPoint : NSObject
@property (nonatomic, assign) CGPoint point;
@property (nonatomic, assign) NSInteger state;

- (id) init: (CGPoint) point andState: (NSInteger) state;
@end
