//
//  Thing.h
//  QuizThings
//
//  Created by techmaster on 6/13/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Thing : NSObject
@property (nonatomic, strong) NSString* name;
@property (nonatomic, strong) UIImage* image;

//Constructor luon bat dau bang init
//Constructor dùng để khởi tạo đối tượng sau khi cấp phát vùng nhớ
- (instancetype) init: (NSString*) name
             andImage: (NSString*) image;

@end
