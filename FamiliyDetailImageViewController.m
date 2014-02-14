//
//  FamiliyDetailImageViewController.m
//  ProjectPETMILY
//
//  Created by 한상민(iPhone) on 2014. 2. 10..
//  Copyright (c) 2014년 한상민(개만정벌). All rights reserved.
//

#import "FamiliyDetailImageViewController.h"
#import "MyPetsInfo.h"
#import "MyPets.h"
#import <AFNetworking.h>
#import <UIImageView+AFNetworking.h>
#import "Reply.h"
#import "ReplyCell.h"
#import "DetailPictureViewController.h"



#import "UIViewController+MJPopupViewController.h"

#define POSTURL @"http://pettest.0164740237.cloulu.com/post"

@interface FamiliyDetailImageViewController ()<UITableViewDataSource, UITableViewDelegate>
{
    int postNo;

    NSString *postImg;

   NSMutableArray *replyData;
}

-(void)refresh:(NSNotification*)noti;
-(void)refreshReply:(NSNotification*)noti;
-(void)reloadTableView:(NSNotification*)noti;

@property (weak, nonatomic) IBOutlet UIImageView *postImageView;
@property (weak, nonatomic) IBOutlet UIImageView *detailImageView;
@property (weak, nonatomic) IBOutlet UIImageView *profileImage;
@property (weak, nonatomic) IBOutlet UILabel *userName;
@property (weak, nonatomic) IBOutlet UILabel *date;
@property (weak, nonatomic) IBOutlet UILabel *tagName;
@property (weak, nonatomic) IBOutlet UILabel *likeLabel;
@property (weak, nonatomic) IBOutlet UILabel *comment;
@property (weak, nonatomic) IBOutlet UILabel *familyName;

@property (strong,nonatomic)NSDictionary *detailDic;
@property (strong,nonatomic)NSDictionary *replyDic;

@property (weak, nonatomic) IBOutlet UITableView *tableView;


@end

@implementation FamiliyDetailImageViewController




-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    


}

- (void)viewDidLoad
{
    [super viewDidLoad];


    NSNotificationCenter *noti = [NSNotificationCenter defaultCenter];


    [noti addObserver:self selector:@selector(detailData:) name:@"sendPetArray"object:nil];
    [noti addObserver:self selector:@selector(refresh:) name:@"sendPetArray" object:nil];
    [noti addObserver:self selector:@selector(refreshReply:) name:@"sendPetArray" object:nil];
    [noti addObserver:self selector:@selector(detailData:) name:@"sendFeedArray" object:nil];
    [noti addObserver:self selector:@selector(refresh:) name:@"sendFeedArray" object:nil];



}
- (IBAction)backButton:(id)sender {

    [[NSNotificationCenter defaultCenter]postNotificationName:@"DETAIL_BACK" object:Nil];
    self.view.hidden = YES;


}

- (IBAction)detailMyPicture:(id)sender {

//    NSNotificationCenter *sendNoti = [NSNotificationCenter defaultCenter];


  //  NSDictionary *sendDic = [NSDictionary dictionaryWithObjectsAndKeys:postImg,@"sendImg", nil];

    //[sendNoti postNotificationName:@"sendDetailImage" object:self userInfo: sendDic];

        DetailPictureViewController *detailPictureView = [[DetailPictureViewController alloc]init];

        [self presentPopupViewController:detailPictureView animationType:@"fade in"];




}
-(void)setImageViewScale
{

}

