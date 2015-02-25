//
//  AddEntryViewController.m
//  Cultivate
//
//  Created by Lisa Matter on 2/1/15.
//  Copyright (c) 2015 MSSE 650. All rights reserved.
//

#import "AddEntryViewController.h"
#import "EntrySvcCoreData.h"
#import "AppDelegate.h"

@interface AddEntryViewController ()

@end

@implementation AddEntryViewController

EntrySvcCoreData *entrySvc = nil;

@synthesize selectedEntry;


-(void) setSelectedEntry:(Entry *)passedEntry{
    selectedEntry = passedEntry;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.type.text = self.selectedEntry.type;
    self.hours.text = self.selectedEntry.hours;
    self.date.text = self.selectedEntry.date;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
/*
- (NSManagedObjectContext *)managedObjectContext {
    NSManagedObjectContext *context = nil;
    id delegate = [[UIApplication sharedApplication] delegate];
    if ([delegate performSelector:@selector(managedObjectContext)]) {
        context = [delegate managedObjectContext];
    }
    return context;
}
 */
    
- (IBAction)saveButton:(id)sender {
    /*NSLog(@"saveButton Entering...");
    
    //dismiss keyboard
    [self.view endEditing:YES];
    
    if([self.type.text length] != 0){
        NSLog(@"after saveButton if statament");
        
        Entry *entryNew = [[Entry alloc] init];
        [entrySvc createEntry:entryNew ];
       //NSEntityDescription *entryNew = [NSEntityDescription insertNewObjectForEntityForName:@"Entry" inManagedObjectContext:moc];
        entryNew.type = self.type.text;
        entryNew.hours = self.hours.text;
        entryNew.date = self.date.text;
        //[entryNew setValue:self.type.text forKey:@"type"];
        //[entryNew setValue:self.hours.text forKey:@"hours"];
        //[entryNew setValue:self.date.text forKey:@"date"];
        }
    */
    
    //dismiss keyboard
    [self.view endEditing:YES];
    
    
    AppDelegate *delegate = [UIApplication sharedApplication].delegate;
    NSManagedObjectContext *context = [delegate managedObjectContext];
    Entry *entryNew = [NSEntityDescription
                                   insertNewObjectForEntityForName:@"Entry"
                                   inManagedObjectContext:context];
    [entrySvc createEntry:entryNew];
    [entryNew setValue:self.type.text forKey:@"type"];
    [entryNew setValue:self.hours.text forKey:@"hours"];
    [entryNew setValue:self.date.text forKey:@"date"];
    //NSError *error;
    //if (![context save:&error]) {
      //  NSLog(@"Error:%@", error);
//}

    NSLog(@"Data saved");
    [self.navigationController popToRootViewControllerAnimated:YES];
    }



- (IBAction)updateButton:(id)sender {
    NSLog(@"updateButton -- Entering...");
    
    //dismiss keyboard
    [self.view endEditing:YES];
    
    Entry *entryUpdated = [[Entry alloc] init];
    entryUpdated.type = self.type.text;
    entryUpdated.hours = self.hours.text;
    entryUpdated.date = self.date.text;
    
    if(selectedEntry.type != self.type.text){
        //user is editing the workout name
        [entrySvc deleteEntry:selectedEntry];
        [entrySvc createEntry:entryUpdated];
    }else{
        //user is not editing the workout name
        [entrySvc updateEntry:entryUpdated];
    }
    
    NSLog(@"entry updated -- Exiting...");
    [self.navigationController popToRootViewControllerAnimated:YES];
    
}

- (IBAction)deleteButton:(id)sender {
    NSLog(@"delete entry -- Entering...");
    //dismiss keyboard
    [self.view endEditing:YES];
    [entrySvc deleteEntry:selectedEntry];
    NSLog(@"entry deleted -- Exiting...");
    [self.navigationController popToRootViewControllerAnimated:YES];
}



@end
