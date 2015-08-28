//
//  AnimationSectionViewController.m
//  IOSProgrammerTest
//
//  Created by Justin LeClair on 12/15/14.
//  Copyright (c) 2014 AppPartner. All rights reserved.
//

#import "AnimationSectionViewController.h"
#import "MainMenuViewController.h"

@interface AnimationSectionViewController ()

@end

@implementation AnimationSectionViewController
NSUInteger count;
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.icon.userInteractionEnabled = YES;
    count = 0;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)backAction:(id)sender
{
    MainMenuViewController *mainMenuViewController = [[MainMenuViewController alloc] init];
    [self.navigationController pushViewController:mainMenuViewController animated:YES];
}

- (IBAction)spin:(id)sender {

    
    CABasicAnimation *rotationAnimation;
    rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    rotationAnimation.toValue = [NSNumber numberWithFloat: M_PI * 2.0 ];
    rotationAnimation.duration = .5;
    
    [self.icon.layer addAnimation:rotationAnimation forKey:@"transform.rotation"];
    count++;
    if (count == 1) {
        UIAlertView * alert =[[UIAlertView alloc ] initWithTitle:@"Warning!"
                                                         message:@"Don't Push that Button!"
                                                        delegate:self
                                               cancelButtonTitle:@"OK"
                                               otherButtonTitles: nil];
        
        [alert show];
    }
    if (count == 2) {
        UIAlertView * alert =[[UIAlertView alloc ] initWithTitle:@"Warning!"
                                                         message:@"For real, stop it."
                                                        delegate:self
                                               cancelButtonTitle:@"OK"
                                               otherButtonTitles: nil];
        
        [alert show];
    }

    if (count == 3) {
        [self explode];
    }
    if (count == 4) {
        UIAlertView * alert =[[UIAlertView alloc ] initWithTitle:@"I hope your happy now!"
                                                         message:@"That Icon wasn't cheap!"
                                                        delegate:self
                                               cancelButtonTitle:@"OK"
                                               otherButtonTitles: nil];
        
        [alert show];
        MainMenuViewController *mainMenuViewController = [[MainMenuViewController alloc] init];
        [self.navigationController pushViewController:mainMenuViewController animated:YES];
    }

    
    
    
}
- (IBAction)drag:(UIPanGestureRecognizer *)sender {
    
    
    CGPoint point = [sender locationInView:self.view];
    self.icon.center = point;
    [sender setTranslation:CGPointZero inView:self.view];


}
- (void)explode{
    
    //[_appPartnerIcon setHidden:YES];
    NSMutableArray *images = [NSMutableArray array];
    
    for (NSUInteger i = 10001; i <= 10089; i++) {
        NSString *imageName = [NSString stringWithFormat:@"explosion_%lu.png", (unsigned long)i];
        [images addObject:[UIImage imageNamed:imageName]];
    }
    
    _explosion.animationImages = images;

    [_explosion setAnimationRepeatCount:1];
    [_explosion setAnimationDuration:5];
    [_explosion startAnimating];
    [_icon setHidden:YES];
    
    
}


@end
