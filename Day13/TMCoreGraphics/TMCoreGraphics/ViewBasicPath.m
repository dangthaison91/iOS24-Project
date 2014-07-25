//
//  ViewBasicPath.m
//  TMCoreGraphics
//
//  Created by techmaster on 1/13/13.
//  Copyright (c) 2013 TechMaster. All rights reserved.
//

#import "ViewBasicPath.h"

@implementation ViewBasicPath

- (id)initWithFrame:(CGRect)frame {
	self = [super initWithFrame:frame];
	if (self) {
		// Initialization code
	}
	return self;
}

- (void)drawRect:(CGRect)rect {
	[super drawRect:rect];
	// Get handle to current CGContext
	CGContextRef context = UIGraphicsGetCurrentContext();
	CGMutablePathRef path = CGPathCreateMutable();
	CGRect squareRect = CGRectMake(30.0f, 50.0f, 100.0f, 100.0f);
	CGPathAddRect(path, NULL, squareRect);
	CGContextAddPath(context, path);
    
	CGAffineTransform tm = CGAffineTransformMakeTranslation(20, 20);
	CGPathAddRect(path, &tm, squareRect);
    
	CGContextAddPath(context, path);
    
    
	CGContextSetStrokeColorWithColor(context, [UIColor redColor].CGColor);
	CGContextDrawPath(context, kCGPathStroke);
	//---------
	CGMutablePathRef path2 = CGPathCreateMutable();
	CGRect circleRect = CGRectMake(30.0f, 50.0f, 100.0f, 100.0f);
	CGPathAddEllipseInRect(path2, NULL, circleRect);
	CGContextAddPath(context, path2);
	CGContextSetStrokeColorWithColor(context, [UIColor blueColor].CGColor);
	CGContextDrawPath(context, kCGPathFillStroke);
    
    
	//You must release CGMutablePathRef after use
	CGPathRelease(path);
	CGPathRelease(path2);
}

@end
