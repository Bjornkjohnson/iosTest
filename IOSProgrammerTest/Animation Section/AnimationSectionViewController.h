//
//  AnimationSectionViewController.h
//  IOSProgrammerTest
//
//  Created by Justin LeClair on 12/15/14.
//  Copyright (c) 2014 AppPartner. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AnimationSectionViewController : UIViewController

- (IBAction)spin:(id)sender;
- (IBAction)drag:(UIPanGestureRecognizer *)sender;
@property (strong, nonatomic) IBOutlet UIImageView *icon;
//@property (strong, nonatomic) IBOutlet UIPanGestureRecognizer *iconDrag;
@property (weak, nonatomic) IBOutlet UIImageView *explosion;


@end
