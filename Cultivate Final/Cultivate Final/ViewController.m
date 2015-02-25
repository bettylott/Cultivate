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

@interface ViewController ()



@end

@implementation ViewController

@synthesize entry;

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
    if (self.entry) {
        [self.typeTextField setText:[self.entry valueForKey:@"type"]];
        [self.hoursTextField setText:[self.entry valueForKey:@"hours"]];
        [self.dateTextField setText:[self.entry valueForKey:@"date"]];
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)saveButton:(id)sender {
        NSManagedObjectContext *context = [self managedObjectContext];
    
        // Create a new managed object
        NSManagedObject *newEntry = [NSEntityDescription insertNewObjectForEntityForName:@"Entry" inManagedObjectContext:context];
        [newEntry setValue:self.typeTextField.text forKey:@"type"];
        [newEntry setValue:self.hoursTextField.text forKey:@"hours"];
        [newEntry setValue:self.dateTextField.text forKey:@"date"];
        
        NSError *error = nil;
        // Save the object to persistent store
        if (![context save:&error]) {
            NSLog(@"Can't Save! %@ %@", error, [error localizedDescription]);
        }
        
        [self dismissViewControllerAnimated:YES completion:nil];
    }

- (IBAction)cancelButton:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
