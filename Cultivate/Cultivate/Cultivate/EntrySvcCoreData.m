//
//  EntrySvcCoreData.m
//  Cultivate
//
//  Created by Lisa Matter on 2/21/15.
//  Copyright (c) 2015 MSSE 650. All rights reserved.
//

#import "EntrySvcCoreData.h"
#import <CoreData/CoreData.h>
#import "AppDelegate.h"

@implementation EntrySvcCoreData


-(id) init{
    if (self = [super init]){
     //   [self initializeCoreData];
        return self;
    }
    return nil;
}

/* this is now all handled in appDelegate.m
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
*/

-(Entry*) createManagedEntry{
    AppDelegate *delegate = [UIApplication sharedApplication].delegate;
    NSManagedObjectContext *context = [delegate managedObjectContext];
    
    Entry *entry =
    [NSEntityDescription insertNewObjectForEntityForName:@"Entry" inManagedObjectContext:context];
    
    return entry;
}

-(Entry*) createEntry:(Entry*)entry{
    AppDelegate *delegate = [UIApplication sharedApplication].delegate;
    NSManagedObjectContext *context = [delegate managedObjectContext];
    
    Entry *managedEntry =
    [self createManagedEntry];
    managedEntry.type = entry.type;
    managedEntry.hours = entry.hours;
    managedEntry.date = entry.date;
    NSError *error;
    if(![context save:&error]){
        NSLog(@"createEntry Error: %@", [error localizedDescription]);
    }
    return managedEntry;
}

-(NSArray*) retrieveAllEntries{
    AppDelegate *delegate = [UIApplication sharedApplication].delegate;
    NSManagedObjectContext *context = [delegate managedObjectContext];
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Entry" inManagedObjectContext:context];
    [fetchRequest setEntity:entity];
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"type" ascending:YES];
    [fetchRequest setSortDescriptors:@[sortDescriptor]];
    
    NSError *error;
    NSArray *fetchedObjects = [context executeFetchRequest:fetchRequest error:&error];
    
    return fetchedObjects;
}

-(Entry*) updateEntry:(Entry*)entry{
    
    AppDelegate *delegate = [UIApplication sharedApplication].delegate;
    NSManagedObjectContext *context = [delegate managedObjectContext];
    NSError *error;
    if(![context save:&error]){
        NSLog(@"updateEntry Error: %@", [error localizedDescription]);
    }
    return entry;
}

-(Entry*) deleteEntry:(Entry*)entry{
    AppDelegate *delegate = [UIApplication sharedApplication].delegate;
    NSManagedObjectContext *context = [delegate managedObjectContext];
    [context deleteObject:entry];
    return entry;
}

@end

