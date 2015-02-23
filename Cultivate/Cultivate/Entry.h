//
//  Entry.h
//  Cultivate
//
//  Created by Lisa Matter on 2/21/15.
//  Copyright (c) 2015 MSSE 650. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Entry : NSManagedObject

@property (nonatomic, retain) NSString * type;
@property (nonatomic, retain) NSString * hours;
@property (nonatomic, retain) NSString * date;

@end
