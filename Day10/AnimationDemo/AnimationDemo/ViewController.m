//
//  ViewController.m
//  AnimationDemo
//
//  Created by techmaster on 4/3/13.
//  Copyright (c) 2013 TechMaster. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    UIImageView *_backPhoto;
    UIImageView *_backupPhoto;
    UIView *_transparentView;
    BOOL _isFrontFace;
}
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _transparentView = [[UIView alloc] initWithFrame: self.photo.frame];
    [self.view addSubview:_transparentView];
    _backupPhoto = _photo;
    [_photo removeFromSuperview];
    _backupPhoto.frame = CGRectMake(0, 0, _transparentView.bounds.size.width, _transparentView.bounds.size.height);
    [_transparentView addSubview:_backupPhoto];
    
    
    UITapGestureRecognizer *tapA = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(flip:)];
    
    
    
	[_transparentView addGestureRecognizer:tapA];
    
    _backPhoto = [[UIImageView alloc] initWithImage: [UIImage imageNamed:@"girlB.jpg"]];
    _backPhoto.frame = _photo.frame;
    _backPhoto.userInteractionEnabled = YES;
    UITapGestureRecognizer *tapB = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(flip:)];
    [_backPhoto addGestureRecognizer:tapB];

    _isFrontFace = YES;
}

-(void) flip: (UITapGestureRecognizer *) gesture
{
    if (_isFrontFace){
        [UIView transitionWithView:_transparentView duration:1 options:UIViewAnimationOptionTransitionFlipFromLeft animations:^{
             [_transparentView addSubview:_backPhoto];
            _backupPhoto = _photo;
            [_photo removeFromSuperview];
           
        } completion:^(BOOL finished){
            _isFrontFace = NO;
        }];
        
    } else {
        [UIView transitionWithView:_transparentView duration:1 options:UIViewAnimationOptionTransitionCurlUp animations:^{
            [_transparentView addSubview:_backupPhoto];
            _backupPhoto = _backPhoto;
            [_backPhoto removeFromSuperview];
            
        } completion:^(BOOL finished){
            _isFrontFace = YES;
        }];
    }
}


@end
