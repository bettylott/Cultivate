//
//  ViewController.m
//  Cultivate Final
//
//  Created by Lisa Matter on 2/25/15.
//  Copyright (c) 2015 MSSE 650. All rights reserved.
//

#import "ViewController.h"
#import <CoreData/CoreData.h>
#import "AppDelegate.h"
#import "EntryTableViewController.h"

@interface ViewController ()



@end

@implementation ViewController

@synthesize entry;

-(BOOL)prefersStatusBarHidden{
    return YES;
}

- (NSManagedObjectContext *)managedObjectContext {
    NSManagedObjectContext *context = nil;
    id delegate = [[UIApplication sharedApplication] delegate];
    if ([delegate performSelector:@selector(managedObjectContext)]) {
        context = [delegate managedObjectContext];
    }
    return context;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog (@"Loading, entry = %@, %@, %@", [self.entry valueForKey:@"type"],[self.entry valueForKey:@"hours"], [self.entry valueForKey:@"date"]);
    
    if (self.entry) {
        [self.typeTextField setText:[self.entry valueForKey:@"type"]];
        [self.hoursTextField setText:[self.entry valueForKey:@"hours"]];
        [self.dateTextField setText:[self.entry valueForKey:@"date"]];
        NSLog (@"Entry = %@, %@, %@", [self.entry valueForKey:@"type"],[self.entry valueForKey:@"hours"], [self.entry valueForKey:@"date"]);
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)saveButton:(id)sender {
        NSManagedObjectContext *context = [self managedObjectContext];
    
    if (self.entry) {
        NSLog (@"Set text for updates = %@, %@, %@", [self.entry valueForKey:@"type"], [self.entry valueForKey:@"hours"], [self.entry valueForKey:@"date"]);
        [self.entry setValue:self.typeTextField.text forKey:@"type"];
        [self.entry setValue:self.hoursTextField.text forKey:@"hours"];
        [self.entry setValue:self.dateTextField.text forKey:@"date"];
        NSLog (@"updated entry sent to table");
    }
    
    else{
    
        // Create a new managed object
        NSManagedObject *newEntry = [NSEntityDescription insertNewObjectForEntityForName:@"Entry" inManagedObjectContext:context];
        NSLog (@"Input new object");
        [newEntry setValue:self.typeTextField.text forKey:@"type"];
        [newEntry setValue:self.hoursTextField.text forKey:@"hours"];
        [newEntry setValue:self.dateTextField.text forKey:@"date"];
        
        NSError *error = nil;
        // Save the object to persistent store
        if (![context save:&error]) {
            NSLog(@"Can't Save! %@ %@", error, [error localizedDescription]);
        }
    }
        [self dismissViewControllerAnimated:YES completion:nil];
    }

- (IBAction)cancelButton:(id)sender {
    NSLog (@"cancel button, back to table");
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
