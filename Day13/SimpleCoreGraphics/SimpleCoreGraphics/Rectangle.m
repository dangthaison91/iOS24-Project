//
//  Rectangle.m
//  SimpleCoreGraphics
//
//  Created by SonDT on 7/25/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

#import "Rectangle.h"

@implementation Rectangle

- (id)initWithFrame:(CGRect)frame {
	self = [super initWithFrame:frame];
	if (self) {
		// Initialization code
	}
	return self;
}

- (void)drawRect:(CGRect)rect {
	[super drawRect:rect];
	int angle = 45;
	[self drawRotaionRect:rect withAngle:45]
	;
}

- (void)drawRotaionRect:(CGRect)rect withAngle:(float)angle {
	CGContextRef context = UIGraphicsGetCurrentContext();
	CGContextSaveGState(context);
	CGContextSetFillColorWithColor(context, [UIColor whiteColor].CGColor);
    
	CGContextFillRect(context, rect);
    
    
	CGMutablePathRef path = CGPathCreateMutable();
    
	CGSize rectSize;
	CGPoint rectOrigin;
	rectSize.height = 120;
	rectSize.width = 120;
	rectOrigin.x = 100;
	rectOrigin.y = 410;
	CGSize size =    self.bounds.size;
    
	int transformX = rectOrigin.x + (rectSize.width / 2);
	int transformY = rectOrigin.y + (rectSize.height / 2);
	//int delta = cos(M_PI / 4) / (rectSize.width / 2) - rectSize.width / 2; // 2 * sin(M_PI / 4) * rectSize.width - rectSize.width;
	CGContextTranslateCTM(context, transformX, transformY);
    
	CGRect squareRect = CGRectMake(rectOrigin.x, rectOrigin.y, 120, 120);
	CGContextRotateCTM(context, M_PI * angle / 180);
	CGContextTranslateCTM(context, -transformX, -transformY);
    
	CGPathAddRect(path, NULL, squareRect);
	CGContextAddPath(context, path);
	CGContextSetLineWidth(context, 5.0f);
	CGContextSetStrokeColorWithColor(context, [UIColor redColor].CGColor);
    
	CGContextDrawPath(context, kCGPathStroke);
	CGContextFillRect(context, squareRect);
    
    
	CGPathRelease(path);
	CGContextRestoreGState(context);
}

@end
