//
//  ViewController.m
//  DemoView
//
//  Created by cuong minh on 6/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize photoView;
@synthesize debugText;
@synthesize debugText2;
@synthesize tapGestureRecognizer;

- (void)viewDidLoad
{
    [super viewDidLoad];
	NSLog(@"viewDidLoad");
    [photoView addGestureRecognizer:tapGestureRecognizer];
}

- (void)viewDidUnload
{
    [self setPhotoView:nil];
    [self setDebugText:nil];
    [self setDebugText2:nil];
    [self setTapGestureRecognizer:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (void) didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation
{
    [self layoutSubviews];
}



- (void) viewWillAppear:(BOOL)animated
{
    NSLog(@"viewWillAppear");
}

- (void) viewDidAppear:(BOOL)animated 
{
    NSLog(@"viewDidAppear");
    
    for (UIView *view in self.view.subviews) {
        NSLog(@"%@", view);
    }
    NSString *debugInfo = [NSString stringWithFormat:@"Frame\norigin.x=%3.0f\norigin.y=%3.0f\nsize.width=%3.0f\nsize.height=%3.0f", photoView.frame.origin.x, photoView.frame.origin.y, photoView.frame.size.width, photoView.frame.size.height];
    debugText.text = debugInfo;
    
    NSString *debugInfo2 = [NSString stringWithFormat:@"Bound\norigin.x=%3.0f\norigin.y=%3.0f\nsize.width=%3.0f\nsize.height=%3.0f", photoView.bounds.origin.x, photoView.bounds.origin.y, photoView.bounds.size.width, photoView.bounds.size.height];
    
    debugText2.text = debugInfo2;
}

- (IBAction)handleTap:(id)sender {
    UITapGestureRecognizer *tap = (UITapGestureRecognizer *) sender;
    UIImageView *heart = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"heart.png"]];
    CGPoint point = [tap locationInView:photoView];
    heart.center = point;
    [photoView addSubview:heart];
}
/*
 12, 309, 146, 146
 
 166, 309, 146, 146
 
 320, 0, 146, 146
 
 320, 151, 146, 146
*/
- (void)layoutSubviews {
    NSLog(@"layout SubViews");
    UIDeviceOrientation orientation = [[UIDevice currentDevice] orientation];
    if (orientation == UIDeviceOrientationLandscapeLeft || orientation == UIDeviceOrientationLandscapeRight)
    {
        debugText.frame = CGRectMake(320, 20, 146, 146);
        debugText2.frame = CGRectMake(320, 161, 146, 146);
    }
    
    if (orientation ==UIDeviceOrientationPortrait)
    {
        debugText.frame = CGRectMake(12, 309, 146, 146);
        debugText2.frame = CGRectMake(166, 309, 146, 146);
        
    }
}

@end
