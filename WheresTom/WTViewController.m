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
@property CLLocationManager *manager;
@end

@implementation WTViewController 

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.manager = [[CLLocationManager alloc] init];
        [self.manager setDelegate:self];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"Loaded...");
    self.city.text = @"Loaded";
    [self.manager startUpdatingLocation];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    CLLocation *location = locations.firstObject;
    
    NSLog(@"%f, %f", location.coordinate.latitude, location.coordinate.longitude);
}

@end
