//
//  TableSectionTableViewCell.m
//  IOSProgrammerTest
//
//  Created by Justin LeClair on 12/15/14.
//  Copyright (c) 2014 AppPartner. All rights reserved.
//

#import "ChatCell.h"

@interface ChatCell ()
@property (nonatomic, strong) IBOutlet UILabel *usernameLabel;
//@property (nonatomic, strong) IBOutlet UITextView *messageTextView;
@property (nonatomic, strong) IBOutlet UILabel *messageLabelView;
@property (nonatomic, strong) IBOutlet UIImageView *avatar;
@end

@implementation ChatCell

- (void)awakeFromNib
{
    // Initialization code
    
    
}

- (void)loadWithData:(ChatData *)chatData
{
    self.usernameLabel.text = chatData.username;
    self.messageLabelView.text = chatData.message;
    
    NSURL *url = [NSURL URLWithString:chatData.avatar_url];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        //handle response
        UIImage *image = [UIImage imageWithData:data];
        self.avatar.image = image;
    }];

    self.avatar.layer.cornerRadius = self.avatar.frame.size.width / 2;
    self.avatar.clipsToBounds = YES;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [self.contentView layoutIfNeeded];
    self.messageLabelView.preferredMaxLayoutWidth = CGRectGetWidth(self.messageLabelView.frame);
    
}
@end
