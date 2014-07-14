//
//  ViewController.m
//  WeatherForecast
//
//  Created by SonDT on 6/10/14.
//  Copyright (c) 2014 SonDT. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () {
	NSArray *locations;
	NSString *currentLocation;
}
@property (weak, nonatomic) IBOutlet UILabel *lblLocation;
@property (weak, nonatomic) IBOutlet UILabel *lblDegree;
@property (weak, nonatomic) IBOutlet UIImageView *imgCity;

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	locations = @[@"Hà Nội", @"Hồ Chí Minh", @"Đà Nẵng", @"Huế"];
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
	[self updateData];
}

- (IBAction)updateLocation:(id)sender {
	[self updateData];
}

- (void)updateData {
	currentLocation = locations[arc4random() % [locations count]];
    
	self.lblLocation.text = currentLocation;
	self.lblDegree.text =
    [NSString stringWithFormat:@"%2.1f", [self getTemperature]];
	[self setCityImage:self.lblLocation];
	//  [self setCityImage2:location];
}

- (float)getTemperature {
	float temp = 8 + 40 / (1 + arc4random() % 11);
	return temp;
}

- (void)setCityImage:(UILabel *)lblLocation {
	if ([lblLocation.text isEqualToString:@"Hà Nội"]) {
		self.imgCity.image = [UIImage imageNamed:@"Hanoi.png"];
	}
	else if ([lblLocation.text isEqualToString:@"Huế"]) {
		self.imgCity.image = [UIImage imageNamed:@"Hue.png"];
	}
	else if ([lblLocation.text isEqualToString:@"Đà Nẵng"]) {
		self.imgCity.image = [UIImage imageNamed:@"DaNang.png"];
	}
	else if ([lblLocation.text isEqualToString:@"Hồ Chí Minh"]) {
		self.imgCity.image = [UIImage imageNamed:@"HCM.png"];
	}
}

- (void)setCityImage2:(NSString *)location2 {
	if ([location2 isEqualToString:@"Hà Nội"]) {
		self.imgCity.image = [UIImage imageNamed:@"Hanoi.png"];
	}
	else if ([location2 isEqualToString:@"Huế"]) {
		self.imgCity.image = [UIImage imageNamed:@"Hue.png"];
	}
	else if ([location2 isEqualToString:@"Đà Nẵng"]) {
		self.imgCity.image = [UIImage imageNamed:@"DaNang.png"];
	}
	else if ([location2 isEqualToString:@"Hồ Chí Minh"]) {
		self.imgCity.image = [UIImage imageNamed:@"HCM.png"];
	}
}

@end
