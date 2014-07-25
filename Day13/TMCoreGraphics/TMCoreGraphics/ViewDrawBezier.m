//
//  ViewDrawBezier.m
//  TMCoreGraphics
//
//  Created by techmaster on 1/15/13.
//  Copyright (c) 2013 TechMaster. All rights reserved.
//

#import "ViewDrawBezier.h"
#import "ControlPoint.h"
@interface ViewDrawBezier()
{
    ControlPoint *startPoint;
    ControlPoint *controlPointA;
    ControlPoint *controlPointB;
    ControlPoint *endPoint;
}
@end
@implementation ViewDrawBezier

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        startPoint = [[ControlPoint alloc] initAtPoint:CGPointMake(20, 250)];
        controlPointA = [[ControlPoint alloc] initAtPoint:CGPointMake(80, 100)];
        controlPointB = [[ControlPoint alloc] initAtPoint:CGPointMake(140, 100)];
        endPoint = [[ControlPoint alloc] initAtPoint:CGPointMake(310, 350)];
        
        [self addSubview:startPoint];
        [self addSubview:controlPointA];
        [self addSubview:controlPointB];
        [self addSubview:endPoint];
    }
    return self;
}


- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    // Get handle to current CGContext
	CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetStrokeColorWithColor(context, [UIColor redColor].CGColor);
    //Set the width of the pen mark
    CGContextSetLineWidth(context, 2.0);
    
    //Two lines Path
    CGMutablePathRef linesPath = CGPathCreateMutable();
    CGPathMoveToPoint(linesPath, NULL, startPoint.origin.x, startPoint.origin.y);
    CGPathAddLineToPoint(linesPath, NULL, controlPointA.origin.x, controlPointA.origin.y);
    
    CGPathMoveToPoint(linesPath, NULL, endPoint.origin.x, endPoint.origin.y);
    CGPathAddLineToPoint(linesPath, NULL, controlPointB.origin.x, controlPointB.origin.y);
    
    CGContextAddPath(context, linesPath);
    CGContextDrawPath(context, kCGPathStroke);
    
    //Bezier Path
    CGMutablePathRef bezierPath = CGPathCreateMutable();
    CGContextSetStrokeColorWithColor(context, [UIColor blackColor].CGColor);
    //Set the width of the pen mark
    CGContextSetLineWidth(context, 4.0);
    
    CGPathMoveToPoint(bezierPath, NULL, startPoint.origin.x, startPoint.origin.y);
    CGPathAddCurveToPoint(bezierPath, NULL, controlPointA.origin.x, controlPointA.origin.y, controlPointB.origin.x, controlPointB.origin.y, endPoint.origin.x,  endPoint.origin.y);
    
    CGContextAddPath(context, bezierPath);
    CGContextDrawPath(context, kCGPathStroke);
    
    //Don't forget to release all path reference otherwise memory leaking will happen
    CGPathRelease(linesPath);
    CGPathRelease(bezierPath);
}


@end
