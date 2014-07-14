//
//  ViewController.m
//  DemoObjectiveLanguage
//
//  Created by techmaster on 6/17/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

#import "ViewController.h"
#import "Car.h" //Muốn dùng Class nào phải import nó. Swift không cần như vậy
#import "Taxi.h"
@interface ViewController ()
{
	int instantVar;
}
@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	instantVar = 100;
	data = @[@"Hello", @"Good Morning", @1, @3.14159];
	//@1 có nghĩa là boxing lại một giá trị primitive data type
	//@1 là một con trỏ trỏ đến đối tượng kiểu NSNumber đóng gói giá trị 1 bên trong
	if (1 == [@1 intValue]) {
		NSLog(@"Cool hai gia tri nay bang nhau");
	}
    
	if (1 == [data[2] intValue]) {
		NSLog(@"Cool hai gia tri nay cung bang nhau");
	}
    
	//Không có gì đảm bảo 2 biến dưới đây cùng một địa chỉ
	NSLog(@"%p - %p", @1, data[2]);  //%p in ra địa chỉ của đối tượng
    
	//Dùng -> để truy cập đến instant variable
	self->instantVar = 102;
}

- (IBAction)localvsInstantVariable:(id)sender {
	int thisIsLocalVariable = 10;
	NSLog(@"Local var = %d, Instant var = %d", thisIsLocalVariable, instantVar);
	if (instantVar > 50) {
		//temp sẽ chỉ được dùng trong nội bộ scope này
		NSString *temp = @"Instant Var is greater than 50";
		NSLog(@"%@", temp);
	}
}

- (IBAction)accessInstantVariable:(id)sender {
	//Car *car khai báo một con trỏ có kiểu là Car
	//Car carX = [Car new];
	Car *car = [Car new];  //[Car new] là cách viết của [[Car alloc] init]. Init == Initialize
	car->publicNum = 25;
    
	Taxi *taxi = [Taxi new];
	[taxi showDistanceMeter];
    
	taxi.name = @"Thanh Nga";  //Trong Objective C, dấu chấm . chuyên để truy xuất property thực chất là gọi hàm getter hoặc setter
	[taxi setName:@"Thanh Nga"];  //Gọi hàm setter function
    
	NSLog(@"%@", [taxi name]); //Gọi hàm getter function
    
    
	Car *carX = [[Car alloc] init:@"Mai Linh"
	                 andChasisNum:@"OX-13"];
	NSLog([carX description]);
}

@end
