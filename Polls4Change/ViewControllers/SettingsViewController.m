//
//  SettingsViewController.m
//  Polls4Change
//
//  Created by Marco Ramirez on 9/28/14.
//  Copyright (c) 2014 P4C. All rights reserved.
//

#import "SettingsViewController.h"
#import <REFrostedViewController/REFrostedViewController.h>

@interface SettingsViewController ()

@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)didPressMenuButton:(id)sender {
    [self.view endEditing:YES];
    [self.frostedViewController.view endEditing:YES];
    [self.frostedViewController presentMenuViewController];
}

- (IBAction)distanceSlider:(UISlider *)sender {
    int valueSlider = sender.value;
    self.distanceLabel.text = [NSString stringWithFormat:@"%d km", valueSlider];
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
