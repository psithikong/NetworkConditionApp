//
//  ViewController.m
//  NetworkConApp
//
//  Created by paeng on 6/11/13.
//  Copyright (c) 2013 paeng. All rights reserved.
//

#import "ViewController.h"
#import "ViewController2.h"

@interface ViewController ()

@end


@implementation ViewController{
    CLLocationManager *locationManager;
    CLGeocoder *geocoder;
    CLPlacemark *placemark;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    locationManager = [[CLLocationManager alloc]init];
    geocoder = [[CLGeocoder alloc]init];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated
}

- (IBAction)confirmLocationButton:(id)sender {
    ViewController2 *vc2 = [self.storyboard instantiateViewControllerWithIdentifier:@"ViewController2"];
    vc2.longitudeVal2=LongitudeVal;
    vc2.latitudeVal2=LatitudeVal;
    [self presentViewController:vc2 animated:YES completion:nil];
    
}
- (IBAction)getMyLocationButton:(id)sender {
    locationManager.delegate=self;
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    [locationManager startUpdatingLocation];
}
#pragma mark - CLLocationManagerDelegate
@synthesize LongitudeVal;
@synthesize LatitudeVal;
@synthesize addressVal
;
- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSLog(@"didFailWithError: %@", error);
    UIAlertView *errorAlert = [[UIAlertView alloc]
                               initWithTitle:@"Error" message:@"Failed to Get Your Location" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [errorAlert show];
    
}


- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    NSLog(@"didUpdateToLocation: %@", newLocation);
    CLLocation *currentLocation = newLocation;
    
    if (currentLocation != nil) {
        LongitudeVal.text = [NSString stringWithFormat:@"%.8f", currentLocation.coordinate.longitude];
        LatitudeVal.text = [NSString stringWithFormat:@"%.8f", currentLocation.coordinate.latitude];
        // Reverse Geocoding
        NSLog(@"Resolving the Address");
        [geocoder reverseGeocodeLocation:currentLocation completionHandler:^(NSArray *placemarks, NSError *error) {
            NSLog(@"Found placemarks: %@, error: %@", placemarks, error);
            if (error == nil && [placemarks count] > 0) {
                placemark = [placemarks lastObject];
                addressVal.text = [NSString stringWithFormat:@"%@ %@\n%@ %@\n%@\n%@",
                                   placemark.subThoroughfare, placemark.thoroughfare,
                                   placemark.postalCode, placemark.locality,
                                   placemark.administrativeArea,
                                   placemark.country];
            } else {
                NSLog(@"%@", error.debugDescription);
            }
        } ];
        
    }
}


@end
