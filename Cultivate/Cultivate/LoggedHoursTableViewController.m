//
//  LoggedHoursTableViewController.m
//  Cultivate
//
//  Created by Lisa Matter on 2/1/15.
//  Copyright (c) 2015 MSSE 650. All rights reserved.
//

#import "LoggedHoursTableViewController.h"
#import "Entry.h"
#import "AddEntryViewController.h"
#import "EntrySvcCoreData.h"
#import "AppDelegate.h"

@interface LoggedHoursTableViewController ()

@property (strong) NSMutableArray *entries;

@end

@implementation LoggedHoursTableViewController

EntrySvcCoreData * entrySvcCD = nil;


- (void) viewDidLoad{
    [super viewDidLoad];
    AppDelegate *delegate = [UIApplication sharedApplication].delegate;
    NSManagedObjectContext *context = [delegate managedObjectContext];
    
    NSLog (@"fetching object");
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"Entry"];
    self.entries = [[context executeFetchRequest:fetchRequest error:nil] mutableCopy];
    
    NSLog (@"objects fetched");
    [self.tableView reloadData];
    //entrySvc = [[EntrySvcCoreData alloc] init];
    }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) viewWillAppear:(BOOL)animated{
    
}

-(void) viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
   
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    // Return the number of rows in the section.
    NSLog (@"retrieving fetched objects");
    NSArray *fetchedObjects = [[NSArray alloc]init];
    [entrySvcCD retrieveAllEntries];
    return fetchedObjects.count;
    NSLog (@"%lu objects fetched", (unsigned long)fetchedObjects.count);
    //Figure out how to return the number of fetched objects
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    // Return the number of sections.
    return 1;
    //with return one this will allow for one section
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    //create cell from prototype
    NSString *cellID = @"ListPrototypeCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    
    //configure the cell
    Entry *entry = [[entrySvcCD retrieveAllEntries] objectAtIndex:indexPath.row];
    cell.textLabel.text = [NSString stringWithFormat:@"%@, %@ hours", entry.type, entry.hours];
    cell.detailTextLabel.text = entry.date;
        NSLog(@"created cell...");
    
    return cell;
}




#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    self.selectedItemIndex = indexPath;
    
    //perform segue to AddEntryViewControleer
    [self performSegueWithIdentifier:@"updateEntry" sender:self];
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSLog(@"ViewController::didSelectRowAtIndexPath -- Exiting...");
}


#pragma mark - Navigtion

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    // Get the new view controller using [segue destinationViewController].
    
    NSLog(@"prepare for segue from: %@",segue.identifier);
    
    // Check seque identifier
    if ([segue.identifier isEqualToString:@"updateEntry"]){
        
        NSLog(@"prepareForSegue-update");
        
        Entry *entryToPass = [[entrySvcCD retrieveAllEntries] objectAtIndex:self.selectedItemIndex.row];
        
        NSLog([NSString stringWithFormat:@"selected = %@", entryToPass]);
        
        //Pass workout to the destination view controller
        AddEntryViewController *addEntryVC = (AddEntryViewController *)[segue destinationViewController];
        addEntryVC.selectedEntry = entryToPass;
        
    }else if ([segue.identifier isEqualToString:@"AddEntry"]){
        NSLog(@"prepareForSegue-add");
    
        Entry *entryToPass = nil;
        NSLog([NSString stringWithFormat:@"selected = %@", entryToPass]);
        
        //Pass nil
        AddEntryViewController *addEntryVC = [segue destinationViewController];
        addEntryVC.selectedEntry = entryToPass;
        
    }
    
    NSLog(@"prepareForSegue -- Exiting");
}


- (IBAction)addEntryButton:(id)sender {
    NSLog(@"addEntryButton -- Entering...");
    
    //perform segue
    [self performSegueWithIdentifier:@"addEntry" sender:self];
    
    NSLog(@"addEntryButton -- Exiting...");
    
}

/*
 - (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    {
    Entry *entry = [[Entry alloc] init];
        [entrySvc updateEntry:entry];
    }
}

#pragma mark - Navigation

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    UpdateEntryViewController *source =[segue sourceViewController];
     LogEntry *type = source.logEntry;
     if(type !=nil){
         [self.LogEntries addObject:type];
         [self.tableView reloadData];
 //This is another attempt to pass the right data to the table view when a row is selelcted to update.
         
      }
    
    
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


*/
@end
