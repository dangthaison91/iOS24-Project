//
//  CustomView.m
//  SimpleCoreGraphics
//
//  Created by techmaster on 7/22/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

#import "CustomView.h"

@implementation CustomView
- (void)drawRect:(CGRect)rect
{
    
    CGContextRef context = UIGraphicsGetCurrentContext();
	CGContextSetFillColorWithColor(context, [UIColor whiteColor].CGColor);
	CGContextFillRect(context, rect);
    
   
    //Chuẩn bị vẽ một đường
    CGContextBeginPath(context);
    
    //Chuyển đến một điểm
    CGContextMoveToPoint(context, 0, 0);
    CGSize size = self.bounds.size;
    
    //Kéo một đường từ một điểm đến một điểm
    CGContextAddLineToPoint(context, size.width, size.height);
    
    CGContextSetStrokeColorWithColor(context, [UIColor redColor].CGColor);
    //Set the width of the pen mark
    CGContextSetLineWidth(context, 2.0);
    
    CGContextDrawPath(context, kCGPathStroke);
    
}


@end
