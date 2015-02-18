//
//  CultivateTests.m
//  CultivateTests
//
//  Created by Lisa Matter on 2/1/15.
//  Copyright (c) 2015 MSSE 650. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "LogEntry.h"
#import "EntrySvcArchive.h"


@interface CultivateTests : XCTestCase

@end

@implementation CultivateTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testEntrySvcArchiver {
    EntrySvcArchive *entrySvc = [[EntrySvcArchive alloc ] init];
    int initialCount = [[entrySvc retrieveAllEntries] count];
    
    LogEntry*logEntry = [[LogEntry alloc] init];
    logEntry.type = @"training";
    logEntry.hours = @"4";

    [entrySvc createEntry:(LogEntry*)logEntry];
    int finalCount = [[entrySvc retrieveAllEntries] count];
    
    NSLog (@"***endingTestEntrySvcArchive***");
    XCTAssertEqual(initialCount +1, finalCount,@"initial count %d, final count %d", initialCount, finalCount);
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
