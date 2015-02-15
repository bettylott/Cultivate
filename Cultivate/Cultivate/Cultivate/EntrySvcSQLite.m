//
//  EntrySvcSQLite.m
//  Cultivate
//
//  Created by Lisa Matter on 2/14/15.
//  Copyright (c) 2015 MSSE 650. All rights reserved.
//

#import "EntrySvcSQLite.h"
#import "sqlite3.h"

@implementation EntrySvcSQLite

NSString *databasePath = nil;
sqlite3 *database = nil;

-(id) init{
    if ((self = [super init])){//initalizing database and database path
    
        NSArray *documentsPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *documentsDir = [documentsPaths objectAtIndex:0];
        databasePath = [documentsDir stringByAppendingPathComponent:@"logEntry.sql"];
        
        if (sqlite3_open([databasePath UTF8String], &database) == SQLITE_OK){//opens database
            NSLog (@"Database is open");
            NSLog  (@"Database file path is %@", databasePath);
            
            NSString *createSql=
            @"create table if not exists logEntry (id integer primary key autoincrement, type varchar (20), hours varchar(4), logDate varchar (10))";
            char* errMsg;
            if (sqlite3_exec(database, [createSql UTF8String], NULL, NULL, &errMsg)!= SQLITE_OK){
                NSLog (@"***Failed to create table %s", errMsg);
            }
        }
            else {
                NSLog (@"***Failed to open database!");
                NSLog (@"SQL error: %s/n", sqlite3_errmsg(database));//logs to tell you if the open failed
        }
    }
    return self;
}

-(LogEntry*) createEntry:(LogEntry*)entry{
    sqlite3_stmt *statement;
    NSString *insertSQL =[NSString stringWithFormat:
                          @"INSERT INTO logEntry (type, hours, date) VALUES (\"%@\", \"%@\", \"%@\")", entry.type, entry.hours, entry.logDate];
            if (sqlite3_prepare_v2(database, [insertSQL UTF8String], -1, &statement, NULL) ==SQLITE_OK){
                    if (sqlite3_step(statement) ==SQLITE_DONE){
                                entry.id =sqlite3_last_insert_rowid(database);
                                NSLog (@"***Entry added!");
                            }else{
                                    NSLog (@"Entry not added");
                                    NSLog (@"SQL error: %s/n", sqlite3_errmsg(database));
                                       }
                            sqlite3_finalize(statement);
                        }
     return entry;
                        }


-(NSMutableArray*) retrieveAllEntries {
    NSMutableArray *entries = [NSMutableArray array];
    NSString *selectSQL =[NSString stringWithFormat:
                          @"SELECT * FROM logEntry ORDER BY logDate"];
    sqlite3_stmt *statement;
    if (sqlite3_prepare_v2(database, [selectSQL UTF8String], -1, &statement, NULL) ==SQLITE_OK){
        NSLog(@"***Entries retrieved");
        while (sqlite3_step (statement) == SQLITE_ROW){
            int id = sqlite3_column_int(statement, 0);
            char *typeChars =(char*) sqlite3_column_text(statement, 1);
            char *hoursChars=(char*) sqlite3_column_text(statement, 2);
            char *logDateChars=(char*) sqlite3_column_text(statement, 3);
            
            LogEntry *entry= [[LogEntry alloc] init];
            entry.id = id;
            entry.type = [[NSString alloc]initWithUTF8String:typeChars];
            entry.hours = [[NSString alloc] initWithUTF8String:hoursChars];
            entry.logDate = [[NSString alloc] initWithUTF8String:logDateChars];
            [entries addObject:entry];
        }
        sqlite3_finalize (statement);
    }else {
        NSLog (@"***Entries NOT retrieved");
        NSLog (@"SQL error: %s/n", sqlite3_errmsg(database));
    }

    return entries;
}

-(LogEntry*) updateEntry:(LogEntry*)entry{
    NSString *updateSQL =[NSString stringWithFormat:
                          @"UPDATE logEntry SET type =\"%@\", hours = \"%@\", logDate = \"%@\" WHERE id = %i)", entry.type, entry.hours, entry.logDate, entry.id];
    sqlite3_stmt *statement;
    if (sqlite3_prepare_v2(database, [updateSQL UTF8String], -1, &statement, NULL) ==SQLITE_OK){
        if (sqlite3_step(statement) ==SQLITE_DONE){
            NSLog (@"***Entry updated!");
        }else{
            NSLog (@"Entry not updated");
            NSLog (@"SQL error: %s/n", sqlite3_errmsg(database));
        }
        sqlite3_finalize(statement);
    }
    return entry;
}


-(LogEntry*) deleteEntry:(LogEntry*)entry{
    NSString *deleteSQL =[NSString stringWithFormat:
                          @"DELETE FROM logEntry WHERE id = %i", entry.id];
    sqlite3_stmt *statement;
    if (sqlite3_prepare_v2(database, [deleteSQL UTF8String], -1, &statement, NULL) ==SQLITE_OK){
        if (sqlite3_step(statement) ==SQLITE_DONE){
            NSLog (@"***Entry deleted!");
        }else{
            NSLog (@"Entry not deleted");
            NSLog (@"SQL error: %s/n", sqlite3_errmsg(database));
        }
        sqlite3_finalize(statement);
    }
    return entry;
    
}


-(void) dealloc{
    sqlite3_close(database);
}


@end
