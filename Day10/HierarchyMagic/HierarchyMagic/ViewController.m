//
//  ViewController.m
//  HierarchyMagic
//
//  Created by techmaster on 4/2/13.
//  Copyright (c) 2013 TechMaster. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    
}
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
	for (UIView *view in self.view.subviews) {
        if ([view isKindOfClass:[UIImageView class]]) //kiem tra kieu
        {
            UIImageView *imageView = (UIImageView*) view; //casting
            imageView.userInteractionEnabled = YES;
            
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                                  action:@selector(handleTap:)];
            [imageView addGestureRecognizer:tap];
        }
    }
}

- (void) handleTap: (UITapGestureRecognizer*) tapGesture
{
    NSLog(@"You click on me!");
    [self.view bringSubviewToFront:tapGesture.view];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)swapFigure:(id)sender {
    [self.view bringSubviewToFront:
     [self.view viewWithTag:3]];
    
    [self.view bringSubviewToFront:
     [self.view viewWithTag:2]];
    
    [self.view bringSubviewToFront:
     [self.view viewWithTag:1]];
}

@end
