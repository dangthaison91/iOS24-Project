//
//  DetainViewController.m
//  TMCoreGraphics
//
//  Created by techmaster on 1/13/13.
//  Copyright (c) 2013 TechMaster. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    SEL sel = @selector(cutomizeView);
    if ([self.view respondsToSelector:sel]) {
        //Tắt compiler warning performSelector may cause a leak because its selector is unknown
        #pragma clang diagnostic push
        #pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        [self.view performSelector:sel];
        #pragma clang diagnostic pop
    }

}
- (void) viewWillDisappear:(BOOL)animated
{
   if ([self.view respondsToSelector:@selector(cleanUpView)]){
        [self.view performSelector:@selector(cleanUpView)];
   }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -QuartzViewDelegate
- (void) refreshView
{

}

@end
