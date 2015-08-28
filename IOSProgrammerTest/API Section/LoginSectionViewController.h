//
//  APISectionViewController.h
//  IOSProgrammerTest
//
//  Created by Justin LeClair on 12/15/14.
//  Copyright (c) 2014 AppPartner. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginSectionViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *username;
@property (strong, nonatomic) IBOutlet UITextField *password;


@property (strong, nonatomic) NSDate *startRequest;
@property (strong, nonatomic) NSDate *finishRequest;
@property (nonatomic) NSTimeInterval totalTime;

@end
