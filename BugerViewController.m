//
//  BugerViewController.m
//  ProjectPETMILY
//
//  Created by Ethan Hansa on 2014. 2. 2..
//  Copyright (c) 2014년 한상민(개만정벌). All rights reserved.
//

#import "BugerViewController.h"
#import "PetCMainViewController.h"
#import "NavigationViewController.h"
#import "PetCMainViewController.h"
#import "FamilyPageViewController.h"
#import "ProfileViewController.h"


#import <UIView+REFrostedViewController.h>
#import <REFrostedViewController.h>
#import "LoginViewController.h"




@interface BugerViewController ()

{
    BOOL mypageFlag;
    BOOL notiFlag;
    BOOL familyFlag;
    BOOL burgerFlag;
}

@end






@implementation BugerViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    burgerFlag = YES;
    
    self.tableView.separatorColor = [UIColor colorWithRed:150/255.0f green:161/255.0f blue:177/255.0f alpha:1.0f];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.opaque = NO;
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.tableHeaderView = ({
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 220.0f)];
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 40, 100, 100)];
        imageView.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
        imageView.image = [UIImage imageNamed:@"1.jpg"];
        imageView.layer.masksToBounds = YES;
        imageView.layer.cornerRadius = 50.0;
        imageView.layer.borderColor = [UIColor whiteColor].CGColor;
        imageView.layer.borderWidth = 3.0f;
        imageView.layer.rasterizationScale = [UIScreen mainScreen].scale;
        imageView.layer.shouldRasterize = YES;
        imageView.clipsToBounds = YES;
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 150, 0, 24)];
        label.text = @"Sangmin Hansa";
        label.font = [UIFont fontWithName:@"HelveticaNeue" size:21];
        label.backgroundColor = [UIColor clearColor];
        label.textColor = [UIColor colorWithRed:62/255.0f green:68/255.0f blue:75/255.0f alpha:1.0f];
        [label sizeToFit];
        label.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
        
        [view addSubview:imageView];
        [view addSubview:label];
        view;
    });
}

#pragma mark -
#pragma mark UITableView Delegate

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    cell.backgroundColor = [UIColor clearColor];
    cell.textLabel.textColor = [UIColor colorWithRed:62/255.0f green:68/255.0f blue:75/255.0f alpha:1.0f];
    cell.textLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:17];
}

/*- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)sectionIndex
{
/*    if (sectionIndex == 0)
         return nil;*/
    
    /*UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 34)];
    view.backgroundColor = [UIColor colorWithRed:167/255.0f green:167/255.0f blue:167/255.0f alpha:0.6f];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 8, 0, 0)];
    label.text = @"추가 메뉴";
    label.font = [UIFont systemFontOfSize:15];
    label.textColor = [UIColor whiteColor];
    label.backgroundColor = [UIColor clearColor];
    [label sizeToFit];
    [view addSubview:label];
    

}*/

/*- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)sectionIndex
{
    if (sectionIndex == 0)
        return 0;
    
    return 34;
}*/

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NavigationViewController *navigationController = [self.storyboard instantiateViewControllerWithIdentifier:@"contentController"];
    PetCMainViewController *homeViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"homeController"];

    FamilyPageViewController *familyViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"familyPageController"];

    ProfileViewController *profileViewController = [[ProfileViewController alloc]initWithNibName:@"ProfileViewController" bundle:nil];

    
    homeViewController.receiveData=YES;
    homeViewController.notiFlag=YES;
    homeViewController.burgerFlag=YES;
    
    
    switch (indexPath.row){
        case 0:
            mypageFlag =YES;
            notiFlag = YES;            
            familyFlag = YES;
            
            [self sendFamilyFlag:homeViewController];
            navigationController.viewControllers = @[homeViewController];
            break;
        case 1:
            
            mypageFlag = NO;
            notiFlag = YES;

            navigationController.viewControllers = @[familyViewController];
            
           
                        [self sendFamilyFlag:familyViewController];
            break;
                                                     
        case 2:
            notiFlag=NO;
            mypageFlag=YES;
            
            navigationController.viewControllers =@[homeViewController];
            
                        [self sendFlag:homeViewController];
            break;


    }
    

    
    self.frostedViewController.contentViewController = navigationController;
    [self.frostedViewController hideMenuViewController];
}

-(void)sendFamilyFlag:(FamilyPageViewController*)familyViewController
{
    familyViewController.familyFlag = familyFlag;
}
-(void)sendFlag:(PetCMainViewController*)homeViewController
{
    
    homeViewController.receiveData=mypageFlag;
    homeViewController.notiFlag=notiFlag;
}

#pragma mark -
#pragma mark UITableView Datasource

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 54;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)sectionIndex
{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    if (indexPath.section == 0) {
        NSArray *titles = @[@"PetmilyMain", @"내 페이지", @"알림"];
        cell.textLabel.text = titles[indexPath.row];}
  /*  } else {
        NSArray *titles = @[@"설정", @"로그인", @"3번 메뉴"];
        cell.textLabel.text = titles[indexPath.row];
    }*/
    
    return cell;
}

@end
