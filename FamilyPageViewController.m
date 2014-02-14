//
//  FamilyPageViewController.m
//  ProjectPETMILY
//
//  Created by Ethan Hansa on 2014. 1. 30..
//  Copyright (c) 2014년 한상민(개만정벌). All rights reserved.
//

#import "FamilyPageViewController.h"
#import "FeedInCell.h"
#import "FeedInfo.h"
#import "FamilyPetInCell.h"
#import "FamilyPetInfo.h"
#import "UIViewController+MJPopupViewController.h"


#import "MyMemberInfo.h"
#import "MemberMiddleCell.h"
#import "MyPetsCell.h"
#import "MyPetsInfo.h"
#import "Member.h"

#import <REFrostedViewController.h>
#import <AFNetworking.h>
#import <UIImageView+AFNetworking.h>

#import "WriteProfileViewController.h"

#define MYHOME_URL @"http://pettest.0164740237.cloulu.com/myhome"


#import "ProfileViewController.h"

@interface FamilyPageViewController () <UICollectionViewDataSource, UICollectionViewDelegate,UIScrollViewDelegate,UICollectionViewDelegateFlowLayout>
{
    BOOL popFlag;


    NSString *fam_img;
    NSString *fam_name;

    NSString *famID;
}

@property (nonatomic) BOOL isLogin; // login 식별자
@property (weak, nonatomic) IBOutlet UIImageView *smarBackground;


@property (weak, nonatomic) IBOutlet UIImageView *bigBackground;
-(void)familyPetUpdate:(NSNotification*)notification;
-(void)memberUpdate:(NSNotification*)notification;
-(void)updateFAM:(NSNotification*)notification;
-(void)setFamID:(NSNotification*)noti;

-(void)reloadMyPage:(NSNotification*)noti;



@property (strong,nonatomic)MyPetsInfo * myPetInfo;
@property (strong,nonatomic) FamilyPetInfo *familyPetInfo;
@property (strong,nonatomic) MyMemberInfo *memberInfo;
@property (strong,nonatomic)MyPets *myPets;
@property (weak, nonatomic) IBOutlet UILabel *familyNameLabel;

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UICollectionView *petCollection;
@property (weak, nonatomic) IBOutlet UICollectionView *memberCollection;
@property (weak, nonatomic) IBOutlet UICollectionView *feedCollection;


@end



@implementation FamilyPageViewController

@synthesize familyFlag;


-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{

    MyPets *myPets = [[MyPetsInfo defaultMyPetsInfo]mypetsAt:(int)indexPath.row];

    if(collectionView == self.feedCollection)
    {

        [self.myPetInfo sendPetArray:myPets];
    }
    [self detailNoti];



}

-(void)searchNoti
{

    [[NSNotificationCenter defaultCenter]postNotificationName:@"SEARCH_SHOW" object:Nil];

}

-(void)detailNoti
{
    [[NSNotificationCenter defaultCenter]postNotificationName:@"DETAIL_SHOW" object:Nil];

}

-(IBAction)searchClick:(id)sender {
    [self searchNoti];
}


-(void)popupProfileView
{
    ProfileViewController *profile = [[ProfileViewController alloc]init];
    [self presentPopupViewController:profile animationType:@"fade in"];
}

- (IBAction)profileClick:(id)sender {
    [self popupProfileView];
}


-(void)popupAddProfileView
{
    WriteProfileViewController *profile= [[WriteProfileViewController alloc]init];
    [self presentPopupViewController:profile animationType:@"fade in"];

}

//famid settings
-(void)setFamID:(NSNotification*)noti
{

    NSDictionary *dic = [noti userInfo];
    famID = [dic objectForKey:@"famID"];

}


-(void)refresh
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];

    NSDictionary *parameters = @{@"fam_id":famID};

    NSLog(@"%@",famID);

    [manager POST:MYHOME_URL parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {


        fam_name = [responseObject objectForKey:@"fam_name"];
        fam_img = [responseObject objectForKey:@"fam_img"];



        [[NSNotificationCenter defaultCenter]postNotificationName:@"FAM_UPDATE" object:Nil];


    } failure:
     ^(AFHTTPRequestOperation *operation, NSError *error) {
         NSLog(@"Error:%@",error);
     }];
    
    
}

-(void)updateFAM:(NSNotification*)notification
{
    self.familyNameLabel.text = fam_name;
    NSURL *url =[NSURL URLWithString:fam_img];
    [self.bigBackground setImageWithURL:url];
    //[self.smarBackground setImageWithURL:url];


}
- (IBAction)addProfile:(id)sender {

    [self popupAddProfileView];
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    
    if(collectionView == self.petCollection)
    {


        FamilyPetInfo *familyInfo = [FamilyPetInfo defaultFamilyPetInfo];
        return [familyInfo petCount];

    }
    
    else if(collectionView == self.memberCollection)
    {
        MyMemberInfo *mymemberInfo = [MyMemberInfo defaultMyMemberInfo];
        return [mymemberInfo myMemberCount];

    }

    else
    {

        MyPetsInfo *myPetInfo = [MyPetsInfo defaultMyPetsInfo];

        return [myPetInfo mypetsCount];
    }

}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}



