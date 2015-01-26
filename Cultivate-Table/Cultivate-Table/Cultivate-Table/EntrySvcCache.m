//
//  EntrySvcCache.m
//  Cultivate-Table
//
//  Created by Lisa Matter on 1/25/15.
//  Copyright (c) 2015 MSSE 650. All rights reserved.
//

#import "EntrySvcCache.h"

@implementation EntrySvcCache

NSMutableArray *entries = nil;

-(id) init{
    if(self=[super init]){
    entries = [NSMutableArray array];
    return self;
    }
    return nil;
}

-(Entry*) createEntry:(Entry*) entry{
    [entries addObject: entry];
    return entry;
}

-(NSMutableArray*)retrieveAllEntries {
    return entries;
}

-(Entry*)updateEntry:(Entry*) entry{
    return entry;
}

-(Entry*)deleteEntry:(Entry*) entry{
    return entry;
}

@end
