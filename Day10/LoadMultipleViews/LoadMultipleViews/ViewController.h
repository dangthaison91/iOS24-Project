//
//  ViewController.h
//  LoadMultipleViews
//
//  Created by cuong minh on 6/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (strong, nonatomic) UIView *mainView;
@property (strong, nonatomic) UIView *anotherView;
@property (weak, nonatomic) IBOutlet UIButton *btn1;
@end
