//
//  ViewController.m
//  FlyingBird
//
//  Created by techmaster on 8/1/13.
//  Copyright (c) 2013 Techmaster. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)playGame:(id)sender {
    self.bird.center = CGPointMake(320-64, self.view.bounds.size.height-40);
    self.bird.alpha = 1.0;
    
    [UIView animateWithDuration:2 animations:^{
        self.bird.center = CGPointMake(64, 64);
        self.bird.alpha = 0;
    } completion:^(BOOL finished) {
        //[self.bird removeFromSuperview];
    }];
}
- (IBAction)checkDevice:(id)sender {
    NSLog(@"width=%2.1f, height=%2.1f", self.view.bounds.size.width, self.view.bounds.size.height);
    
    UIDevice *device = [UIDevice new];
}



@end
