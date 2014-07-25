//
//  ViewDrawLineByTap.m
//  TMCoreGraphics
//
//  Created by techmaster on 1/13/13.
//  Copyright (c) 2013 TechMaster. All rights reserved.
//

#import "ViewDrawLineByTap.h"
@interface ViewDrawLineByTap()
{
    NSInteger _lineDrawState;
    CGMutablePathRef _path;
    CGPoint _startPoint;    
}
@end
@implementation ViewDrawLineByTap

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
        
        [self addGestureRecognizer:tapGesture];
        _lineDrawState = -1;
        _path = CGPathCreateMutable();
    }
    return self;
}

- (void) customizeViewController: (UIViewController*) viewController
{
    [super customizeViewController:viewController];
    
    UIBarButtonItem *clearButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Clear" style:UIBarButtonItemStylePlain target:self action:@selector(clearAll)];
    viewController.navigationItem.rightBarButtonItem = clearButtonItem;
}
- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetStrokeColorWithColor(context, [UIColor blueColor].CGColor);
    CGContextAddPath(context, _path);
    CGContextDrawPath(context, kCGPathFillStroke);
}

- (void) clearAll
{
    CGPathRelease(_path);
    _path = CGPathCreateMutable();
    [self setNeedsDisplay];
}

- (void) cleanUpView
{
    CGPathRelease(_path);
    _viewController.navigationItem.rightBarButtonItem = nil;
}
- (void) handleTap: (UITapGestureRecognizer *) recognizer
{
    if (recognizer.state == UIGestureRecognizerStateRecognized)
    {
        switch (_lineDrawState) {
            case -1:
            {
                _startPoint = [recognizer locationInView:self];
                CGRect circleRect = CGRectMake(_startPoint.x-5, _startPoint.y-5, 10, 10);
                CGPathAddEllipseInRect(_path, &CGAffineTransformIdentity, circleRect);
                _lineDrawState = 0;
                break;
            }
            case 0:
            {
                CGPoint point = [recognizer locationInView:self];
                CGRect rectangleRect = CGRectMake(point.x-5, point.y-5, 10, 10);
                CGPathAddRect(_path, &CGAffineTransformIdentity, rectangleRect);
                
                CGPoint line[] = {{_startPoint.x,_startPoint.y}, {point.x,point.y}};
                CGPathAddLines(_path, &CGAffineTransformIdentity, line, 2);
                _lineDrawState = -1;
                break;

            }
            default:
                break;
        }
    }
    [self setNeedsDisplay];
}


@end