-(void)refresh:(NSNotification*)noti
{

    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];


    NSNumber *postno =[NSNumber numberWithInt:postNo];
    NSDictionary *parameters = @{@"post_no":postno};

    [manager POST:POSTURL parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {


        NSString *userImg;
        NSString *userName;
        NSString *postTime;
        NSString *postText;
        NSInteger postLike;
        NSInteger postReply;
        NSString *postOpen;


        NSString *famiilyName;
        NSString *tagName;


            self.detailDic=[[NSMutableDictionary alloc]init];

            self.detailDic = [responseObject objectForKey:@"post"][0];

                //NSLog(@"detail :%@",responseObject);
        postText =[self.detailDic objectForKey:@"post_txt"];
        postTime = [self.detailDic objectForKey:@"post_time"];
        userImg = [self.detailDic objectForKey:@"user_img"];


        userName= [self.detailDic objectForKey:@"user_id"];
        famiilyName= [self.detailDic objectForKey:@"fam_name"];
        postImg = [self.detailDic objectForKey:@"post_img"];
        tagName = [self.detailDic objectForKey:@"tag_name"];
        postLike = [[self.detailDic objectForKey:@"post_like"]intValue];
        postOpen = [self.detailDic objectForKey:@"post_open"];


        postReply = [[self.detailDic objectForKey:@"post_reply"]intValue];

        CGFloat heightRatio;
        CGFloat newHeight = 0.0;
        CGFloat widthRatio ;
        CGFloat newWidth = 0.0;

        NSURL *postURL = [NSURL URLWithString:postImg];
        NSURL *userURL = [NSURL URLWithString:userImg];

        [self.postImageView setImageWithURL:postURL];

        NSData *temp = [NSData dataWithContentsOfURL:postURL];
        UIImage *tmpImg = [UIImage imageWithData:temp];


        if(tmpImg.size.height > tmpImg.size.width)
        {
             heightRatio = tmpImg.size.height/170;
            newHeight = tmpImg.size.height/heightRatio;

             widthRatio = tmpImg.size.width/100;
             newWidth = tmpImg.size.width/widthRatio;
        }

        else if(tmpImg.size.width>tmpImg.size.height)
        {
             heightRatio = tmpImg.size.height/170;
             newHeight = tmpImg.size.height/heightRatio;

             widthRatio = tmpImg.size.width/280;
             newWidth = tmpImg.size.width/widthRatio;
        }

        CGFloat ratio = tmpImg.size.height/tmpImg.size.width;
        CGFloat x = ((320-newWidth*(ratio*1.5)))/2;
        CGFloat y = ((210-newHeight*(ratio*1.5))/2);
        self.postImageView.frame = CGRectMake(x,y,newWidth*(ratio*1.5) , newHeight*(ratio*1.5));





        [self.profileImage setImageWithURL:userURL];
        self.userName.text = userName;
        self.date.text = postTime;
        self.tagName.text = tagName;
        self.likeLabel.text = [NSString stringWithFormat:@"Like:%ld",(long)postLike];
        self.comment.text = postText;
        self.familyName.text = famiilyName;


        [[NSNotificationCenter defaultCenter]postNotificationName:@"DETAIL_INFO_UPDATE" object:Nil];
        
        
    } failure:
     ^(AFHTTPRequestOperation *operation, NSError *error) {
         NSLog(@"Error:%@",error);
     }];
    
}

-(void)refreshReply:(NSNotification*)noti
{

    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];


    NSNumber *postno =[NSNumber numberWithInt:postNo];
    NSDictionary *parameters = @{@"post_no":postno};

    [manager POST:POSTURL parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {

        NSLog(@"reply :%@",responseObject);


        NSString *replyImg;
        NSString *replyTxt;
        NSDate *replyTime;
        NSString *replyName;
        Reply *reply;
        NSInteger postReply;

        postReply = [[self.detailDic objectForKey:@"post_reply"]intValue];



        NSLog(@"post reply %ld",(long)postReply);

        if (postReply == 0) {
            replyImg = nil;
            replyName = nil;
            replyTime = nil;
            replyTxt = nil;

        }

        

        for(int i =0; i<postReply; i++)
        {
            self.replyDic = [responseObject objectForKey:@"reply"][i];


            replyImg = [self.replyDic objectForKey:@"user_img"];
            replyName = [self.replyDic objectForKey:@"user_name"];
            replyTime = [self.replyDic objectForKey:@"re_time"];
            replyTxt = [self.replyDic objectForKey:@"re_txt"];

            reply = [Reply reply:replyImg userName:replyName reTime:replyTime reTxt:replyTxt];

            [replyData addObject:reply];
        }

        [[NSNotificationCenter defaultCenter]postNotificationName:@"REPLY_INFO_UPDATE" object:Nil];
        
        
    } failure:
     ^(AFHTTPRequestOperation *operation, NSError *error) {
         NSLog(@"Error:%@",error);
     }];
    
}
-(void)viewDidAppear:(BOOL)animated

{
    [super viewDidAppear:animated];

    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(reloadTableView:) name:@"REPLY_INFO_UPDATE" object:nil];

}
-(id)replyAt:(int)index
{
    return [replyData objectAtIndex:index];
}

-(NSInteger)replyCount
{
    return replyData.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    NSLog(@"replyCount %ld",[self replyCount]);
    return  [self replyCount];

}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ReplyCell *cell = [[UITableView alloc]dequeueReusableCellWithIdentifier:@"REPLY_CELL" forIndexPath:indexPath];

    Reply *reply = [[Reply alloc]init];
    reply = [self replyAt:(int)indexPath.row];

    [cell setReply:reply];
    return cell;


}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(void)detailData:(NSNotification*)noti
{


    //NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];


    NSDictionary *dic = [noti userInfo];
    postNo = [[dic objectForKey:@"postNo"]intValue];
    

}
-(void)reloadTableView:(NSNotification*)noti

{
    NSLog(@"reload");
    [self.tableView reloadData];
}
    
	// Do any additional setup after loading the view.

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
