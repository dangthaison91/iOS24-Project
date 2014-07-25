//
//  ViewController.h
//  RandomPhoto
//
//  Created by cuong minh on 6/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>


@interface ViewController : UIViewController <UIGestureRecognizerDelegate>
@property (strong, nonatomic) IBOutlet UITapGestureRecognizer *tapRecognizer;
@property (strong, nonatomic) NSArray *photos;
@property (strong, nonatomic) IBOutlet UIButton *trashButton;

@property (strong, nonatomic) AVAudioPlayer* audioPlayer;
@end
