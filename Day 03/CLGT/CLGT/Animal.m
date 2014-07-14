//
//  Animal.m
//  CLGT
//
//  Created by SonDT on 6/17/14.
//  Copyright (c) 2014 SonDT. All rights reserved.
//

#import "Animal.h"

@implementation Animal

- (instancetype)init:(NSString *)sound {
	_sound = sound;
	return self;
}

- (NSString *)sound {
	return @"Animal Animal Animal";
}

@end
