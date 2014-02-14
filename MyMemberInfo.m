//
//  MyMemberInfo.m
//  ProjectPETMILY
//
//  Created by 한상민(iPhone) on 2014. 2. 4..
//  Copyright (c) 2014년 한상민(개만정벌). All rights reserved.
//

#import "MyMemberInfo.h"
#import <AFNetworking.h>

#define MINI_MEMBER_URL @"http://pettest.0164740237.cloulu.com/myhome"

@implementation MyMemberInfo


{
    NSMutableArray *tempArray;
    NSMutableArray *myMemberData;
    NSString *famID;
}
static MyMemberInfo *_instance = nil;




+(id)defaultMyMemberInfo
{
    if(nil == _instance)
        _instance = [[MyMemberInfo alloc]init];



    return _instance;
}



-(void)refresh
{

    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];

    NSDictionary *parameters = @{@"fam_id":famID};

    [manager POST:MINI_MEMBER_URL parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {

        NSInteger allCount;

        myMember *mymyMember = [[myMember alloc]init];


        NSString *userImg;

        myMemberData = [[NSMutableArray alloc]init];

        tempArray =[responseObject objectForKey:@"user_img"];

        allCount = tempArray.count-1;
                NSLog(@"temp: %@",tempArray);
        NSLog(@"%ld",allCount);


        for(int i = 0; i < allCount; i++)
        {
            self.myMemberArray=[[NSMutableArray alloc]init];

            self.myMemberArray = [responseObject objectForKey:@"user_img"];



            userImg = [self.myMemberArray objectAtIndex:1];
            mymyMember = [myMember myMember:userImg];


            [myMemberData addObject:mymyMember];
            NSLog(@"mymember data : %@",[myMemberData objectAtIndex:i]);

        }



        [[NSNotificationCenter defaultCenter]postNotificationName:@"MYMEMBER_INFO_UPDATE" object:Nil];
        
        
    } failure:
     ^(AFHTTPRequestOperation *operation, NSError *error) {
         NSLog(@"Error:%@",error);
     }];
    
    
}

-(void)setFamID:(NSNotification*)noti
{

    NSDictionary *dic = [noti userInfo];
    famID = [dic objectForKey:@"famID"];


    
}



-(id)init
{

    self = [super init];
    famID = @"aaa";
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(setFamID:) name:@"SEND_SEARCH_FAM_ID" object:nil];


    return self;

}

-(int)myMemberCount
{
    return (int)[myMemberData count];
}


-(id)MemberAt:(int)index
{
   return [myMemberData objectAtIndex:index];
}
@end

