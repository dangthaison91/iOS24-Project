//
//  ViewController.m
//  DemoBasicGestureRecognizer
//
//  Created by techmaster on 7/18/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *grass;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    UITapGestureRecognizer* tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                                 action:@selector(onTap:)];
    self.grass.userInteractionEnabled = YES;
    self.grass.multipleTouchEnabled = YES;
    
	[self.grass addGestureRecognizer: tapGesture];
}

- (void) onTap: (UITapGestureRecognizer*) tap
{
    CGPoint point = [tap locationInView:self.view];
   // NSLog(@"x=%f - y=%f", point.x, point.y);
    UIImageView *ant = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ant.png"]];
    ant.center = point;
    [self.grass addSubview:ant];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
