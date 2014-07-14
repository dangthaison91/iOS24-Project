//
//  ViewController.m
//  DemoUIViewHierarchy
//
//  Created by cuong minh on 6/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end
#define BeautyPhoto 100
@implementation ViewController
@synthesize timer;
@synthesize counter;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (void) addAPhoto 
{
    UIView *view = [self.view viewWithTag:BeautyPhoto];
    if (!view) {
        UIImageView *myImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"beauty.jpg"]];
        myImageView.tag = BeautyPhoto;
        [self.view addSubview:myImageView];
    }
}
- (IBAction)addSubView:(id)sender {
    [self addAPhoto];
}

- (IBAction)removeSubView:(id)sender {
    UIView *view = [self.view viewWithTag:BeautyPhoto];
    if (view) {
        [view removeFromSuperview];
    }
}

- (IBAction)swapPhotos:(id)sender {
  
   /* self.timer = [NSTimer scheduledTimerWithTimeInterval:0.5f 
                                                  target:self 
                                                selector:@selector(swapRoutine) 
                                                userInfo:nil 
                                                 repeats:YES];*/
    [self swapRoutine];
}
- (void) swapRoutine 
{
   UIView *originalPhoto = [self.view viewWithTag:BeautyPhoto];

   UIImageView *myImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"beauty.jpg"]];
    
   myImageView.bounds = CGRectMake(0, 0, originalPhoto.bounds.size.width/2, originalPhoto.bounds.size.height/2);    
   [originalPhoto addSubview:myImageView];
}

@end
