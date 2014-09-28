//
//  MenuTableViewController.m
//  Polls4Change
//
//  Created by Roel Castano on 9/27/14.
//  Copyright (c) 2014 P4C. All rights reserved.
//

#import "MenuTableViewController.h"
#import <REFrostedViewController/REFrostedViewController.h>
#import "User.h"
#import "FeedViewController.h"
#import "SettingsViewController.h"
#import "ProfileViewController.h"
#import "PollSentViewController.h"
#import "ILSession.h"

const int ILNumberOfRowsInSection = 4;
const int ILNumberOfSections = 1;

@interface MenuTableViewController () <UITableViewDelegate>

@property (strong, nonatomic) UINavigationController *navController;
@property (strong, nonatomic) IBOutlet UITableView *menuTableView;
@property (strong, nonatomic) IBOutlet UIImageView *userProfileImageView;

@end

@implementation MenuTableViewController

-(void)viewWillAppear:(BOOL)animated
{
    self.navController =  [self.storyboard instantiateViewControllerWithIdentifier:@"contentController"];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.menuTableView.delegate = self;
    
    self.menuTableView.separatorColor = [UIColor colorWithRed:150/255.0f green:161/255.0f blue:177/255.0f alpha:1.0f];
    self.menuTableView.opaque = YES;
    self.menuTableView.backgroundColor = [UIColor clearColor];

    self.navController.navigationItem.titleView.tintColor = [UIColor whiteColor];
    self.navController.navigationItem.title = @"Feed";
    
    User *currentUser = [activeSession currentUser];
    
    //self.userName.text = currentUser.name;
    self.userProfileImageView.layer.cornerRadius = self.userProfileImageView.frame.size.width / 2;
    self.userProfileImageView.clipsToBounds = YES;
    self.userProfileImageView.image = [UIImage imageNamed:@"faceBrad"];
//    if ([currentUser.avatarURL length] > 0) {
////        self.userImageView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString: currentUser.avatarURL]]];
////        self.userImageView.layer.cornerRadius = self.userImageView.frame.size.width / 2;
////        self.userImageView.clipsToBounds = YES;
////        self.userImageView.contentMode = UIViewContentModeScaleAspectFill;
//    }
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return ILNumberOfRowsInSection;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return ILNumberOfSections;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
  if (indexPath.row == 0) {
    } else if (indexPath.row == 1){
        FeedViewController *feedVC = [self.storyboard instantiateViewControllerWithIdentifier:@"feedVC"];
        self.navController.viewControllers = @[feedVC];
    } else if (indexPath.row == 2){
        ProfileViewController *profileVC = [self.storyboard instantiateViewControllerWithIdentifier:@"profileVC"];
        self.navController.viewControllers = @[profileVC];
    } else if (indexPath.row == 3){
        SettingsViewController *configVC = [self.storyboard instantiateViewControllerWithIdentifier:@"configVC"];
        self.navController.viewControllers = @[configVC];

    }
//    } else if (indexPath.row == 4) {
//        ILUser *user = [[ILUser alloc] init];
//        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
//        [user logOutWithSuccess:^(RKObjectRequestOperation *operation, RKMappingResult *mappingResult) {
//            [self.frostedViewController hideMenuViewController];
//            [self dismissViewControllerAnimated:YES completion:nil];
//            [activeSession clearSessionAndToken];
//            [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
//        } failure:^(RKObjectRequestOperation *operation, NSError *error) {
//            NSLog(@"Error - Could not logout user");
//        }];
//    }
    if (NSLocationInRange(indexPath.row, NSMakeRange(0, 5))) {
        self.frostedViewController.contentViewController = self.navController;
        [self.frostedViewController hideMenuViewController];
    }
    
}
@end
