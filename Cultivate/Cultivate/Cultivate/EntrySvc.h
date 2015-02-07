//
//  EntrySvc.h
//  Cultivate
//
//  Created by Lisa Matter on 2/5/15.
//  Copyright (c) 2015 MSSE 650. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LogEntry.h"

@protocol EntrySvc <NSObject>

-(LogEntry*) createEntry:(LogEntry*)entry;
-(LogEntry*) updateEntry:(LogEntry*)entry;
-(LogEntry*) deleteEntry:(LogEntry*)entry;
-(NSMutableArray*) retrieveAllEntries;

@end
