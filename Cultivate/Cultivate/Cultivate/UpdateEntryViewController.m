//
//  UpdateEntryViewController.m
//  Cultivate
//
//  Created by Lisa Matter on 2/14/15.
//  Copyright (c) 2015 MSSE 650. All rights reserved.
//

#import "UpdateEntryViewController.h"

@interface UpdateEntryViewController ()
@property (weak, nonatomic) IBOutlet UITextField *changeType;
@property (weak, nonatomic) IBOutlet UITextField *changeHours;
@property (weak, nonatomic) IBOutlet UITextField *changeDate;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *updateButton;
@end

@implementation UpdateEntryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
        if (sender != self.updateButton) return;
        if (self.changeType.text.length > 0){
            self.logEntry = [[LogEntry alloc] init];
            self.logEntry.type = _changeType.text;
            self.logEntry.hours = _changeHours.text;
            self.logEntry.logDate = _changeDate.text;
        }
}

@end
