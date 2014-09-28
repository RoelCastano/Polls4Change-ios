//
//  PollExpandableCellTableViewCell.h
//  Polls4Change
//
//  Created by Marco Ramirez on 9/27/14.
//  Copyright (c) 2014 P4C. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PollExpandableCellTableViewCell;

@protocol PollExpandableCellTableViewCellDelegate <NSObject>

@required
- (void)pollExpandableCellButtonPressed:(PollExpandableCellTableViewCell *)pollExpandableCell;

@end


@interface PollExpandableCellTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *companyNameImageView;
@property (weak, nonatomic) IBOutlet UIImageView *charityNameImageView;
@property (weak, nonatomic) IBOutlet UILabel *pollTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *pollQuestionNumberLabel;
@property (weak, nonatomic) IBOutlet UILabel *pollDescriptionLabel;
@property (weak, nonatomic) IBOutlet UILabel *pollRewardsLabel;
@property (weak, nonatomic) IBOutlet UIView *expandedContentView;
@property (weak, nonatomic) IBOutlet UIImageView *expandIconImageView;
@property (assign) BOOL expanded;

@property(strong, nonatomic) id<PollExpandableCellTableViewCellDelegate> delegate;

@end
