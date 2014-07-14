//
//  AffineTransformVC.m
//  ViewManyDemos
//
//  Created by TechMaster on 2/17/14.
//  Copyright (c) 2014 TechMaster. All rights reserved.
//

#import "AffineTransformVC.h"

@interface AffineTransformVC ()
@property (weak, nonatomic) IBOutlet UIImageView *cat;
@property (weak, nonatomic) IBOutlet UISlider *rotateSlider;
@property (weak, nonatomic) IBOutlet UISlider *scaleSlider;

@end

@implementation AffineTransformVC

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
    [self rotateAndScale];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)rotate:(UISlider *)sender {
    [self rotateAndScale];

}

- (IBAction)scale:(UISlider *)sender {
    //self.cat.transform = CGAffineTransformMakeScale(sender.value * 4, sender.value * 4);
    [self rotateAndScale];
}

- (void) rotateAndScale
{
    float scaleRatio = self.scaleSlider.value * 4;
    self.cat.transform = CGAffineTransformConcat(CGAffineTransformMakeRotation(M_PI* self.rotateSlider.value),
                                                 CGAffineTransformMakeScale(scaleRatio, scaleRatio));
}

@end
