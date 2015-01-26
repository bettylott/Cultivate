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

EntrySvcCache *entrySvc = nil;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    entrySvc = [[EntrySvcCache alloc] init];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)saveEntry:(id)sender {
    NSLog (@"saveEntry:entering");
    
    [self.view endEditing: YES];
    
    Entry *entry =[[Entry alloc] init];
    entry.type = _type.text;
    entry.hours =_hours.text;
    entry.date = _date.text;
    [entrySvc createEntry:entry];
    
    [self.tableView reloadData];
    NSLog(@"saveEntry:entry saved");
}

- (IBAction)deleteEntry:(id)sender {
    NSLog (@"deleteEntry");
    
    [self.view endEditing:YES];
}

-(NSInteger)tableView:(UITableView*)tableView
numberOfRowsInSection:(NSInteger)section
{
    return [[entrySvc retrieveAllEntries] count];
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString*simpleTableIdentifier=@"SimpleTableItem";
    UITableViewCell*cell= [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if(cell==nil) {
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    Entry *entry=[[entrySvc retrieveAllEntries]
                  objectAtIndex:indexPath.row];
    cell.textLabel.text=[entry description];
    return cell;
}

@end
