//
//  ViewController.m
//  QuizThings
//
//  Created by techmaster on 6/13/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

#import "ViewController.h"
#import "ScoreViewController.h"
#import "Thing.h"
#import "Animal.h"
#import "Fruit.h"
#import <AudioToolbox/AudioToolbox.h>

@interface ViewController () <UITextFieldDelegate, UIAlertViewDelegate>  //Adopt protocol : Ví dụ 2 anh da đen sinh đôi
// Delegate: uỷ nhiệm
{
	NSArray *array; //Không thay đổi được vị trí phần tử, hoặc bớt đi
	NSMutableArray *data;  //thêm, bớt phần tử thoải mái
    
	__weak IBOutlet UITextField *answer; //__weak không chủ động sở hữu đối tượng
	__weak IBOutlet UIButton *photo; // cùng = cấp vs property,nhưng lưu trên instant var nhanh hơn
    
	Thing *thing; //Phải sử dụng biến instant var (ivar) để lưu giữ đối tượng được chọn
	int countPlay;
	int countError;
	int countPoint;
	SystemSoundID sound;
}

@property (weak, nonatomic) IBOutlet UILabel *hint;
@end

@implementation ViewController


- (void)viewDidLoad {
	[super viewDidLoad];
	array = @[
              [[Thing alloc] init:@"iron" andImage:@"iron.png"],
              [[Animal alloc] init:@"cat" andImage:@"cat.png" andDangerous:NO],
              [[Animal alloc] init:@"dog" andImage:@"dog.png" andDangerous:YES],
              [[Animal alloc] init:@"elephant" andImage:@"elephant.png" andDangerous:YES],
              [[Fruit alloc] init:@"orange" andImage:@"orange.png" andEatable:YES],
              [[Fruit alloc] init:@"pepper" andImage:@"pepper.png" andEatable:NO],
              [[Fruit alloc] init:@"strawberry" andImage:@"strawberry.png" andEatable:YES]
              ];
	data = [NSMutableArray arrayWithArray:array];
	countPlay = 0;
	self->answer.delegate = self;           //Có thể thay bằng kéo property delegate ở giao diện vào ViewController ẩn bàn phím ảo
	countPoint = 0;
}

- (void)viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
	[self randomDisplayImage];
}

- (IBAction)onTapPhoto:(id)sender {
	[self randomDisplayImage];
}

- (void)randomDisplayImage {
	//Phần là phần khởi tạo ban đầu
	countError = 0;
	self->answer.text = @"";
	long bound = [data count] - countPlay;
    
	//Phần logic
    
	//		UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Finish"
	//		                                                message:[NSString stringWithFormat:@" Your score : %d", countPoint]
	//		                                               delegate:self
	//		                                      cancelButtonTitle:@"End Game!"
	//		                                      otherButtonTitles:nil, nil];
	//		[alert show];
	//
    
    
	//		UIStoryboard *storyboard1 = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
	//		[self prepareForSegue:self sender:self withModal:@"ModalScore" withScore:self->countPoint];
    
	if (bound < 1) {
		[self displayScore:self->countPoint];
		return;
	}
	int randomIndex = arc4random() % bound;               //% chia lấy phần dư ~ modulo
	self->thing = (Thing *)data[randomIndex];               //(Thing*) ép kiểu: type casting
    
	[photo setImage:self->thing.image forState:UIControlStateNormal];
	[self displayHint:self->thing];
	[data exchangeObjectAtIndex:randomIndex withObjectAtIndex:bound - 1];
	countPlay++;
}

- (IBAction)displayHint:(Thing *)athing {
	if ([athing isMemberOfClass:[Animal class]]) {
		Animal *animal = (Animal *)athing;
		if (animal.dangerous) {
			self.hint.text = @"Con vật này nguy hiểm";
			return;
		}
	}
	else if ([athing isMemberOfClass:[Fruit class]]) {
		Fruit *fruit = (Fruit *)athing;
		if (fruit.eatable) {
			self.hint.text = @"Quả này ăn được";
			return;
		}
	}
	self.hint.text = @"";
}

- (IBAction)loopAllThings:(id)sender {
	// Vòng lặp lặp qua tất cả các phần tử trong mảng
	//id là con trỏ có gán vào đối tượng của bất kỳ kiểu nào
	//trong trường hợp này không được phép dùng instance type
	for (id object in array) {
		NSLog(@"%@", [object description]);                //%@ thực ra gọi [object description]
	}
    
	/*for (int i=0; i < 10; i++) {
     NSLog(@"%d", i);
     }*/
    
	for (int i = 0; i < [array count]; i++) {
		NSLog(@"%@", [array[i] description]);
	}
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
	if ([textField isFirstResponder]) {               //Kiểm tra xem text field đang có bàn phím ảo dâng lên hay không?
		if ([[textField.text lowercaseString] isEqualToString:self->thing.name]) {                //isEqualToString: kiểm tra xem chuỗi có bằng nhau không
			[self displayCorrectOrNo:YES];
			[textField resignFirstResponder];               //Hạ bàn phím ảo xuống
			[self randomDisplayImage];
			[self alertSound:@"right"];
		}
		else {
			self->countError++;
			[self alertSound:@"wrong"];
			if (self->countError > 2) {
				[self displayCorrectOrNo:NO];
				[textField resignFirstResponder];
				[self randomDisplayImage];
				[self alertSound:@"wrong"];
			}
		}
	}
	return YES;
}

- (void)alertSound:(NSString *)fileName  {
	sound = 0;
	NSString *path = [[NSBundle mainBundle] pathForResource:fileName ofType:@"wav"];
	NSURL *url = [NSURL fileURLWithPath:path];
	AudioServicesCreateSystemSoundID((__bridge CFURLRef)url, &sound);
	AudioServicesPlaySystemSound(sound);
}

- (void)displayCorrectOrNo:(BOOL)correct {
	UIImageView *ball = (UIImageView *)[self.view viewWithTag:99 + countPlay];               //viewWithTag lấy ra UIView theo tag. Tag là số đếm
	if (correct) {
		ball.image = [UIImage imageNamed:@"green.png"];
		countPoint++;
	}
	else {
		ball.image = [UIImage imageNamed:@"red.png"];
	}
}

- (void)displayScore:(int)score {
	ScoreViewController *SVC = [self.storyboard instantiateViewControllerWithIdentifier:@"Score"];
	SVC.score = score;
    
	[self presentViewController:SVC animated:YES completion:nil];
    
	//[self performSegueWithIdentifier:@"ModalScore" sender:nil];
}

//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender withModal:(NSString *)modal withScore:(int)score  {
//	if ([segue.identifier isEqualToString:modal]) {
//		ScoreViewController *SVC = (ScoreViewController *)segue.destinationViewController;
//		SVC.score = score;
//	}
//}

@end
