//
//  PollQuestionsViewController.m
//  Polls4Change
//
//  Created by Marco Ramirez on 9/28/14.
//  Copyright (c) 2014 P4C. All rights reserved.
//

#import "PollQuestionsViewController.h"
#import <HexColors/HexColor.h>
#import <SendGrid/SendGrid.h>

@interface PollQuestionsViewController ()

@property (strong, nonatomic) IBOutlet UILabel *questionLabel;
@property (strong, nonatomic) IBOutlet UIImageView *companyIcon;

@end

@implementation PollQuestionsViewController

-(instancetype)initWithQuestion:(NSString*)question
{
    self = [super init];
    
    if (self) {
        self.questionLabel.text = question;
        self.navigationController.navigationBar.topItem.title = @"Burger Station";
        [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];

    }
    
    return self;
}

- (void)setQuestionLabel:(NSString *)questionLabel
{
    self.questionLabel.text = questionLabel;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.questionLabel.layer.cornerRadius = 5;
    self.questionLabel.layer.borderColor = [UIColor colorWithHexString:@"#00BFFF"].CGColor;
    self.questionLabel.layer.borderWidth = 2.0f;
    self.companyIcon.layer.cornerRadius = 2;
    self.companyIcon.layer.borderWidth = 2;
    self.companyIcon.layer.borderColor = [UIColor blackColor].CGColor;
    self.companyIcon.image = [UIImage imageNamed:@"burgerStationLogo"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)backButtonPressed:(id)sender {
    [self dismissViewControllerAnimated:self completion:nil];
}
- (IBAction)didPressSubmitButton:(id)sender {
    SendGrid *sendgrid = [SendGrid apiUser:@"MarcoRmz" apiKey:@"Mara19mr."];
    UIImage* photo = [UIImage imageNamed:@"cupon"];
    SendGridEmail *email = [[SendGridEmail alloc] init];
    email.to = @"roelcastanomoreno@gmail.com";
    email.from = @"hello@polls4change.com";
    email.subject = @"Polls4Change Cupon";
    [email attachImage:photo];
    email.inlinePhoto = true;
    email.html = @"<h1>Thank you for answering this poll, now enjoy this cupon!</h1><img src =\"cid:cupon.png\">";
    email.text = @"Thank you for answering this poll, now enjoy this cupon!";
    [email setReplyTo:@"no-reply@polls4change.com"];
    [sendgrid sendWithWeb:email];
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
