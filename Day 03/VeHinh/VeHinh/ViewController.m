//
//  ViewController.m
//  VeHinh
//
//  Created by SonDT on 6/19/14.
//  Copyright (c) 2014 SonDT. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize txtHeight = _txtHeight;
@synthesize txtWidth = _txtWidth;

- (void)viewDidLoad {
	[super viewDidLoad];
	_txtHeight.delegate = self;
	_txtWidth.delegate = self;
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

- (IBAction)onDrawClick:(id)sender {
	//int =[self._txtWidth.tex]
    
    
	int width = [[_txtWidth text] intValue];
	int height = [[_txtHeight text] intValue];
	[self drawTriangle:width withHeight:height];
}

- (void)drawTriangle:(int)width withHeight:(int)height {
	int size = height;
	for (int i = 0; i < size; i++) {
		[self drawLine:width withHeight:height withLevel:i];
	}
}

- (void)drawLine:(int)width withHeight:(int)height withLevel:(int)level {
	for (int w = 0; w < width; w++) {
		for (int i = 0; i <= height - level; i++) {
			printf("-");
		}
        
		printf("*");
        
		for (int j = level * 2; j > 0; j--) {
			printf(" ");
		}
        
		printf("*");
        
		for (int h = 0; h <= height - level; h++) {
			printf(" ");
		}
		//height--;
	}
	printf("\n");
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	[_txtWidth resignFirstResponder];
	[_txtHeight resignFirstResponder];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
	if (textField) {
		[textField resignFirstResponder];
	}
    
	return NO;
}

@end
