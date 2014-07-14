//
//  Taxi.h
//  DemoObjectiveLanguage
//
//  Created by techmaster on 6/17/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

#import "Car.h"

@interface Taxi : Car
{
    NSString* distanceMeter;
}

- (void) showDistanceMeter;  //Khai báo mẫu một phương thức
@end
