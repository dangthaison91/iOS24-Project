//
//  ViewDrawLineBasic.m
//  TMCoreGraphics
//
//  Created by techmaster on 1/13/13.
//  Copyright (c) 2013 TechMaster. All rights reserved.
//

#import "ViewDrawLineBasic.h"

@implementation ViewDrawLineBasic

- (id)initWithFrame:(CGRect)frame {
	self = [super initWithFrame:frame];
	if (self) {
		// Initialization code
	}
	return self;
}

- (void)drawRect:(CGRect)rect {
	[super drawRect:rect];
    
	CGContextRef context = UIGraphicsGetCurrentContext();
	CGContextBeginPath(context);
	CGContextMoveToPoint(context, 0, 0);
	CGSize size = self.bounds.size;
	CGContextAddLineToPoint(context, size.width, size.height);
    
	CGContextSetStrokeColorWithColor(context, [UIColor redColor].CGColor);
	//Set the width of the pen mark
	CGContextSetLineWidth(context, 2.0);
    
	CGContextDrawPath(context, kCGPathStroke);
	// CGContextRelease(context);
}

@end
