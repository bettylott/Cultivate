//
//  SQLiteTests.m
//  Cultivate
//
//  Created by Lisa Matter on 2/15/15.
//  Copyright (c) 2015 MSSE 650. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "LogEntry.h"
#import "EntrySvcSQLite.h"

@interface SQLiteTests : XCTestCase

@end

@implementation SQLiteTests

- (void)testEntrySvcSQLite{
    NSLog (@"");
    NSLog (@"***Starting testEntrySvcSQLite***");
    
    //Put test code here
    
    EntrySvcSQLite *entrySvc = [[EntrySvcSQLite alloc] init]; //initializing service, to test database location
    LogEntry *entry = [[LogEntry alloc] init]; //testing creating a new entry
    entry.type = @"Training";
    entry.hours = @"5";
    entry.logDate = @"04/02/2015";
    [entrySvc createEntry:entry];
    
    NSMutableArray *entries = [entrySvc retrieveAllEntries];
    NSLog (@"Number of entries: %li", entries.count);
    
    entry.type = @"Coaching";
    entry.hours = @"5";
    entry.logDate = @"03/07/2015";
    [entrySvc updateEntry:entry];
    
    [entrySvc deleteEntry:entry];
    
    NSLog (@"***Ending testEntrySvcSQLite***");
}

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    XCTAssert(YES, @"Pass");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
