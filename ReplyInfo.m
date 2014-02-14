//
//  ReplyInfo.m
//  ProjectPETMILY
//
//  Created by 한상민(iPhone) on 2014. 2. 11..
//  Copyright (c) 2014년 한상민(개만정벌). All rights reserved.
//

#import "ReplyInfo.h"
#import "Reply.h"
#import <AFNetworking.h>
#define URL @"http://pettest.0164740237.cloulu.com/post"


@implementation ReplyInfo


{
    NSMutableArray *replyData;
    NSDictionary *tempDic;

    int postNo;

}

static ReplyInfo *_instance = nil;

+(id)defaultMyReplyInfo
{
    if(nil == _instance)
        _instance = [[ReplyInfo alloc]init];

    

    return _instance;
}

-(int)myReplyCount
{
    return (int) replyData.count;
}


-(void)refresh
{

    replyData = [[NSMutableArray alloc]init];

    NSNotificationCenter *noti = [NSNotificationCenter defaultCenter];

    [noti addObserver:self selector:@selector(detailData:) name:@"sendPostNo"object:nil];


    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSNumber *postno = [NSNumber numberWithInt:postNo];
    NSDictionary *parameters = @{@"post_no":postno};

    [manager POST:URL parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {


       NSInteger allCount;

        NSDate *reTime;
        NSString *reText;

        NSString *userImg;
        NSString *userName;
        Reply *reply;







        for(int i = 0; i < allCount; i++)
        {
            self.myReplyDic=[[NSMutableDictionary alloc]init];

            self.myReplyDic = [responseObject objectForKey:@"reply"][i];

            userImg = [self.myReplyDic objectForKey:@"user_img"];
            reTime =[self.myReplyDic objectForKey:@"re_time"];
            reText = [self.myReplyDic objectForKey:@"re_txt"];
            userImg = [self.myReplyDic objectForKey:@"user_img"];
            userName= [self.myReplyDic objectForKey:@"user_name"];


            reply = [Reply reply:userImg userName:userName reTime:reTime reTxt:reText];


            [replyData addObject:reply];

        }



        [[NSNotificationCenter defaultCenter]postNotificationName:@"REPLY_INFO_UPDATE" object:Nil];
        
        
    } failure:
     ^(AFHTTPRequestOperation *operation, NSError *error) {
         NSLog(@"Error:%@",error);
     }];
    
}



-(void)detailData:(NSNotification*)noti
{
    NSDictionary *dic = [noti userInfo];
    postNo = [[dic objectForKey:@"postNo"]intValue];
    // self.postNumber = [dic objectForKey:@"post_no"];

}


-(id)myReplyAt:(int)index
{
    return [replyData objectAtIndex:index];
    
}




@end
