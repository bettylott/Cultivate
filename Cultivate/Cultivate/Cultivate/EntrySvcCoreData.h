//
//  EntrySvcCoreData.h
//  Cultivate
//
//  Created by Lisa Matter on 2/21/15.
//  Copyright (c) 2015 MSSE 650. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EntrySvc.h"

@interface EntrySvcCoreData : NSObject<EntrySvc>

+ (Entry *) createManagedEntry;

@end
