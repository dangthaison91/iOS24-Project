//
//  BlockAnimationVC.m
//  ViewManyDemos
//
//  Created by TechMaster on 2/17/14.
//  Copyright (c) 2014 TechMaster. All rights reserved.
//

#import "BlockAnimationVC.h"

@interface BlockAnimationVC ()
@property (weak, nonatomic) IBOutlet UIImageView *cat;

@end

@implementation BlockAnimationVC

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
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)animateCat:(id)sender {
    [UIView animateWithDuration:1 animations:^{
        self.cat.center = CGPointMake(300, 400);
    } completion:^(BOOL finished) {
        self.cat.alpha = 0.5;
    }];
    
}

@end
