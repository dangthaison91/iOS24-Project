//
//  ViewController.m
//  LoadMultipleViews
//
//  Created by cuong minh on 6/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize mainView;
@synthesize anotherView;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void) viewWillAppear:(BOOL)animated
{
    NSLog(@"viewWillAppear");
}
- (void) viewDidAppear:(BOOL)animated
{
     NSLog(@"viewDidAppear");
}
- (void) viewWillDisappear:(BOOL)animated
{
    NSLog(@"viewWillDisappear");
}
- (void) viewDidDisappear:(BOOL)animated
{
    NSLog(@"viewDidDisappear");
}

- (void) viewWillUnload 
{
    NSLog(@"viewWillUnload");
}
- (void)viewDidUnload
{
    [self setBtn1:nil];
    [super viewDidUnload];
    self.mainView = nil;
    self.anotherView = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}
- (IBAction)loadAnotherView:(id)sender {
    if (!self.anotherView) {
        NSArray* nibArray = [[NSBundle mainBundle] loadNibNamed:@"AnotherView" owner:self options:nil];
        
        self.anotherView = nibArray[0];
    }
    self.mainView = self.view; //Back up view hiện giờ
    self.view = self.anotherView; //Gán anotherView vào self.view
    
}
- (IBAction)backToMainView:(id)sender {
    self.view = self.mainView; //Gán ngược lại mainView vào self.view
}

@end
