//
//  ViewController.m
//  RollingBall
//
//  Created by TechMaster on 3/19/14.
//  Copyright (c) 2014 TechMaster. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    NSTimer *_timer;
    float _alpha;
    float _deltaAlpha;
    float _x;
    float _y;
}
@property (weak, nonatomic) IBOutlet UIImageView *ball;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)rollABall:(id)sender {
    _x = self.ball.center.x;
    _y = self.ball.center.y;
    _alpha = 0;
    _deltaAlpha = 0.1;
    _timer = [NSTimer scheduledTimerWithTimeInterval: 0.05
                                              target: self
                                            selector: @selector(animateBall)
                                            userInfo: nil                                             repeats: YES];
    [_timer fire];

}

- (void) animateBall
{
    _alpha += _deltaAlpha;
    self.ball.transform = CGAffineTransformMakeRotation(_alpha);
    _x += 32 * _deltaAlpha;
    self.ball.center = CGPointMake(_x, _y);
}
@end
