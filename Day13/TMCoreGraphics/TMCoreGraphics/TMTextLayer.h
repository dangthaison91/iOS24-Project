//
//  TMTextLayer.h
//  TMCoreGraphics
//
//  Created by techmaster on 2/8/13.
//  Copyright (c) 2013 TechMaster. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

@interface TMTextLayer : CATextLayer
@property (nonatomic, assign) CGPoint center;
@property (nonatomic, strong) UIFont *textFont;
- (id) initAt: (CGPoint) center withFont: (UIFont *) font andText: (NSString *) text;
@end
