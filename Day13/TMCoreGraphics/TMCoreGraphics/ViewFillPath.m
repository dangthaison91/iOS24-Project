//
//  ViewFillPath.m
//  TMCoreGraphics
//
//  Created by techmaster on 1/14/13.
//  Copyright (c) 2013 TechMaster. All rights reserved.
//

#import "ViewFillPath.h"

@implementation ViewFillPath

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
	CGContextSetFillColorWithColor(context, [UIColor yellowColor].CGColor);
	CGContextSetStrokeColorWithColor(context, [UIColor redColor].CGColor);
	//Set the width of the pen mark
	CGContextSetLineWidth(context, 3.0);
    
	//Path0
	CGMutablePathRef path = CGPathCreateMutable();
	CGPathAddArc(path, NULL, 80, 80, 30, M_PI * 2, 0, true);
	CGPathAddArc(path, NULL, 80, 80, 50, M_PI * 2, 0, true);
	CGContextAddPath(context, path);
	CGContextDrawPath(context, kCGPathEOFill);
    
	//Path1
	CGMutablePathRef path1 = CGPathCreateMutable();
	CGPathAddArc(path1, NULL, 240, 80, 30, M_PI * 2, 0, true);
	CGPathAddArc(path1, NULL, 240, 80, 50, M_PI * 2, 0, true);
	CGContextAddPath(context, path1);
	CGContextDrawPath(context, kCGPathFill);
    
    
	//Path2
	CGMutablePathRef path2 = CGPathCreateMutable();
	CGPathAddArc(path2, NULL, 80, 200, 30, M_PI * 2, 0, true);
	CGPathAddArc(path2, NULL, 80, 200, 50, M_PI * 2, 0, true);
	CGContextAddPath(context, path2);
	CGContextDrawPath(context, kCGPathFillStroke);
    
	//Path3
	CGMutablePathRef path3 = CGPathCreateMutable();
	CGPathAddArc(path3, NULL, 240, 200, 30, M_PI * 2, 0, true);
	CGPathAddArc(path3, NULL, 240, 200, 50, M_PI * 2, 0, true);
	CGContextAddPath(context, path3);
	CGContextDrawPath(context, kCGPathEOFillStroke);
    
	//Don't forget to release all path reference otherwise memory leaking will happen
	CGPathRelease(path);
	CGPathRelease(path1);
	CGPathRelease(path2);
	CGPathRelease(path3);
}

@end
