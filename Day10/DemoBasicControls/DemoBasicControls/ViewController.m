//
//  ViewController.m
//  DemoBasicControls
//
//  Created by techmaster on 8/1/13.
//  Copyright (c) 2013 Techmaster. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    UIButton * _buttonA;
}
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    _buttonA = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _buttonA.frame = CGRectMake(10, 10, 100, 44);
    [_buttonA setTitle:@"Hello World" forState:UIControlStateNormal];
    [self.view addSubview:_buttonA];
    
    [_buttonA addTarget:self
                 action:@selector(onButtonTap:)
       forControlEvents:UIControlEventTouchUpInside];
    
}

//- (void) onButtonTap: (id) sender
- (void) onButtonTap: (UIButton*) sender
{
    NSLog(@"Hello World");
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)onValueChange:(UISegmentedControl *)sender {
    NSLog(@"%d", sender.selectedSegmentIndex);
}

- (IBAction)onSliderChange:(UISlider *)sender {
}


@end
