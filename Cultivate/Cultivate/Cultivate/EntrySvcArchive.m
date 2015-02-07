//
//  EntrySvcArchive.m
//  Cultivate
//
//  Created by Lisa Matter on 2/7/15.
//  Copyright (c) 2015 MSSE 650. All rights reserved.
//

#import "EntrySvcArchive.h"

@implementation EntrySvcArchive

NSString *filePath;

NSMutableArray *entries;

-(id) init{
    NSArray *dirPaths=
    NSSearchPathForDirectoriesInDomains(NSDocumentationDirectory, NSUserDomainMask, YES);
    NSString *docsDir=[dirPaths objectAtIndex:0];
    filePath = [[NSString alloc] initWithString:[docsDir stringByAppendingPathComponent:@"entries.archive"]];
    [self readArchive];
    return self;
}

-(void) readArchive {
    NSFileManager *filemgr=[NSFileManager defaultManager];
    if([filemgr fileExistsAtPath:filePath])
    {
        entries = [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
    }
    else
    {
        entries =[NSMutableArray array];
    }
    
}

-(void) writeArchive {
    [NSKeyedArchiver archiveRootObject:entries toFile:filePath];
}

-(LogEntry*) createEntry:(LogEntry*)entry{
    NSLog (@"EntrySvc.createEntry:%@", [entry description]);
    [entries addObject: entry];
    [self writeArchive];
    return entry;
}

-(LogEntry*) deleteEntry:(LogEntry*)entry{
    return entry;
}

-(LogEntry*) updateEntry:(LogEntry*)entry{
    return entry;
}
-(NSMutableArray*) retrieveAllEntries {
    return entries;
}

@end
