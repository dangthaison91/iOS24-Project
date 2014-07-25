//
//  ViewDrawBasicText.m
//  TMCoreGraphics
//
//  Created by techmaster on 1/15/13.
//  Copyright (c) 2013 TechMaster. All rights reserved.
//

#import "ViewDrawBasicText.h"
#define kTextString "Hello"
#define kTextStringLength strlen(kTextString)
@implementation ViewDrawBasicText

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    
	CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context,[UIColor blackColor].CGColor);

	CGContextSelectFont(context, "BaroqueScript", 20.0, kCGEncodingMacRoman);
	CGContextSetTextMatrix(context, CGAffineTransformMakeScale(1.0, -1.0));
	CGContextSetTextDrawingMode(context, kCGTextFill);
    char *string = "Welcome to my home";
    
    
	CGContextShowTextAtPoint(context, 10.0, 40.0, string, strlen(string));
    
    //------- Up side down
   
    CGContextSetTextMatrix(context, CGAffineTransformIdentity);
	CGContextSetTextDrawingMode(context, kCGTextFill);
    CGContextShowTextAtPoint(context, 10.0, 60.0, string, strlen(string));
    
    //-------
    CGContextSetTextMatrix(context, CGAffineTransformMakeRotation(M_PI));
    CGContextSetTextDrawingMode(context, kCGTextFill);
    CGContextShowTextAtPoint(context, 310.0, 100.0, string, strlen(string));
    
    //------- Set spacing
    CGContextSelectFont(context, "KaushanScript-Regular", 20.0, kCGEncodingMacRoman);
    CGContextSetTextMatrix(context, CGAffineTransformMakeScale(1.0, -1.0));
	CGContextSetTextDrawingMode(context, kCGTextFill);
    CGContextSetCharacterSpacing(context, 5);
    CGContextShowTextAtPoint(context, 10.0, 140.0, string, strlen(string));

    //--- Rotate 45 degree 
    //cần điều chỉnh lại toạ độ y trước khi nhân nó với ma trận xoay nghiêng
    CGAffineTransform transform = CGAffineTransformConcat(CGAffineTransformMakeScale(1.0, -1.0), CGAffineTransformMakeRotation(-M_PI_4));
	CGContextSetTextMatrix(context, transform);
	CGContextSetTextDrawingMode(context, kCGTextStroke);
	CGContextShowTextAtPoint(context, 40.0, 340.0, string, strlen(string));
    
    //-- Unicode String
    
    CGContextSelectFont(context, "Palatino Linotype", 20.0, kCGEncodingMacRoman);
	CGContextSetTextMatrix(context, CGAffineTransformMakeScale(1.0, -1.0));
	CGContextSetTextDrawingMode(context, kCGTextFill);
    char *unicodeString = "Toi la Cuong";
    
	CGContextShowTextAtPoint(context, 10.0, 380.0, string, strlen(unicodeString));
    
   /* NSMutableAttributedString *aStr = [[NSMutableAttributedString alloc]initWithString:@"some UTF8 text"];
    
    CGContextSetRGBFillColor(context,1.0,1.0,1.0,1.0);
    [aStr setTextColor:[UIColor whiteColor]];
    
    CTLineRef line = CTLineCreateWithAttributedString((CFAttributedStringRef)aStr);
    CGContextSetTextPosition(context, x, y);
    
    CGContextSaveGState(context);
    
    CGContextClipToRect(context, clipRect); // if you want to clip the drawing
    CTLineDraw(line, context);
    CFRelease(line);
    
    CGContextRestoreGState(context);*/
    

}


@end
