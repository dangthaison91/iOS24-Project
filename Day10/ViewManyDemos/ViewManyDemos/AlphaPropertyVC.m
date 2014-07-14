//
//  AlphaPropertyVC.m
//  ViewManyDemos
//
//  Created by TechMaster on 2/17/14.
//  Copyright (c) 2014 TechMaster. All rights reserved.
//

#import "AlphaPropertyVC.h"

@interface AlphaPropertyVC ()
@property (weak, nonatomic) IBOutlet UIImageView *coolGirl;
@property (weak, nonatomic) IBOutlet UISlider *alphaSlider;

@end

@implementation AlphaPropertyVC

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.alphaSlider.value = self.coolGirl.alpha;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)changeAlpha:(id)sender {
    self.coolGirl.alpha = [(UISlider*) sender value];
}

@end
