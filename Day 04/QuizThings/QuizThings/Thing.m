//
//  Thing.m
//  QuizThings
//
//  Created by techmaster on 6/13/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

#import "Thing.h"

@implementation Thing
- (instancetype) init: (NSString*) name
             andImage: (NSString*) image
{
    /*
    Đây là cách viết gọn
    if (self = [super init]) {
        
    }*/
    self = [super init];
    if (self) {
        self.name = name;
        //self.image = image;
        self.image = [UIImage imageNamed:image];
    }
    return self;
}
//description là phương thức viết đè lên phương thức description của kiểu NSObject
- (NSString*) description{
    return [NSString stringWithFormat:@"%@ - %@", [self class],self.name];
    //[self class] hoặc [obj class] sẽ trả về Class mà đối tượng đó được tạo
    //self.name trả về giá trị, đối tượng mà thuộc tính name của self trỏ đến
}
@end
