//
//  EntrySvcCoreData.m
//  Cultivate
//
//  Created by Lisa Matter on 2/21/15.
//  Copyright (c) 2015 MSSE 650. All rights reserved.
//

#import "EntrySvcCoreData.h"
#import <CoreData/CoreData.h>

@implementation EntrySvcCoreData

NSManagedObjectModel * model = nil;
NSPersistentStoreCoordinator *psc = nil;
NSManagedObjectContext *moc = nil;


-(id) init{
    if (self = [super init]){
        [self initializeCoreData];
        return self;
    }
    return nil;
}

-(void) initializeCoreData{
    //load the schema model
    NSLog (@"initializing coreData model");
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"Model" withExtension:@"momd"];
    model = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    
    //initialization for store coordinator
    NSURL *applicationDocumentsDirectory = [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
    
    NSURL *storeURL = [applicationDocumentsDirectory URLByAppendingPathComponent:@"cultivate.sql"];
    NSError *error = nil;
    psc = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:model];
    if([psc addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]){
        //initialize managed object
        moc = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
        [moc setPersistentStoreCoordinator:psc];
    }else{
        NSLog(@"initialize CoreData FAILED with error %@", error);
    }
}

+ (Entry *) createManagedEntry {
    
    Entry *entry = [NSEntityDescription insertNewObjectForEntityForName:@"Entry" inManagedObjectContext:moc];
    
    return entry;
    
}

-(Entry*) createManagedEntry{
    
    Entry *entry =
    [NSEntityDescription insertNewObjectForEntityForName:@"Entry" inManagedObjectContext:moc];
    
    return entry;
}

-(Entry*) createEntry:(Entry*)entry{
    
    Entry *managedEntry =
    [self createManagedEntry];
    managedEntry.type = entry.type;
    managedEntry.hours = entry.hours;
    managedEntry.date = entry.date;
    NSError *error;
    if(![moc save:&error]){
        NSLog(@"createEntry Error: %@", [error localizedDescription]);
    }
    return managedEntry;
}

-(NSArray*) retrieveAllEntries{
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Entry" inManagedObjectContext:moc];
    [fetchRequest setEntity:entity];
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"type" ascending:YES];
    [fetchRequest setSortDescriptors:@[sortDescriptor]];
    
    NSError *error;
    NSArray *fetchedObjects = [moc executeFetchRequest:fetchRequest error:&error];
    
    return fetchedObjects;
}

-(Entry*) updateEntry:(Entry*)entry{
    NSError *error;
    if(![moc save:&error]){
        NSLog(@"updateEntry Error: %@", [error localizedDescription]);
    }
    return entry;
}

-(Entry*) deleteEntry:(Entry*)entry{
    [moc deleteObject:entry];
    return entry;
}

@end

