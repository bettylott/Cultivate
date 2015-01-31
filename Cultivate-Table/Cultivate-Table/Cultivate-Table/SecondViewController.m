//
//  SecondViewController.m
//  Cultivate-Table
//
//  Created by Lisa Matter on 1/30/15.
//  Copyright (c) 2015 MSSE 650. All rights reserved.
//

#import "SecondViewController.h"
#import "ViewController.h"

#import "Entry.h"
#import "EntrySvcCache.h"
#import "EntrySvc.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

EntrySvcCache *entrySvc = nil;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
