//
//  PetCMainViewController.m
//  ProjectPETMILY
//
//  Created by 한상민(iPhone) on 2014. 1. 24..
//  Copyright (c) 2014년 한상민(개만정벌). All rights reserved.
//

#import "PetCMainViewController.h"
#import "FeedInfo.h"
#import "FeedInCell.h"
#import "HonorInfo.h"
#import "HonorCell.h"
#import "NotificationViewController.h"
#import "UIViewController+MJPopupViewController.h"
#import "FeedDetailView.h"
#import "ProfileViewController.h"
#import <AFNetworking.h>
#import <UIImageView+AFNetworking.h>

#import <REFrostedViewController.h>
#import <UIImage+BlurredFrame.h>

#define CELL_ID @"FEED_CELL"


@interface PetCMainViewController ()
{

    UISegmentedControl *middleSegment;

    NSDictionary *dataDic;

    BOOL mypageFlag;
    CGSize cellHeight;
    BOOL notificationFlag;

}

-(void)showMyPage:(NSNotification*)noti;
-(void)showSearchPage:(NSNotification*)noti;
-(void)showDetailPage:(NSNotification*)noti;


@property (weak, nonatomic) IBOutlet UIView *detailContainer;

@property (weak, nonatomic) IBOutlet UIImageView *leftImageBack;
@property (weak, nonatomic) IBOutlet UIImageView *rightimageBack;

@property (nonatomic, strong) NSMutableIndexSet *optionIndices;
@property (weak, nonatomic) IBOutlet UIView *friendContainerView;

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong,nonatomic) FeedInfo *feedInfo;


@property (weak, nonatomic) IBOutlet UIView *startVoteView;

@property (weak, nonatomic) IBOutlet UICollectionView *mainCollection;

@property (weak, nonatomic) IBOutlet UIImageView *leftPetImage;

@property (weak, nonatomic) IBOutlet UIView *mypageContainer;

@property (weak, nonatomic) IBOutlet UIView *versusView;

@property (weak, nonatomic) IBOutlet UICollectionView *feedCollectionView;
@property (weak, nonatomic) IBOutlet UIImageView *rightPetImage;
@property (weak, nonatomic) IBOutlet UIView *notificationCollectionView;
@property (weak, nonatomic) IBOutlet UIView *mainView;

@end

@implementation PetCMainViewController

@synthesize receiveData;
@synthesize notiFlag;
@synthesize burgerFlag;
@synthesize searchFlag;
@synthesize familyFlag;

/*"petstar": [
            {
                "fam_id": "aaa",
                "post_img": "http://pettest.0164740237.cloulu.com/uploads/postimage/http://petimage.0164740237.cloulu.com/uploads/df/Tulips.jpg"
            },
            {
                "fam_id": "ggg",
                "post_img": "http://pettest.0164740237.cloulu.com/uploads/postimage/http://petimage.0164740237.cloulu.com/uploads/df/Tulips.jpg"
            }
            ], */



- (IBAction)notificationClick:(id)sender {

    self.notificationCollectionView.hidden = NO;


}

- (IBAction)petsCupClick:(id)sender {

    [self.view bringSubviewToFront:self.mainView];

    /*    self.mypageContainer.hidden=YES;
    self.friendContainerView.hidden=YES;
    self.notificationCollectionView.hidden=YES;
    self.detailContainer.hidden = YES;
    self.searchContainer.hidden = YES;*/
}


- (IBAction)myPageClick:(id)sender {

    [self.view bringSubviewToFront:self.mypageContainer];

    /*self.mypageContainer.hidden=NO;
    self.friendContainerView.hidden=YES;
    self.notificationCollectionView.hidden=YES;
    self.detailContainer.hidden=YES;
    self.searchContainer.hidden =YES;*/
       

}
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(5, 0, 5, 5);
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    FeedItem *feedItem = [[FeedInfo defaultFeedInfo]feedAt:(int)indexPath.row];
    [self.view bringSubviewToFront:self.detailContainer];



        [self.feedInfo sendFeedArray:feedItem];


}

- (IBAction)friendPageClick:(id)sender {
//    self.friendContainerView.hidden = NO;
 //   self.notificationCollectionView.hidden=YES;
    [self.view bringSubviewToFront:self.friendContainerView];


}


