//
//  ViewController.m
//  Cultivate-Table
//
//  Created by Lisa Matter on 1/25/15.
//  Copyright (c) 2015 MSSE 650. All rights reserved.
//

#import "ViewController.h"
#import "Entry.h"
#import "EntrySvcCache.h"



@interface ViewController ()

@end

@implementation ViewController

EntrySvcCache *entrySvc =nil;

-(void) viewDidLoad
{
    [super viewDidLoad];
    entrySvc = [[EntrySvcCache alloc] init];
}


- (IBAction)saveEntry:(id)sender {
    NSLog(@"saveEntry: entering");
    
    [self.view endEditing:YES];
    Entry *entry = [[Entry alloc] init];
    entry.type=_type.text;
    entry.hours=_hours.text;
    entry.date=_date.text;
    [entrySvc createEntry:entry];
    
    NSLog(@"saveEntry: entry saved");
}

- (IBAction)deleteEntry:(id)sender {
    NSLog (@"deleteEntry:removing");
    
    [self.view endEditing:YES];
    Entry *entry = [[Entry alloc] init];
    entry.type=_type.text;
    entry.hours=_hours.text;
    entry.date=_date.text;
    [entrySvc deleteEntry:entry];
    
    NSLog(@"deleteEntry: entry removed");
}

//-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
//{
//if ([[segue identifier] isEqualToString:@"loggedHours"])
//{
    

//}}



@end
