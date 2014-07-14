//
//  ViewController.m
//  CLGT
//
//  Created by SonDT on 6/17/14.
//  Copyright (c) 2014 SonDT. All rights reserved.
//

#import "ViewController.h"
#import "Dog.h"
#import "Cat.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

- (IBAction)soundDog:(id)sender {
	Animal *dog1 = [Dog new];
	NSLog(@"%@", dog1.sound);
}

- (IBAction)soundCat:(id)sender {
	Animal *cat1 = [Cat new];
	NSLog(@"%@", cat1.sound);
}

- (IBAction)soundAnimal:(id)sender {
	Animal *animal1 = [Animal new];
    printf("%s", [animal1.sound UTF8String]);
	//NSLog(@"%@", animal1.sound);
}

@end
