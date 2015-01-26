//
//  Entry.m
//  Cultivate-Table
//
//  Created by Lisa Matter on 1/25/15.
//  Copyright (c) 2015 MSSE 650. All rights reserved.
//

#import "Entry.h"

@implementation Entry

-(NSString*) description {
                          return [NSString stringWithFormat:@"%@%@%@", _type, _hours, _date];
}

@end
