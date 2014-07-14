//
//  ViewController.m
//  BlockAnimation
//
//  Created by TechMaster on 3/19/14.
//  Copyright (c) 2014 TechMaster. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *cat;

@end

@implementation ViewController
- (void) viewDidLoad {
  //  self.cat.center = CGPointMake(50, 50);
}

- (IBAction)animate:(id)sender {
    self.cat.center = CGPointMake(50, 50);
    [UIView animateWithDuration:1 animations:^{
        self.cat.center = CGPointMake(280, 300);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:2 animations:^{
            self.cat.center = CGPointMake(50, 500);
        } completion:nil];
    }];
}



@end
