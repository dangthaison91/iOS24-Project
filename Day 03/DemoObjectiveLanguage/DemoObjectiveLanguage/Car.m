//
//  Song.m
//  DemoObjectiveLanguage
//
//  Created by techmaster on 6/17/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

#import "Car.h"
@interface Car ()
{
@public
	int publicButSecretNumber;
}
@property (nonatomic, strong) NSString *superName;

@end


@implementation Car
- (instancetype)init:(NSString *)name
        andChasisNum:(NSString *)chasisNum {
	if (self = [super init]) {
		self.name = name;
		//self.chasisNum = chasisNum; là không được phép
		_chasisNum = chasisNum;  //Khi không thể gán dữ liệu vào readonly property thì gán vào instant variable tương ứng
	}
	return self;
}

- (void)changeName:(NSString *)name {
	_name = name;
}

- (NSString *)description {
	return [NSString stringWithFormat:@"%@: %@ - %@", [self class], self.name, self.chasisNum];
}

@end
