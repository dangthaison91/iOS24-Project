//
//  ControlPoint.h
//  TMCoreGraphics
//
//  Created by techmaster on 1/14/13.
//  Copyright (c) 2013 TechMaster. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ControlPoint : UIView
- (id) initAtPoint: (CGPoint) point;
@property (nonatomic, assign) CGPoint origin;
@end
