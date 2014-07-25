//
//  ViewBasicRectangle.m
//  TMCoreGraphics
//
//  Created by techmaster on 1/13/13.
//  Copyright (c) 2013 TechMaster. All rights reserved.
//

#import "ViewBasicRectangle.h"

@implementation ViewBasicRectangle

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    // Get handle to current CGContext
	CGContextRef context = UIGraphicsGetCurrentContext();
    
    
	// Set stroke width and color
	CGContextSetLineWidth(context, 1);
	CGContextSetRGBStrokeColor(context, 0.2f, 0.2f, 0.2f, 1.0f);
    
	// Draw red square
	CGRect squareRect = CGRectMake(30.0f, 50.0f, 100.0f, 100.0f);
	CGContextSetRGBFillColor(context, 1.0f, 0.0f, 0.0f, 0.3f);
	CGContextFillRect(context, squareRect);
	CGContextStrokeRect(context, squareRect);
}


@end
