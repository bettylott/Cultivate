//
//  Cultivate_FinalTests.m
//  Cultivate FinalTests
//
//  Created by Lisa Matter on 2/25/15.
//  Copyright (c) 2015 MSSE 650. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import <CoreData/CoreData.h>
#import "AppDelegate.h"
#import "ViewController.h"
#import "EntryTableViewController.h"

@interface Cultivate_FinalTests : XCTestCase

@end

@implementation Cultivate_FinalTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testingEntry {
    //retrieve context
        NSManagedObjectContext *context = nil;
        id delegate = [[UIApplication sharedApplication] delegate];
        if ([delegate performSelector:@selector(managedObjectContext)])
            context = [delegate managedObjectContext];
    
   //test the creation of an entry
    
    NSLog (@"***Starting test Create Entry***");
    NSManagedObject *newEntry = [NSEntityDescription insertNewObjectForEntityForName:@"Entry" inManagedObjectContext:context];
    NSLog (@"Input new object");
    [newEntry setValue:(@"training") forKey:@"type"];
    [newEntry setValue:(@"3") forKey:@"hours"];
    [newEntry setValue:(@"3/23/14") forKey:@"date"];
    NSLog (@"Retrieve new entry: %@, %@, %@", [newEntry valueForKey:@"type"], [newEntry valueForKey:@"hours"], [newEntry valueForKey:@"date"]);

    //testing retrieve all entries from context
    NSArray *entries = [[NSArray alloc] init];
    NSManagedObjectContext *managedObjectContext = [delegate managedObjectContext];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"Entry"];
    entries = [[managedObjectContext executeFetchRequest:fetchRequest error:nil] mutableCopy];
    
    NSLog (@"Number of entries is: %lu", entries.count);

    //testing deleting an entry
    [context deleteObject:[entries objectAtIndex:1]];
    NSLog (@"Entry deleted");
    
    //testing update; an entry
    NSLog (@"pass selected entry to add/update view");
    NSManagedObject *entry = [NSEntityDescription insertNewObjectForEntityForName:@"Entry" inManagedObjectContext:context];
    NSLog (@"Set text for updates = %@, %@, %@", [entry valueForKey:@"type"], [entry valueForKey:@"hours"], [entry valueForKey:@"date"]);
    [entry setValue:@"observation" forKey:@"type"];
    [entry setValue:@"8" forKey:@"hours"];
    [entry setValue:@"3/5/14" forKey:@"date"];
    NSLog (@"updated entry sent to table");
    NSLog (@"update entry is: %@, %@, %@", [entry valueForKey:@"type"], [entry valueForKey:@"hours"], [entry valueForKey:@"date"]);
    
    
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
