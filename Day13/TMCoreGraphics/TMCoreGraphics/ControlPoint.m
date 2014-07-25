//
//  ControlPoint.m
//  TMCoreGraphics
//
//  Created by techmaster on 1/14/13.
//  Copyright (c) 2013 TechMaster. All rights reserved.
//

#import "ControlPoint.h"
#define POINT_RADIUS 15
@implementation ControlPoint
- (id) initAtPoint: (CGPoint) point
{
    CGRect rect = CGRectMake(point.x- POINT_RADIUS, point.y-POINT_RADIUS, POINT_RADIUS*2, POINT_RADIUS*2);
    _origin = point;
    if (self = [super initWithFrame:rect]){
        [self setBackgroundColor:[UIColor clearColor]];
        UIPanGestureRecognizer *panRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panControlPoint:)];
        [self addGestureRecognizer:panRecognizer];
    }
    return self;
}



- (void)drawRect:(CGRect)rect
{
    // Get handle to current CGContext
	CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextClearRect(context, rect);
 
    CGColorSpaceRef colorspace = CGColorSpaceCreateDeviceRGB();
    CGFloat components[] = {0.5, 0.5, 0.5, 0.5};
    CGColorRef graySemiTransparentColor = CGColorCreate(colorspace, components);
    
    CGContextSetFillColorWithColor(context, graySemiTransparentColor);
    CGContextSetStrokeColorWithColor(context, [UIColor redColor].CGColor);
    //Set the width of the pen mark
    float lineWidth = 1.0;
    CGContextSetLineWidth(context, lineWidth);
    
    //Path
    CGMutablePathRef path = CGPathCreateMutable();
    
    CGPathAddArc(path, NULL,  POINT_RADIUS, POINT_RADIUS, POINT_RADIUS-lineWidth-1, M_PI*2, 0, true);
    CGContextAddPath(context, path);
    CGContextDrawPath(context, kCGPathFillStroke);
    
    //Release
    CGPathRelease(path);
    CGColorRelease (graySemiTransparentColor);
    CGColorSpaceRelease(colorspace);
}

- (void) panControlPoint: (UIPanGestureRecognizer *) panRecognizer
{
    if ([panRecognizer state] == UIGestureRecognizerStateBegan || [panRecognizer state] == UIGestureRecognizerStateChanged) {
        CGPoint translation = [panRecognizer translationInView:self.superview];
        _origin.x = self.center.x + translation.x;
        _origin.y = self.center.y + translation.y;
        [self setCenter:CGPointMake(_origin.x, _origin.y)];
        [panRecognizer setTranslation:CGPointZero inView:self.superview];
        [self.superview setNeedsDisplay];
    }
    
}

@end
