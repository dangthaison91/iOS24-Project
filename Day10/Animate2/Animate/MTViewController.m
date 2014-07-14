//
//  MTViewController.m
//  Animate
//
//  Created by C. A. Beninati on 4/30/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MTViewController.h"

@interface MTViewController ()
{
    int points;
}
@end

@implementation MTViewController

- (IBAction)didTouchAnimate:(UIButton*)sender {
    

    CGSize boundSize = self.view.bounds.size;
    
    UIImageView *birdAnim = [[UIImageView alloc] initWithFrame:
                             CGRectMake(boundSize.width, boundSize.height, 128, 128)];
    birdAnim.animationImages = [[NSArray alloc] initWithObjects:
    [UIImage imageNamed: @"bird01.png"],
    [UIImage imageNamed: @"bird02.png"],
    [UIImage imageNamed: @"bird03.png"],
    [UIImage imageNamed: @"bird04.png"],
    [UIImage imageNamed: @"bird05.png"],
    [UIImage imageNamed: @"bird06.png"], nil];
    birdAnim.animationDuration = 1.0f;
    birdAnim.animationRepeatCount =0;
    [birdAnim startAnimating];
    
    [self.view addSubview:birdAnim];
    
    
    //Task: how to repeat this animation
    [UIView animateWithDuration:3.5f 
                          delay:0.1f 
                        options:UIViewAnimationCurveEaseInOut
                     animations:^{
                         [birdAnim setCenter:CGPointMake(100, 100)];
                         [birdAnim setAlpha:0.1f];
                     } 
                     completion:^(BOOL finished){
                         [birdAnim removeFromSuperview];
                         points++;
                         NSLog(@"points: %i", points);
                     }];    
    
    
   

}

@end
