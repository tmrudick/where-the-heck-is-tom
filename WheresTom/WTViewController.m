//
//  WTViewController.m
//  WheresTom
//
//  Created by Tom Rudick on 12/21/13.
//  Copyright (c) 2013 Tom Rudick. All rights reserved.
//

#import "WTViewController.h"

@interface WTViewController ()
@property IBOutlet UILabel *city;
@end

@implementation WTViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.city.text = @"Loaded";
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
