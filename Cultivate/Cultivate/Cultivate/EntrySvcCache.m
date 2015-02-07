//
//  EntrySvcCache.m
//  Cultivate
//
//  Created by Lisa Matter on 2/5/15.
//  Copyright (c) 2015 MSSE 650. All rights reserved.
//

#import "EntrySvcCache.h"

@implementation EntrySvcCache

NSMutableArray* logEntries = nil;
-(id) init{
    if (self = [super init]) {
        logEntries = [NSMutableArray array];
        return self;
    }
    return nil;
}

-(LogEntry*) createEntry:(LogEntry*)entry{
    [logEntries addObject:entry];
    return entry;
}

-(LogEntry*) deleteEntry:(LogEntry*)entry{
    [logEntries removeObject:entry];
    return entry;
}

-(LogEntry*) updateEntry:(LogEntry*)entry{
    return entry;
}
-(NSMutableArray*) retrieveAllEntries {
    return logEntries;
}

@end
