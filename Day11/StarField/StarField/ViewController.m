//
//  ViewController.m
//  StarField
//
//  Created by techmaster on 7/15/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

#import "ViewController.h"
#define deltaX 10
#define deltaY 10

@interface ViewController ()
{
	CGPoint center;
	int count;
	double delta;
	double x, x1, x2, x3;
	double y, y1, y2, y3;
	NSMutableArray *data;
}
@property (weak, nonatomic) IBOutlet UIImageView *brown;
@property (weak, nonatomic) IBOutlet UIImageView *green;
@property (weak, nonatomic) IBOutlet UIImageView *red;
@property (weak, nonatomic) IBOutlet UIImageView *violet;

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	data = [[NSMutableArray alloc]init];
	CGSize size = self.view.bounds.size;
	count = 0;
	x = 0;
	NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:0.1
	                                                  target:self
	                                                selector:@selector(sinAnimate:)
	                                                userInfo:@{ @"ID": @"OX-13", @"Date": [NSDate date] }
	                                                 repeats:YES];
	[timer fire];
	//[self sinAnimate:timer];
	//[self configureInitialPosition];
}

- (IBAction)animate:(id)sender {
	[UIView animateWithDuration:1 animations: ^{
	    //self.brown.center = CGPointMake(center.x - deltaX, center.y - deltaY);
	    self.green.center = CGPointMake(center.x + deltaX, center.y - deltaY);
	    self.red.center = CGPointMake(center.x + deltaX, center.y + deltaY);
	    self.violet.center = CGPointMake(center.x - deltaX, center.y + deltaY);
	} completion: ^(BOOL finished) {
	    [UIView animateWithDuration:1 animations: ^{
	        [self configureInitialPosition];
		}];
	}];
}

- (void)configureInitialPosition {
	//self.brown.center = center;
	self.red.center = center;
	self.green.center = center;
	self.violet.center = center;
}

- (void)sinAnimate:(NSTimer *)theTimer {
	//[UIView animateWithDuration:1 animations: ^{
	[data a]
    
	if (count % 5 == 0) {
		y = 150 + 150 * sin(x * M_PI / x);
		self.brown.center = CGPointMake(x, y);
        
		count++;
        
		// UIImage
		//} completion: ^(BOOL finished) {}];
	}
}

@end
