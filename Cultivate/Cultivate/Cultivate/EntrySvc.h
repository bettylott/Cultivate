//
//  EntrySvc.h
//  Cultivate
//
//  Created by Lisa Matter on 2/5/15.
//  Copyright (c) 2015 MSSE 650. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Entry.h"

@protocol EntrySvc <NSObject>

-(Entry*) createEntry:(Entry*)entry;
-(Entry*) updateEntry:(Entry*)entry;
-(Entry*) deleteEntry:(Entry*)entry;
-(NSArray*) retrieveAllEntries;

@end
