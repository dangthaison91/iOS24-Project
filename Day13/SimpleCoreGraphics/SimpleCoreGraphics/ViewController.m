//
//  ViewController.m
//  SimpleCoreGraphics
//
//  Created by techmaster on 7/22/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

#import "ViewController.h"
#import "CustomView.h"
#import "BasicPath_Chess.h"
#import "Rectangle.h"
@interface ViewController ()

@end

@implementation ViewController
- (void)loadView {
	//CustomView *customView = [CustomView new];
	//self.view = customView;
	//customView.frame = self.view.bounds;
	BasicPath_Chess *viewChess = [BasicPath_Chess new];
	self.view = viewChess;
	viewChess.frame = self.view.bounds;
    
	//Rectangle *rectangle = [Rectangle new];
	//self.view = rectangle;
    
	//rectangle.frame = self.view.bounds;
}

- (void)viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
	self.edgesForExtendedLayout = UIRectEdgeNone;
}

@end
