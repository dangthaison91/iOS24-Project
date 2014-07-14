//
//  ViewController.m
//  DemoProtocol
//
//  Created by techmaster on 7/8/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

#import "ViewController.h"
#import "Student.h"
#import "Swim.h"
#import "PlayMusic.h"
#import "AthleticStudent.h"
#import "MusicalStudent.h"
#import "SmartStudent.h"
#import "ProSwimmer.h"

@interface ViewController () <UITextFieldDelegate>
{
	AthleticStudent *_athelicStudent;
	ProSwimmer *_proSwimmer;
	SmartStudent *_smartStudent;
	NSArray *studentGroup;
}
@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)createPerson:(id)sender {
	_athelicStudent = [[AthleticStudent alloc] init:@"John Smith"];
	_proSwimmer = [[ProSwimmer alloc] init:@"Michael Phelp"];
	_smartStudent = [[SmartStudent alloc] init:@"John Hopkin"];
	studentGroup = @[_athelicStudent, _proSwimmer, _smartStudent];
}

- (IBAction)sendToMusicCompetion:(id)sender {
	for (Person *person in studentGroup) {
		if ([person conformsToProtocol:@protocol(PlayMusic)]) {
			if ([person respondsToSelector:@selector(playGuitar)]) {
				[person performSelector:@selector(playGuitar)];
			}
			if ([person respondsToSelector:@selector(blewHarmonica)]) {
				[person performSelector:@selector(blewHarmonica)];
			}
		}
	}
}

- (IBAction)sendToSwimmingCompetion:(id)sender {
	for (Person *person in studentGroup) {
		if ([person conformsToProtocol:@protocol(Swim)]) {
			//Không cần kiểm tra đối với Required method trong protocol
			[person performSelector:@selector(breastStroke)];
            
			if ([person respondsToSelector:@selector(freeStyle)]) {
				[person performSelector:@selector(freeStyle)];
			}
			if ([person respondsToSelector:@selector(butterfly)]) {
				[person performSelector:@selector(butterfly)];
			}
		}
	}
}

- (IBAction)sendToMultiTalentCompetion:(id)sender {
}

#pragma mark - UITextFieldDelegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
	if ([textField isFirstResponder]) {
		[textField resignFirstResponder];
	}
	return TRUE;
}

@end
