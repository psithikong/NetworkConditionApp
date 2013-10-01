//
//  ViewController.h
//  NetworkConApp
//
//  Created by paeng on 6/11/13.
//  Copyright (c) 2013 paeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController2.h"
#import <CoreLocation/CoreLocation.h>

@interface ViewController : UIViewController

- (IBAction)confirmLocationButton:(id)sender;
- (IBAction)getMyLocationButton:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *LatitudeVal;
@property (weak, nonatomic) IBOutlet UILabel *LongitudeVal;
@property (weak, nonatomic) IBOutlet UILabel *addressVal;


@end

