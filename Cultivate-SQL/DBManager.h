//
//  DBManager.h
//  Cultivate-SQL
//
//  Created by Lisa Matter on 2/15/15.
//  Copyright (c) 2015 MSSE 650. All rights reserved.
//

#import <Foundation/Foundation.h>




@interface DBManager : NSObject

-(instancetype) initWithDatabaseFilename:(NSString*)dbFilename;

@property (nonatomic, strong) NSMutableArray *columnNames;
@property (nonatomic) int affectedRows;
@property (nonatomic) long long lastInsertRowId;

-(NSArray*) loadDataFromDatabase:(NSString*) query;

-(void) executeQuery:(NSString*) query;

@end
