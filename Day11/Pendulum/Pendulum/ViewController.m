//
//  ViewController.m
//  Pendulum
//
//  Created by techmaster on 5/13/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

#import "ViewController.h"
#define MAX_ANGLE M_PI / 4
@interface ViewController ()
{
	NSTimer *_timer;
	double _angle;
	double _angleDelta;
}
@property (weak, nonatomic) IBOutlet UIImageView *pendulum;
@property (weak, nonatomic) IBOutlet UISlider *sliderAngle;

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
    
	CGSize size = self.pendulum.bounds.size;
    
	self.pendulum.layer.anchorPoint = CGPointMake(0.5, 0.8);
	self.pendulum.frame = CGRectMake((self.view.bounds.size.width - size.width) * 0.5, 20,  size.width, size.height);
    
	_angle = 0.0;
	_angleDelta = 2 * M_PI / 60;
}

- (void)startAnimation {
	_timer = [NSTimer scheduledTimerWithTimeInterval:0.05
	                                          target:self
	                                        selector:@selector(animatePendulum)
	                                        userInfo:nil
	                                         repeats:YES];
	[_timer fire];
}

- (IBAction)startStopAnimation:(UISwitch *)sender {
	if ([sender isOn]) {
		[self startAnimation];
		self.sliderAngle.enabled = NO;
	}
	else if (_timer.isValid) {
		[_timer invalidate];
		_timer = nil;
		self.sliderAngle.enabled = YES;
	}
}

- (void)animatePendulum {
	_angle += _angleDelta;
	if ((_angle > MAX_ANGLE) | (_angle < -MAX_ANGLE)) {
		_angleDelta = -_angleDelta;
	}
	self.pendulum.transform = CGAffineTransformMakeRotation(_angle);
	NSLog(@"%3.2f - %3.2f", self.pendulum.center.x, self.pendulum.center.y);
}

- (IBAction)changeAngle:(UISlider *)sender {
	self.pendulum.transform = CGAffineTransformMakeRotation(MAX_ANGLE * sender.value);
}

@end
