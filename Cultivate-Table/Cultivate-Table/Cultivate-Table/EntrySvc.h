//
//  EntrySvc.h
//  Cultivate-Table
//
//  Created by Lisa Matter on 1/25/15.
//  Copyright (c) 2015 MSSE 650. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Entry.h"

@protocol EntrySvc <NSObject>

-(Entry*) createEntry: (Entry*) entry;
-(NSMutableArray*) retrieveAllEntries;
-(Entry*) updateEntry: (Entry*) entry;
-(Entry*) deleteEntry: (Entry*) entry;

@end
