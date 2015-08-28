//
//  APISectionViewController.m
//  IOSProgrammerTest
//
//  Created by Justin LeClair on 12/15/14.
//  Copyright (c) 2014 AppPartner. All rights reserved.
//

#import "LoginSectionViewController.h"
#import "MainMenuViewController.h"

@interface LoginSectionViewController ()

@end

@implementation LoginSectionViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
}
// placeholder position
- (CGRect)textRectForBounds:(CGRect)bounds {
    return CGRectInset( bounds , 150 , 10 );
}

// text position
- (CGRect)editingRectForBounds:(CGRect)bounds {
    return CGRectInset( bounds , 150 , 10 );
}

- (void)httpGetRequest{
    NSURL *url = [NSURL URLWithString:@"http://dev.apppartner.com/AppPartnerProgrammerTest/scripts/login.php"];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    request.HTTPMethod = @"POST";
    
    //NSString *credentials = @"username=SuperBoise&password=qwerty";
    NSString *credentials = [NSString stringWithFormat:@"username=%@&password=%@", self.username.text, self.password.text];
    NSLog(@"%@",credentials);
    NSData *bodyCredentials = [credentials dataUsingEncoding:NSUTF8StringEncoding];
    request.HTTPBody = bodyCredentials;
    self.startRequest = [NSDate date];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        //handle response
        [self getData:data];
    }];
    
    
    
}

- (void)getData:(NSData *) data {
    NSError *error = nil;
    NSDictionary *recievedData = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
    NSLog(@"%@",recievedData);
    self.finishRequest = [NSDate date];
    self.totalTime = [self.startRequest timeIntervalSinceDate:self.finishRequest];
    NSLog(@"wooo %f", self.totalTime);
    
    NSString *code = [recievedData valueForKey:@"code"];
    NSString *message = [recievedData valueForKey:@"message"];
    NSString *alert = [NSString stringWithFormat:@"%@\n The API call took %f milliseconds",message, self.totalTime *1000 ];
    
    
    UIAlertView *alertMessage = [[UIAlertView alloc]initWithTitle:code message:alert delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
    [alertMessage show];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)loginButton:(id)sender {
    
    [self httpGetRequest];
}


- (IBAction)backAction:(id)sender
{
    MainMenuViewController *mainMenuViewController = [[MainMenuViewController alloc] init];
    [self.navigationController pushViewController:mainMenuViewController animated:YES];
}

- (void)alertView:(UIAlertView *)alertView
clickedButtonAtIndex:(NSInteger)buttonIndex{
    MainMenuViewController *mainMenuViewController = [[MainMenuViewController alloc] init];
    [self.navigationController pushViewController:mainMenuViewController animated:YES];
}

@end
