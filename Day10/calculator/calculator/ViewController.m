//
//  ViewController.m
//  calculator
//
//  Created by TechMaster on 3/19/14.
//  Copyright (c) 2014 TechMaster. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()
{
	NSMutableString *string;
	NSString *key;
}

@property (weak, nonatomic) IBOutlet UILabel *resultLabel;
@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	string = [[NSMutableString alloc] init];
	/*NSError *error = nil;
     
     self.resultLabel.text = [NSString stringWithFormat:@"%@", [@"1 + 2" numberByEvaluatingString]];
     DDMathEvaluator *eval = [DDMathEvaluator defaultMathEvaluator];
     NSLog(@"%@", [eval evaluateString:@"1 + 2" withSubstitutions:nil]);*/
}

- (IBAction)onNumeric:(id)sender {
	self.resultLabel.text = @"";
	UIButton *button = (UIButton *)sender;
	//string = [NSMutableString stringWithString:self.resultLabel.text];
	key = [button titleForState:UIControlStateNormal];
    
    
//	if (([string characterAtIndex:[string length] - 1] == '.') && ([string length] > 3)) {
//		self.resultLabel.text  = [string substringFromIndex:[string length] - 3];
//	}
//	else {
		self.resultLabel.text  = key;
	//}
	[string appendString:key];
	NSLog(@"%@", string);
}

- (IBAction)onClear:(id)sender {
	self.resultLabel.text = @"0";
	[string setString:@""];
}

- (IBAction)onDecimalTap:(id)sender {
	[string appendString:@"."];
    
	NSLog(@"%@", string);
}

- (IBAction)onAdd:(id)sender {
	[string appendString:@"+"];
	//self.resultLabel.text  = string;
	NSLog(@"%@", string);
}

- (IBAction)onSubtract:(id)sender {
	[string appendString:@"-"];
	//self.resultLabel.text  = string;
}

- (IBAction)onMultiply:(id)sender {
	[string appendString:@"*"];
	//self.resultLabel.text  = string;
}

- (IBAction)onDivide:(id)sender {
	[string appendString:@"/"];
	//self.resultLabel.text  = string;
}
- (IBAction)calculatePercent:(id)sender {
    [string appendString:@"%"];

}

- (IBAction)onCalculate:(id)sender {
	NSNumber *result = [string numberByEvaluatingString];
	NSLog(@"%@", result);
	self.resultLabel.text = [NSString stringWithFormat:@"%@", [string numberByEvaluatingString]];
}

@end