-(UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{

    if(collectionView == self.petCollection)
    {
        FamilyPetInCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"PET_CELL" forIndexPath:indexPath];
        FamilyPet *pet = [[FamilyPetInfo defaultFamilyPetInfo]petAt:(int)indexPath.row];
        cell.backgroundColor = [UIColor clearColor];

        [cell setPet:pet];
        return cell;
        
    }
   
    else if(collectionView == self.memberCollection)
    {
        MemberMiddleCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"MEMBER_CELL" forIndexPath:indexPath];

        myMember *member = [[MyMemberInfo defaultMyMemberInfo]MemberAt:(int)indexPath.row];
        [cell setMyMember:member];
        cell.backgroundColor = [UIColor clearColor];

        
        return cell;
    }

    else
    {
                
        MyPetsCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"FEED_CELL" forIndexPath:indexPath];
           MyPets *myPet = [[MyPetsInfo defaultMyPetsInfo]mypetsAt:(int)indexPath.row];

//        self.myPets = [[MyPetsInfo defaultMyPetsInfo]mypetsAt:(int)indexPath.row];


        [cell setMyPet:myPet];

        
        return cell;
    }


}
-(void)familyPetUpdate:(NSNotification*)notification
{
    [self.petCollection reloadData];
}

-(void)petinfoUpdate:(NSNotification *)notification
{
    [self.feedCollection reloadData];
}

-(void)memberUpdate:(NSNotification*)notification
{
    [self.memberCollection reloadData];

}


-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];

    self.scrollView.contentSize = CGSizeMake(320, 1500);


    famID = @"aaa";
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(setFamID:) name:@"SEND_SEARCH_FAM_ID" object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(reloadMyPage:) name:@"SHOW_MYPAGE" object:nil];
    
    MyPetsInfo *mypetInfo =[MyPetsInfo defaultMyPetsInfo];
    [mypetInfo refresh];

    FamilyPetInfo *familyInfo = [FamilyPetInfo defaultFamilyPetInfo];

    [familyInfo refresh];

    [self refresh];

    MyMemberInfo *myMemberInfo = [MyMemberInfo defaultMyMemberInfo];
    [myMemberInfo refresh];


    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(petinfoUpdate:) name:@"MYPET_INFO_UPDATE" object:nil];

    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(familyPetUpdate:) name:@"FAMILYPET_INFO_UPDATE" object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(memberUpdate:) name:@"MYMEMBER_INFO_UPDATE" object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(updateFAM:) name:@"FAM_UPDATE" object:nil];
    [self.scrollView addSubview:self.feedCollection];

    self.petCollection.backgroundColor = [UIColor clearColor];
    self.memberCollection.backgroundColor = [UIColor clearColor];
}


-(void)reloadMyPage:(NSNotification*)noti
{

    famID = @"aaa";
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(setFamID:) name:@"SEND_SEARCH_FAM_ID" object:nil];


    MyPetsInfo *mypetInfo =[MyPetsInfo defaultMyPetsInfo];
    [mypetInfo refresh];

    FamilyPetInfo *familyInfo = [FamilyPetInfo defaultFamilyPetInfo];

    [familyInfo refresh];

    [self refresh];

    MyMemberInfo *myMemberInfo = [MyMemberInfo defaultMyMemberInfo];
    [myMemberInfo refresh];

}


-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];


   /* famID = @"aaa";
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(setFamID:) name:@"SEND_SEARCH_FAM_ID" object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(reloadMyPage:) name:@"SHOW_MYPAGE" object:nil];

    MyPetsInfo *mypetInfo =[MyPetsInfo defaultMyPetsInfo];
    [mypetInfo refresh];

    FamilyPetInfo *familyInfo = [FamilyPetInfo defaultFamilyPetInfo];

    [familyInfo refresh];

    [self refresh];

    MyMemberInfo *myMemberInfo = [MyMemberInfo defaultMyMemberInfo];
    [myMemberInfo refresh];



    if(familyFlag ==YES)

    {
        [self popupProfileView];
    }
*/
}
- (void)viewDidLoad
{
    [super viewDidLoad];


    self.feedCollection.scrollEnabled=NO;


    self.feedCollection.frame = CGRectMake(0, 260, 320, 500);

    self.myPetInfo = [MyPetsInfo defaultMyPetsInfo];

    [self.feedCollection reloadData];

	// Do any additional setup after loading the view.


}

- (IBAction)burgerClick:(id)sender {
    [self.frostedViewController presentMenuViewController];

}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
