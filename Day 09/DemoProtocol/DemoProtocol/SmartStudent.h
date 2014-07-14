//
//  SmartStudent.h
//  DemoProtocol
//
//  Created by techmaster on 7/8/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

#import "Student.h"
#import "Swim.h"
#import "PlayMusic.h"
@interface SmartStudent : Student <Swim, PlayMusic>

@end
