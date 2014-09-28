//
//  P4CLoginViewController.m
//  Polls4Change
//
//  Created by Roel Castano on 9/27/14.
//  Copyright (c) 2014 P4C. All rights reserved.
//

#import "P4CLoginViewController.h"
#import "RootViewController.h"

@interface P4CLoginViewController ()

@end

@implementation P4CLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)signInButtonPressed:(id)sender {
    RootViewController *rootVC = [self.storyboard instantiateViewControllerWithIdentifier:@"rootVc"];
    rootVC.direction = REFrostedViewControllerDirectionLeft;
    rootVC.liveBlurBackgroundStyle = REFrostedViewControllerLiveBackgroundStyleLight;
    rootVC.liveBlur = YES;
    [self presentViewController:rootVC
                       animated:YES
                     completion:nil];

}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
