//
//  LogEntry.h
//  Cultivate
//
//  Created by Lisa Matter on 2/1/15.
//  Copyright (c) 2015 MSSE 650. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LogEntry : NSObject

@property NSString *type;
//creates the property that will correspond to the type of hours (training, coaching, observation or other)

@property NSString *hours;
//creates the property that will correspond to the logged hours

@property  NSDate *logDate;
//creates the property which will correspond to the date picker

@end
