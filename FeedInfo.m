//
//  FeedInfo.m
//  ProjectPETMILY
//
//  Created by 한상민(iPhone) on 2014. 1. 29..
//  Copyright (c) 2014년 한상민(개만정벌). All rights reserved.
//

#import "FeedInfo.h"
#import "FeedItem.h"
#import <AFNetworking.h>
#define TOTAL_URL @"http://pettest.0164740237.cloulu.com/totalhome"


@implementation FeedInfo

{
    NSMutableArray *feedData;
    NSDictionary *tempDic;

}

static FeedInfo *_instance = nil;

+(id)defaultFeedInfo
{
    if(nil == _instance)
        _instance = [[FeedInfo alloc]init];
    return _instance;
}

-(int)feedCount
{
    return (int) feedData.count;
}


-(void)refresh
{


    feedData = [[NSMutableArray alloc]init];


    //[feedData addObject:item];

    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];

    //NSDictionary *parameters = @{@"fam_id":@"aaa"};

    [manager POST:TOTAL_URL parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {



        NSInteger allCount;
        NSString *postImg;
        NSDate *postTime;
        NSString *postText;
        NSInteger postLike;
        NSInteger postReply;
        NSString *postOpen;
        NSString *userImg;
        NSString *userName;
        NSString *famiilyName;
        NSString *profileImg;
        NSString *tagName;
        NSInteger postNo;
        FeedItem *item;

        NSInteger cuteCount;
         NSInteger funCount;
         NSInteger loveCount;
         NSInteger withCount;

        tempDic = [responseObject objectForKey:@"totalhome"];

        allCount= tempDic.count-1;




//        myPetsData = [[NSMutableArray alloc]init];



        for(int i = 0; i < allCount; i++)
        {
            self.totalDic=[[NSMutableDictionary alloc]init];

            self.totalDic = [responseObject objectForKey:@"totalhome"][i];

            postImg = [self.totalDic objectForKey:@"post_img"];
            postTime =[self.totalDic objectForKey:@"post_time"];
            postText = [self.totalDic objectForKey:@"post_txt"];
                postLike = 0;

            postLike = [[self.totalDic objectForKey:@"post_like"]intValue];

                postReply = 0;


            postReply = [[self.totalDic objectForKey:@"post_reply"]intValue];
            postOpen = [self.totalDic objectForKey:@"post_open"];
            userImg = [self.totalDic objectForKey:@"user_img"];
            userName= [self.totalDic objectForKey:@"user_name"];
            famiilyName = [self.totalDic objectForKey:@"fam_name"];
            profileImg  =[self.totalDic objectForKey:@"user_img"];
            tagName =[self.totalDic objectForKey:@"tag_name"];
            postNo = [[self.totalDic objectForKey:@"post_no"]intValue];


            item = [FeedItem feed:postImg tagName:tagName profileImage:profileImg userName:userName familyName:famiilyName postOpen:postOpen postNo:postNo postReply:postReply postTime:postTime postText:postText postLike:postLike];


            [feedData addObject:item];

        }



        [[NSNotificationCenter defaultCenter]postNotificationName:@"FEED_INFO_UPDATE" object:Nil];
        
        
    } failure:
     ^(AFHTTPRequestOperation *operation, NSError *error) {
         NSLog(@"Error:%@",error);
     }];
    
}

-(void)sendFeedArray:(FeedItem *)feedItem
{
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    NSNumber *postNo = [NSNumber numberWithInteger:feedItem.postNo];

    NSDictionary *sendDic = [NSDictionary dictionaryWithObjectsAndKeys:postNo,@"postNo", nil];

    [nc postNotificationName:@"sendFeedArray" object:self userInfo: sendDic];
    
}

-(id)feedAt:(int)index
{
    return [feedData objectAtIndex:index];

}



@end
