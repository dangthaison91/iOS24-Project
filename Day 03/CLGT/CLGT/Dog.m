//
//  Dog.m
//  CLGT
//
//  Created by SonDT on 6/17/14.
//  Copyright (c) 2014 SonDT. All rights reserved.
//

#import "Dog.h"

@implementation Dog

- (instancetype)init:(NSString *)sound {
	super.sound = sound;
	return self;
}

- (NSString *)sound {
	return @"Dog Dog Dog ";
}

@end
