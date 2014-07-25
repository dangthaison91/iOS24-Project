//
//  QuartzView.h
//  TMCoreGraphics
//
//  Created by techmaster on 1/13/13.
//  Copyright (c) 2013 TechMaster. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QuartzView : UIView
{
    __weak UIViewController * _viewController; //Để tránh tình trạng Circular Reference

}

// Inherited class may implemen cutomizeView method
//- (void) customizeView;


//Do some clean up work
- (void) cleanUpView;

//Configure the ViewController that holds this view
- (void) customizeViewController: (UIViewController*) viewController;

@end
