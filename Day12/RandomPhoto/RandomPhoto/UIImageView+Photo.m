//
//  UIImageView+Photo.m
//  RandomPhoto
//
//  Created by cuong minh on 6/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "UIImageView+Photo.h"
#import <QuartzCore/QuartzCore.h>
@implementation UIImageView (Photo)
- (void) makeItCool
{
    [self.layer setMasksToBounds:NO];
    
    // put a white border around the image view to make the image stand out from the background
    [self.layer setBorderWidth:5.0f];
    [self.layer setBorderColor:[[UIColor whiteColor] CGColor]];
    
    // add a shadow behind the image view to make it stand out even more
    [self.layer setShadowRadius:5.0f];
    [self.layer setShadowOpacity:.85f];
    [self.layer setShadowOffset:CGSizeMake(1.0f, 2.0f)];
    [self.layer setShadowColor:[[UIColor blackColor] CGColor]];
    [self.layer setShouldRasterize:YES];
    [self.layer setMasksToBounds:NO];
    

    CGAffineTransform transform = CGAffineTransformMakeRotation(((float)rand()/RAND_MAX - 0.5)*0.4);
    self.transform = transform;    
}

- (void) addGestureRecognizer
{
    self.userInteractionEnabled = YES;  //Don't forget this line
    self.multipleTouchEnabled = YES;  //Don't forget this line
    UIRotationGestureRecognizer *rotateRecognizer = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(rotateMe:)];
    [self addGestureRecognizer: rotateRecognizer];
    
    
    UIPinchGestureRecognizer *pinchRecognizer = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinchMe:)];
    [self addGestureRecognizer: pinchRecognizer];

}
- (void) rotateMe: (UIRotationGestureRecognizer *)rotateRecognizer
{
    CGAffineTransform transform = CGAffineTransformMakeRotation (rotateRecognizer.rotation);
    self.transform = transform;
}

- (void) pinchMe: (UIPinchGestureRecognizer *)pinchRecognizer
{    
    CGAffineTransform transform = CGAffineTransformMakeScale(pinchRecognizer.scale, pinchRecognizer.scale);
    self.transform = transform;
}


@end
