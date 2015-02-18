//
//  ViewController.m
//  Cultivate-SQL
//
//  Created by Lisa Matter on 2/15/15.
//  Copyright (c) 2015 MSSE 650. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

//@property (nonatomic, strong) DBManager *dbManager;
//@property (nonatomic, strong) NSAray

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //self.tblEntries.delegate = self;
    //self.tblEntries.dataSource = self;
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)addNewRecord:(id)sender{
    [self performSegueWithIdentifier:@"idSegueEditInfo" sender: self];
}

@end
