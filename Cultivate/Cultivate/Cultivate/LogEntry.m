//
//  LogEntry.m
//  Cultivate
//
//  Created by Lisa Matter on 2/1/15.
//  Copyright (c) 2015 MSSE 650. All rights reserved.
//

#import "LogEntry.h"

@implementation LogEntry

@synthesize type = _type;
@synthesize hours= _hours;
@synthesize logDate= _logDate;


static NSString *const TYPE = @"type";
static NSString *const HOURS =@"hours";
static NSString *const LOGDATE =@"logDate";

-(NSString*) description {return [NSString stringWithFormat:@"%@%@", _type, _hours];
}

- (void)encodeWithCoder:(NSCoder *)coder{
    [coder encodeObject:self.type forKey:TYPE];
    [coder encodeObject:self.hours forKey:HOURS];
    [coder encodeObject:self.logDate forKey:LOGDATE];
    
    
}// encode the property values

- (id)initWithCoder:(NSCoder *)coder {
    self=[super init];
    if (self){
        _type=[coder decodeObjectForKey:@"type"];
        _hours=[coder decodeObjectForKey:@"hours"];
        _logDate=[coder decodeObjectForKey:@"logDate"];
    }
    return self;
}// decode the property values

@end
