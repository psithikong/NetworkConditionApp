//
//  ViewController2.h
//  NetworkConApp
//
//  Created by paeng on 6/11/13.
//  Copyright (c) 2013 paeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"
#import <MessageUI/MessageUI.h>

@class ViewController2;

@interface ViewController2 : UIViewController<UITableViewDataSource, UITableViewDelegate, MFMailComposeViewControllerDelegate>

- (IBAction)getNewLocationButton:(id)sender;
- (IBAction)emailButton:(id)sender;
@property (weak, nonatomic) IBOutlet UITextView *myComments;
@property (weak, nonatomic) IBOutlet UITableView *myTableView;
@property (weak, nonatomic) IBOutlet UILabel *displayLabel;

@end