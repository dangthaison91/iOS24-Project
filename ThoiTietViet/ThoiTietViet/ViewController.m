//
//  ViewController.m
//  ThoiTietViet
//
//  Created by techmaster on 6/10/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    NSArray* locations;
    NSArray* quotes;
    NSArray* photos;
}
@property (weak, nonatomic) IBOutlet UILabel *location;
@property (weak, nonatomic) IBOutlet UILabel *temperatureLabel;
@property (weak, nonatomic) IBOutlet UILabel *quote;
@property (weak, nonatomic) IBOutlet UIImageView *photo;

@end

@implementation ViewController
//viewDidLoad là hàm hứng sự kiện chuẩn của ViewController
- (void)viewDidLoad
{
    [super viewDidLoad];
	locations = @[@"Hà nội", @"Hải phòng", @"Đà nẵng", @"Hồ Chí Minh", @"Hoàng Sa", @"Trường Sa"];
    quotes = @[@"Một con ngựa đau cả tàu bỏ cỏ", @"Có công mài sắt có ngày nên kim", @"Cờ bạc là bác thằng bần", @"Chớ thấy sóng cả mà ngã tay chèo", @"Phi thương bất phú"];
    
}
//viewWillAppear là hàm hứng sự kiện chuẩn của ViewController
- (void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self updateData];
}

- (IBAction)updateLocation:(id)sender {
    [self updateData];
}

- (void) updateData {
    self.location.text = locations[arc4random() % [locations count]];
    
    self.temperatureLabel.text = [NSString stringWithFormat:@"%2.1f", [self getTemperature]];
    
    self.quote.text = [self getRandomQuote];
}
- (float) getTemperature
{
    float temperature = 8 + 30/(1 + arc4random() % 10);
    return temperature;
}

- (NSString*) getRandomQuote
{
    return quotes[arc4random() % [quotes count]];
}

@end
