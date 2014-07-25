//
//  ViewFillColor.m
//  TMCoreGraphics
//
//  Created by techmaster on 1/13/13.
//  Copyright (c) 2013 TechMaster. All rights reserved.
//

#import "ViewFillColor.h"
CGColorRef THRandomColor() {
	CGFloat red = (arc4random() % 256) / 255.0f;
	CGFloat green = (arc4random() % 256) / 255.0f;
	CGFloat blue = (arc4random() % 256) / 255.0f;
	return [UIColor colorWithRed:red green:green blue:blue alpha:1.0f].CGColor;
}


@interface ViewFillColor()
{
    NSTimer *_timer;
}
@end
@implementation ViewFillColor

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _timer = [NSTimer scheduledTimerWithTimeInterval: 1
                                                 target: self
                                               selector: @selector(refreshView)
                                               userInfo: nil
                                                repeats: YES];
    }
    return self;
}

//Draw random color
- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
	CGContextSetFillColorWithColor(context, THRandomColor());
	CGContextFillRect(context, rect);
    //Khong can goi ham nay !CGContextRelease(context);
}

- (void) refreshView
{
    [self setNeedsDisplay];
}

- (void) cleanUpView
{
    [_timer invalidate];
}

@end