/*- (void)scrollViewDidScroll:(UIScrollView *)scrollView_
{
    CGFloat actualPosition = self.scrollView.contentOffset.y;
    CGFloat contentHeight = self.scrollView.contentSize.height - (someArbitraryNumber);

    if (actualPosition >= contentHeight) {
        [self.newsFeedData_ addObjectsFromArray:self.newsFeedData_];
        [self.tableView reloadData];
    }
} infinite scroll code */



-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{

    return 1;

}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
   
    return [self.feedInfo feedCount];
}


-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{

    FeedInCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CELL_ID forIndexPath:indexPath];

    FeedItem *feedItem = [[FeedInfo defaultFeedInfo]feedAt:(int)indexPath.row];


    [cell setFeed:feedItem index:(int)indexPath.row];


    //cellHeight =  [cell returnCellSize];

    return  cell;

}
/*-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
       // 2
//    NSArray *height = @[@200,@215,@180,@185,@230];
    CGSize retval = CGSizeMake(120,270);

    return retval;
}*/

-(void)popupProfileView
{
    ProfileViewController *profile = [[ProfileViewController alloc]init];
    [self presentPopupViewController:profile animationType:@"fade in"];
}


- (void)viewDidLoad
{
    [super viewDidLoad];

    self.feedCollectionView.bounces = YES;
    self.feedCollectionView.scrollEnabled=NO;


    self.optionIndices = [NSMutableIndexSet indexSetWithIndex:1];


//    CGRect leftframe = CGRectMake(0, 0, leftImage.size.width, leftImage.size.height);



  //  CGRect rightFrame= CGRectMake(0, 0, rightImage.size.width, rightImage.size.height);
   // rightImage = [rightImage applyLightEffectAtFrame:rightFrame];

    //self.rightimageBack.image = rightImage;


    [self.mainCollection reloadData];


	// Do any additional setup after loading the view.
}

-(void)showMyPage:(NSNotification*)noti
{

    
    NSLog(@"shomypage");
    [self.view bringSubviewToFront:self.mypageContainer];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(familyPetUpdate:) name:@"SHOW_MYPAGE" object:nil];



}


-(void)showSearchPage:(NSNotification*)noti
{
    NSLog(@"searchshow");
    [self.view bringSubviewToFront:self.searchContainer];

}


-(void)showDetailPage:(NSNotification*)noti
{
    [self.view bringSubviewToFront:self.detailContainer];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];





 /*   if(burgerFlag==NO)
    {
//        self.mypageContainer.hidden = YES;
       // self.notiContainer.hidden = YES;
        
    }
    
    else if(burgerFlag ==YES)
        
    {
        self.mypageContainer.hidden = receiveData;
        
       // self.notiContainer.hidden = notiFlag;
    }


    if(searchFlag == YES)
    {
        self.mypageContainer.hidden = NO;
    }

//    NSLog(@"family flag = %@",familyFlag);

    if(familyFlag == YES)
    {
        [self popupProfileView];
    }
*/
}

-(void)refresh
{


    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];


/*    [manager POST:MYHOME_URL parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {

        fam_name = [responseObject objectForKey:@"fam_name"];
        fam_img = [responseObject objectForKey:@"fam_img"];



        [[NSNotificationCenter defaultCenter]postNotificationName:@"FAM_UPDATE" object:Nil];


    } failure:
     ^(AFHTTPRequestOperation *operation, NSError *error) {
         NSLog(@"Error:%@",error);
     }];
    */
    
}
-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    self.scrollView.contentSize = CGSizeMake(320, 1500);

        self.feedInfo = [FeedInfo defaultFeedInfo];
    [self.feedInfo refresh];

    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(feedInfoUpdate:) name:@"FEED_INFO_UPDATE" object:nil];

    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(showSearchPage:) name:@"SEARCH_SHOW" object:nil];

    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(showDetailPage:) name:@"DETAIL_SHOW" object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(showMyPage:) name:@"GO_MYPAGE" object:nil];



}


-(void)feedInfoUpdate:(NSNotification *)notification
{
    [self.feedCollectionView reloadData];
}




- (IBAction)burgerShowClick:(id)sender {

    
    [self.frostedViewController presentMenuViewController];

    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.3];


}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
