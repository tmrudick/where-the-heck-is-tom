//
//  WTViewController.m
//  WheresTom
//
//  Created by Tom Rudick on 12/21/13.
//  Copyright (c) 2013 Tom Rudick. All rights reserved.
//

#import "WTViewController.h"
#import <CoreLocation/CLGeocoder.h>
#import <WindowsAzureMobileServices/WindowsAzureMobileServices.h>

@interface WTViewController ()
@property (nonatomic, weak) IBOutlet UILabel *city;
@property (nonatomic, strong) CLLocationManager *manager;
@property (nonatomic, strong) CLGeocoder *coder;
@property (nonatomic, strong) MSClient *client;
@property (nonatomic, strong) MSTable *table;
@end

@implementation WTViewController 

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.manager = [[CLLocationManager alloc] init];
        [self.manager setDelegate:self];
        
        self.coder = [[CLGeocoder alloc] init];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.manager startMonitoringSignificantLocationChanges];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    CLLocation *location = locations.firstObject;
 
    if (!self.client) {
        self.client = [[MSClient alloc] initWithApplicationURL:[[NSURL alloc] initWithString:@"https://wheretheheckistom.azure-mobile.net/"]  applicationKey:@"APP_KEY"];
        self.table = [self.client tableWithName:@"locations"];
    }
    
    MSTable *table = [self.client tableWithName:@"locations"];
    
    [self.coder reverseGeocodeLocation:location completionHandler:^(NSArray *placemarks, NSError *error) {
        CLPlacemark *placemark = placemarks.firstObject;
        
        // Update label
        self.city.text = placemark.locality;
        
        // Build dictionary
        NSMutableDictionary *data = [[NSMutableDictionary alloc] init];
        
        [data setObject:[[NSNumber alloc] initWithDouble:location.coordinate.latitude] forKey:@"latitude"];
        [data setObject:[[NSNumber alloc] initWithDouble:location.coordinate.longitude] forKey:@"longitude"];
        [data setObject:placemark.locality forKey:@"locality"];
        [data setObject:placemark.administrativeArea forKey:@"area"];
        
        [table insert:data completion:^(NSDictionary *item, NSError *error) {
            // Do nothing
        }];
    }];
}

@end
