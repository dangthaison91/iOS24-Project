//
//  ViewDrawArc.m
//  TMCoreGraphics
//
//  Created by techmaster on 1/14/13.
//  Copyright (c) 2013 TechMaster. All rights reserved.
//

#import "ViewDrawArc.h"
#import "ControlPoint.h"

@interface ViewDrawArc()
{
    ControlPoint *startPoint;
    ControlPoint *midPoint;
    ControlPoint *endPoint;
}
@end
@implementation ViewDrawArc

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        startPoint = [[ControlPoint alloc] initAtPoint:CGPointMake(20, 250)];
        
        midPoint = [[ControlPoint alloc] initAtPoint:CGPointMake(100, 100)];
        
        endPoint = [[ControlPoint alloc] initAtPoint:CGPointMake(310, 350)];
        [self addSubview:startPoint];
        [self addSubview:midPoint];
        [self addSubview:endPoint];
    }
    return self;
}

//See more at this site
//http://blogs.sitepointstatic.com/examples/tech/canvas-curves/quadratic-curve.html

//http://jsdraw2d.jsfiction.com/demo/curvesbezier.htm
- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    // Get handle to current CGContext
	CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetStrokeColorWithColor(context, [UIColor redColor].CGColor);
    //Set the width of the pen mark
    CGContextSetLineWidth(context, 2.0);
    
    //Two lines Path
    CGMutablePathRef path = CGPathCreateMutable();   
    CGPathMoveToPoint(path, NULL, startPoint.origin.x, startPoint.origin.y);
    CGPathAddLineToPoint(path, NULL, midPoint.origin.x, midPoint.origin.y);
    CGPathAddLineToPoint(path, NULL, endPoint.origin.x, endPoint.origin.y);
    
    CGContextAddPath(context, path);
    CGContextDrawPath(context, kCGPathStroke);
    
    //Bezier Path
    CGMutablePathRef bezierPath = CGPathCreateMutable();
    CGContextSetStrokeColorWithColor(context, [UIColor blackColor].CGColor);
    //Set the width of the pen mark
    CGContextSetLineWidth(context, 4.0);
    
    CGPathMoveToPoint(bezierPath, NULL, startPoint.origin.x, startPoint.origin.y);
    CGPathAddCurveToPoint(bezierPath, NULL, midPoint.origin.x, midPoint.origin.y, midPoint.origin.x, midPoint.origin.y, endPoint.origin.x,  endPoint.origin.y);
    
    CGContextAddPath(context, bezierPath);
    CGContextDrawPath(context, kCGPathStroke);
    
    //Don't forget to release all path reference otherwise memory leaking will happen
    CGPathRelease(path);
    CGPathRelease(bezierPath);
}


@end
