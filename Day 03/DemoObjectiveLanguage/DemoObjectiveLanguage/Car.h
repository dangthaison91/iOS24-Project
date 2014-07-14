//
//  Song.h
//  DemoObjectiveLanguage
//
//  Created by techmaster on 6/17/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Car : NSObject
//Phải viết ngoặc nhọn ở trước khai báo property
{
    @public
    int publicNum;
    
    //mức độ truy xuất mặc định là protected
    @protected
    int protecNum;
    
    @private  //Nếu khai báo private ở đây thì đối tượng nhìn thấy nhưng không truy xuất được
    int privateNum;
    
    @package
    
    
}
//Thuộc tính
@property (nonatomic, strong) NSString*name;
@property (nonatomic, readonly) NSString* chasisNum;

//Đây là hàm customized intialization 
- (instancetype) init: (NSString*) name
         andChasisNum: (NSString*) chasisNum;

//
- (void) changeName: (NSString*) name;

@end
