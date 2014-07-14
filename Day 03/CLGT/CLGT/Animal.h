//
//  Animal.h
//  CLGT
//
//  Created by SonDT on 6/17/14.
//  Copyright (c) 2014 SonDT. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Animal : NSObject

@property (nonatomic, strong) NSString *sound;
- (instancetype)init:(NSString *)sound;

- (NSString *)sound;
@end
