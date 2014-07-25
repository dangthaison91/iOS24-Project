//
//  TMTextLayer.m
//  TMCoreGraphics
//
//  Created by techmaster on 2/8/13.
//  Copyright (c) 2013 TechMaster. All rights reserved.
//

#import "TMTextLayer.h"

@implementation TMTextLayer
- (id) initAt: (CGPoint) center withFont: (UIFont *) font andText: (NSString *) text
{
    if (self = [super init]){
        _center = center;
        _textFont = font;
        
        CGFontRef fontRef = CGFontCreateWithFontName((__bridge CFStringRef)_textFont.fontName);
        self.font = fontRef;
        self.fontSize = _textFont.pointSize;
        
        CGColorSpaceRef colorspace = CGColorSpaceCreateDeviceRGB();
        CGFloat components[] = {0, 0, 0, 0};
        CGColorRef transparentColor = CGColorCreate(colorspace, components);
        self.backgroundColor = transparentColor;
        self.alignmentMode = @"center";
        self.wrapped = NO;
        
        [self setString:text];
        
        CGColorRelease(transparentColor);
        CGColorSpaceRelease(colorspace);
        CGFontRelease(fontRef);
    }
    return self;
}

- (void) setString:(id)string
{
    [super setString:string];
    CGSize labelSize = [string sizeWithFont:_textFont];
    self.frame = CGRectMake(_center.x- labelSize.width/2, _center.y - labelSize.height/2, labelSize.width, labelSize.height);
    
}
@end
