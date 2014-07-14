//
//  ButtonViewController.m
//  Day 06
//
//  Created by SonDT on 6/27/14.
//  Copyright (c) 2014 SonDT. All rights reserved.
//

#import "ButtonViewController.h"

@interface ButtonViewController ()
@property (weak, nonatomic) UIButton *button;
@end

@implementation ButtonViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
	self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
	if (self) {
		// Custom initialization
	}
	return self;
}

- (void)viewDidLoad {
	[super viewDidLoad];
	[self getScreenSize];
	[self createCustomButton];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
 {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */


#pragma mark - Screensize

- (void)getScreenSize {
	NSLog(@"%f - %f", self.view.bounds.size.height, self.view.bounds.size.width);
}

- (void)createCustomButton {
	//CGSize screenSize = self.view.bounds.size;
    
    
	int count = 0;
    
	float xPoint, yPoint;
	xPoint = 20;
	yPoint = 100;
	for (int i = 1; i < 6; i++) {
		for (int j = 1; j < 5; j++) {
			count++;
			//	UIButton *button = CGRect
			self.button = [UIButton buttonWithType:UIButtonTypeSystem];
			[self.button setTitle:[NSString stringWithFormat:@"%d", count] forState:UIControlStateNormal];
			[self.button setTitle:@"Super Button" forState:UIControlStateHighlighted];
			self.button.frame = CGRectMake(xPoint, yPoint, 60, 40);
			self.button.backgroundColor = [UIColor redColor];
			//  button.layer.borderColor = [UIColor blackColor].CGColor;
			// button.layer.borderWidth = 0.5f;
			self.button.layer.cornerRadius = 10.0f;
			[self.button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            
			[self.view addSubview:self.button];
			xPoint += 70;
		}
        
		xPoint = 20; yPoint += 60;
	}
}

@end
