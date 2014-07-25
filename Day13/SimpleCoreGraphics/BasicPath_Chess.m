//
//  BasicPath_Chess.m
//  SimpleCoreGraphics
//
//  Created by SonDT on 7/22/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

#import "BasicPath_Chess.h"

@implementation BasicPath_Chess

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
	CGContextSetFillColorWithColor(context, [UIColor whiteColor].CGColor);
	CGContextFillRect(context, rect);
    
	[self drawChessBoard:rect inContext:context];
	[self drawRotaionRect:rect inContext:context withAngle:45];
}

- (void)drawChessBoard:(CGRect)rect inContext:(CGContextRef)context {
	//
	//
    
	CGMutablePathRef path = CGPathCreateMutable();
	CGRect squareRect = CGRectMake(40, 100, 240, 240);
    
	//CGPathAddRect(path, &tm, squareRect);
	CGPathAddRect(path, NULL, squareRect);
	CGContextAddPath(context, path);
	CGContextSetLineWidth(context, 5.0f);
	CGContextSetStrokeColorWithColor(context, [UIColor blackColor].CGColor);
    
	CGContextDrawPath(context, kCGPathStroke);
	CGContextFillRect(context, squareRect);
	float x, y;
	x = 40; y = 100;
    
	for (int i = 1; i <= 8; i++) {
		for (int j = 1; j <= 8; j++) {
			CGRect squareRect = CGRectMake(x, y, 30, 30);
			CGPathAddRect(path, NULL, squareRect);
			CGContextAddPath(context, path);
            
            
			if (i % 2 == 0) {
				if (j % 2 != 0) {
					CGContextSetRGBFillColor(context, 0.0f, 0.0f, 0.0f, 1.0f);
				}
				else {
					CGContextSetRGBFillColor(context, 1.0f, 1.0, 1.0, 1.0f);
				}
			}
			else {
				if (j % 2 == 0) {
					CGContextSetRGBFillColor(context, 0.0f, 0.0f, 0.0f, 1.0f);
				}
				else {
					CGContextSetRGBFillColor(context, 1.0f, 1.0f, 1.0f, 1.0f);
				}
			}
			CGContextFillRect(context, squareRect);
            
			x += 30;
		}
		x = 40;
		y += 30;
	}
    
	CGPathRelease(path);
    
    
	//CGPathRelease(path2);//CGAffineTransform tm = CGAffineTransformMakeTranslation(20, 20);
	//CGPathAddRect(path, &tm, squareRect);
}

- (void)drawRotaionRect:(CGRect)rect inContext:(CGContextRef)context withAngle:(float)angle {
	//CGContextRef context = UIGraphicsGetCurrentContext();
	CGContextSaveGState(context);
    
    
    
	CGMutablePathRef path = CGPathCreateMutable();
    
	CGSize rectSize;
	CGPoint rectOrigin;
	rectSize.height = 120;
	rectSize.width = 120;
	rectOrigin.x = 100;
	rectOrigin.y = 410;
	//CGSize size =    self.bounds.size;
    
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
	//CGContextRestoreGState(context);
}

@end
