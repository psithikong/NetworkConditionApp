//
//  ViewController2.m
//  NetworkConApp
//
//  Created by paeng on 6/11/13.
//  Copyright (c) 2013 paeng. All rights reserved.
//

#import "ViewController2.h"

@interface ViewController2 (){
    NSArray *arrayOfNames;
}
@end

@implementation ViewController2
@synthesize displayLabel;

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
	// Do any additional setup after loading the view.
    arrayOfNames = [[NSArray alloc]initWithObjects:@"Network is excellent.",@"Network is okay.", @"Network is bad.",@"Network is not working.",nil];
    self.myTableView.delegate=self;
    self.myTableView.dataSource=self;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return arrayOfNames.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIndentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIndentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIndentifier];
    }
    cell.textLabel.text = [arrayOfNames objectAtIndex:indexPath.row];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    displayLabel.text = [arrayOfNames objectAtIndex:indexPath.row];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)getNewLocationButton:(id)sender {
    ViewController *vc=[self.storyboard instantiateViewControllerWithIdentifier:@"ViewController"];
    [self presentViewController:vc animated:YES completion:nil];
    
}
- (IBAction)emailButton:(id)sender {
    MFMailComposeViewController *mailController=[[MFMailComposeViewController alloc]init];
    [mailController setMailComposeDelegate:self];
    NSString *email = @"psithikong.pratt14@gmail.com";
    NSArray *emailArray=[[NSArray alloc]initWithObjects:email, nil];
    NSString *message =[[self displayLabel]text];
    NSString *comments =[[self myComments]text];
    NSArray *msgArray =[[NSArray alloc]initWithObjects:message,comments,nil];
    NSString *allMessage = [msgArray componentsJoinedByString:@" -Comments: "];
    [mailController setMessageBody:allMessage isHTML:NO];
    [mailController setToRecipients:emailArray];
    [mailController setSubject:@"Network Response"];
    [self presentViewController:mailController animated:YES completion:nil];
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [[self myComments]resignFirstResponder];
}
-(void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error{
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end

