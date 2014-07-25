//
//  ViewController.m
//  RandomPhoto
//
//  Created by cuong minh on 6/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"
#import "UIImageView+Photo.h"
@interface ViewController ()

@end

@implementation ViewController
@synthesize tapRecognizer;
@synthesize photos;
@synthesize trashButton;
@synthesize audioPlayer;

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.photos = [[NSArray alloc] initWithObjects:
    [UIImage imageNamed:@"01.jpg"],
    [UIImage imageNamed:@"02.jpg"],
    [UIImage imageNamed:@"03.jpg"],
    [UIImage imageNamed:@"04.jpg"],
    [UIImage imageNamed:@"05.jpg"],
    [UIImage imageNamed:@"06.jpg"],
    [UIImage imageNamed:@"07.jpg"],
    [UIImage imageNamed:@"08.jpg"], nil]; 
    [self.view addGestureRecognizer: tapRecognizer];
    
    NSString* filePath = [[NSBundle mainBundle] pathForResource:@"empty trash" ofType:@"aif"]; 
    NSURL *url = [NSURL fileURLWithPath:filePath];
    NSError *error;
    self.audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error: &error]; 
    //Truyền địa chỉ của con trỏ chứ không truyền địa chỉ vùng nhớ heap. Nếu có lỗi, con trỏ error mới được khởi tạo
    
    if (error) {
        NSLog(@"Error %@", error.description);
        return;
        
    }
    [self.audioPlayer prepareToPlay];

}

- (void)viewDidUnload
{
    [self setTapRecognizer:nil];
    [self setPhotos:nil];
    [self setTrashButton:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}
- (IBAction)handleTap:(id)sender {
    UITapGestureRecognizer *tap = (UITapGestureRecognizer *) sender;
    int index = rand() % 8;  
    UIImageView *aPhoto = [[UIImageView alloc] initWithImage: [self.photos objectAtIndex: index]];
    aPhoto.center = [tap locationInView:self.view];
    [aPhoto makeItCool];
    [aPhoto addGestureRecognizer];
    [self.view addSubview:aPhoto];
    
    [self.view bringSubviewToFront:self.trashButton];
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
    if ((touch.view == trashButton)) {
        return NO;
    }
    return YES;
}
- (IBAction)clickOnTrash:(id)sender {
    for (UIView *view in self.view.subviews) {
        //if(view.tag != trashButton.tag) cach nay khong hay
        if ([view isMemberOfClass:[UIImageView class]]) 
        {
            [audioPlayer play];
            
            [UIView animateWithDuration:1.0f 
            animations:^(void)
            {
                view.center = trashButton.center;
                CGAffineTransform transform = CGAffineTransformMakeScale(0.1f, 0.1f);
                view.transform = transform;
                view.alpha = 0.1f;
                
            } 
            completion:^(BOOL finished) 
            {
                [view removeFromSuperview];
                
            }];
        }    
    }
}


@end
