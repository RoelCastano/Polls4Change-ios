//
//  PollExpandableCellTableViewCell.m
//  Polls4Change
//
//  Created by Marco Ramirez on 9/27/14.
//  Copyright (c) 2014 P4C. All rights reserved.
//

#import "PollExpandableCellTableViewCell.h"
#import "FeedViewController.h"

@interface PollExpandableCellTableViewCell ()

@property (strong, nonatomic) IBOutlet UIButton *answerButton;

@end

@implementation PollExpandableCellTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.answerButton.layer.cornerRadius = 5;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (IBAction)didPressAnswerButton:(id)sender {
    if (self.delegate) {
        NSLog(@"ENTERED Deleggate FUNCTION");
        [self.delegate pollExpandableCellButtonPressed:self];
    }

}

@end
