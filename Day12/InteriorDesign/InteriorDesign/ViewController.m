//
//  ViewController.m
//  InteriorDesign
//
//  Created by techmaster on 7/18/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *cay1;
@property (weak, nonatomic) IBOutlet UIImageView *cay2;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIPanGestureRecognizer* pan1 = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panObject:)];
    [self.cay1 addGestureRecognizer:pan1];
    
    
    UIPanGestureRecognizer* pan2 = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panObject:)];
    [self.cay2 addGestureRecognizer:pan2];
}

- (void) panObject: (UIPanGestureRecognizer*) gestureRecognizer
{
    UIView* piece = gestureRecognizer.view;
    
    if ([gestureRecognizer state] == UIGestureRecognizerStateBegan || [gestureRecognizer state] == UIGestureRecognizerStateChanged) {
        CGPoint translation = [gestureRecognizer translationInView:[piece superview]];
        
        [piece setCenter:CGPointMake([piece center].x + translation.x, [piece center].y + translation.y)];
        [gestureRecognizer setTranslation:CGPointZero inView:[piece superview]];
    }
    
}
@end
