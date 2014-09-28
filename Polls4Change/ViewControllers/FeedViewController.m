//
//  FeedViewController.m
//  Polls4Change
//
//  Created by Roel Castano on 9/27/14.
//  Copyright (c) 2014 P4C. All rights reserved.
//

#import "FeedViewController.h"
#import "PollExpandableCellTableViewCell.h"
#import <REFrostedViewController/REFrostedViewController.h>

@interface FeedViewController () <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *pollsTableView;
@property (strong, nonatomic)NSArray* companyNames;
@property (strong, nonatomic)NSArray* charityNames;
@property (strong, nonatomic)NSArray* pollTitles;
@property (strong, nonatomic)NSArray* pollQuestionNumbers;
@property (strong, nonatomic)NSArray* pollDescriptions;
@property (strong, nonatomic)NSArray* pollRewards;
@end

@implementation FeedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.pollsTableView setDelegate:self];
    [self.pollsTableView setDataSource:self];
    // Do any additional setup after loading the view.
    self.companyNames = [NSArray arrayWithObjects:@"Burger Station", @"Tacos Don Juan", @"Rocket Pizza", @"Takushi",nil];
    
    self.charityNames = [NSArray arrayWithObjects:@"Becalos", @"EDUCA", @"LUCA", @"Amigos de la Tierra", @"Unidos",nil];
    
    self.pollTitles = [NSArray arrayWithObjects:@"Nuevas Hamburguesas", @"Tacos Favoritos", @"Nuevo Menu", @"Combos",nil];
    
    self.pollQuestionNumbers = [NSArray arrayWithObjects:@"5", @"4", @"10", @"5",nil];
    
    self.pollDescriptions = [NSArray arrayWithObjects:@"Queremos conocer tu opinion sobre nuestras nuevas hamburguesas para ver cuales se quedan y cuales se van.", @"Queremos saber cuales son tus tacos favoritos.", @"Queremos saber que te interesa que pongamos en nuestro nuevo menu.", @"Queremos saber cuales son tus combos favoritos.",nil];
    
    self.pollRewards = [NSArray arrayWithObjects:@"Refresco gratis en la compra de una hamburguesa.", @"1 taco gratis en la compra de 2.", @"Pizza mediana a solo $80", @"Combos a solo $80 de Lunes a Jueves.",nil];
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

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"pollCell";
    
    PollExpandableCellTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (!cell) {
        cell = [[PollExpandableCellTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    }
    
    
    cell.pollTitleLabel.text = [self.pollTitles objectAtIndex:indexPath.row];
    cell.pollQuestionNumberLabel.text = [self.pollQuestionNumbers objectAtIndex:indexPath.row];
    cell.pollDescriptionLabel.text = [self.pollDescriptions objectAtIndex:indexPath.row];
    cell.pollRewardsLabel.text = [self.pollRewards objectAtIndex:indexPath.row];
    cell.companyNameImageView.image = [UIImage imageNamed:@"rocketpizza"];
    cell.charityNameImageView.image = [UIImage imageNamed:@"rocketpizza"];
    cell.expandedContentView.hidden = YES;
    return cell;

}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    PollExpandableCellTableViewCell* cell = [tableView cellForRowAtIndexPath:indexPath];
    
    if (!cell.expandedContentView.hidden) {
        cell.expandIconImageView.image = [UIImage imageNamed:@"collapse"];
    }
    else {
        cell.expandIconImageView.image = [UIImage imageNamed:@"expand"];
    }
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
