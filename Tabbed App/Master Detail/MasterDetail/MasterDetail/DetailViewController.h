//
//  DetailViewController.h
//  MasterDetail
//
//  Created by Lisa Matter on 1/30/15.
//  Copyright (c) 2015 MSSE 650. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end

