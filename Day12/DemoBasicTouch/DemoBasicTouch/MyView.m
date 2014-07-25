//
//  MyView.m
//  DemoBasicTouch
//
//  Created by techmaster on 1/12/13.
//  Copyright (c) 2013 TechMaster. All rights reserved.
//

#import "MyView.h"
#import "TouchPoint.h"
@interface MyView ()
{
    CGPoint touchLocation;
    NSInteger touchState;
    NSMutableArray *arrayPoint;
}
@end

@implementation MyView
- (id) init{
    if (self = [super init])
    {
        [self configureView];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder])
    {
        [self configureView];
        
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
       [self configureView];
    }
    return self;
}

- (void) configureView
{
    touchState = -1;
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 1);
    CGContextSetRGBStrokeColor(context, 0.2f, 0.2f, 0.2f, 1.0f);
    arrayPoint = [NSMutableArray new];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
*/

- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    for (TouchPoint *tp in arrayPoint) {
        if (tp.state == 0) {
            CGRect circleRect = CGRectMake(tp.point.x, tp.point.y, 20.0f, 20.0f);
            CGContextSetFillColorWithColor(context, [UIColor blueColor].CGColor);
            CGContextFillEllipseInRect(context, circleRect);
            CGContextStrokeEllipseInRect(context, circleRect);
            CGContextBeginPath(context);
            CGContextMoveToPoint(context, tp.point.x, tp.point.y);
        } else if (tp.state ==1)
        {
            CGContextAddLineToPoint(context, tp.point.x, tp.point.y);
            
        } else if (tp.state ==2)
        {
            CGContextAddLineToPoint(context, tp.point.x, tp.point.y);
            CGContextDrawPath(context, kCGPathStroke);
        }
    }
    
}

#pragma mark UIResponder
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    touchLocation = [touch locationInView: self];
    
    [arrayPoint addObject:[[TouchPoint alloc] init:touchLocation andState:0]];
    [self setNeedsDisplay];
   
}
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    /*UITouch *touch = [touches anyObject];
    touchLocation = [touch locationInView: self];

    [arrayPoint addObject:[[TouchPoint alloc] init:touchLocation andState:1]];
    [self setNeedsDisplay];*/

}
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    touchLocation = [touch locationInView: self];
   
    [arrayPoint addObject:[[TouchPoint alloc] init:touchLocation andState:2]];
    [self setNeedsDisplay];

}


@end
