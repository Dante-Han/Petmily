//
//  MyPetsInfo.m
//  ProjectPETMILY
//
//  Created by 한상민(iPhone) on 2014. 2. 7..
//  Copyright (c) 2014년 한상민(개만정벌). All rights reserved.
//

#import "MyPetsInfo.h"
#import "MyPets.h"
#import <AFNetworking.h>

@implementation MyPetsInfo
{
    NSMutableArray *myPetsData;
    NSMutableDictionary *tempDic;

    NSString *famID;

}//팩토리 메소드


static MyPetsInfo *_instance = nil;

+(id)defaultMyPetsInfo
{
    if(nil == _instance)
        _instance = [[MyPetsInfo alloc]init];



    return  _instance;
}


-(void)setFamID:(NSNotification*)noti
{

       NSDictionary *dic = [noti userInfo];
        famID = [dic objectForKey:@"famID"];
        
        

}
-(int)mypetsCount
{
    return (int)myPetsData.count;
}

-(void)refresh
{


    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];


    NSDictionary *parameters = @{@"fam_id":famID};


    [manager POST:MYHOME_URL parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {

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

        MyPets *myPets;

        /*   NSInteger cuteCount;
         NSInteger funCount;
         NSInteger loveCount;
         NSInteger withCount;*/



/*        "result": "success",
        "fam_name": "에이가족", // 가족닉네임
        "fam_img": "aaafam.jpg", // 가족배경이미지
        "user_img": [   // 가족멤버프로필사진, 현재 멤버가 3명인상태
                     "aaa.jpg",
                     "ccc.jpg",
                     "ddd.jpg"
                     ],
       
        "all_cnt": 21,  // 전체 게시글수
        "tag_cnt": [    // 현재는 fun태그에 달린 게시글이 없어서 아예 안나옴 이때는 0 처리해줘야함
                    {
                        "tag_name": "cute",
                        "cnt": 3    // cute 태그 게시글 수
                    },
                    {
                        "tag_name": "love",
                        "cnt": 2    // love  태그 게시글 수
                    },
                    {
                        "tag_name": "null",
                        "cnt": 1    // 이건 클라이언트에서 안씀! 태그 안달은 게시글 수
                    },
                    {
                        "tag_name": "with",
                        "cnt": 15    // with  태그 게시글 수
                    }
                    ],
*/


        tempDic =[responseObject objectForKey:@"myhome"];

        allCount = tempDic.count-1;



        myPetsData = [[NSMutableArray alloc]init];



        for(int i = 0; i < allCount; i++)
        {
            self.myfamilyDic=[[NSMutableDictionary alloc]init];

            self.myfamilyDic = [responseObject objectForKey:@"myhome"][i];

            postImg = [self.myfamilyDic objectForKey:@"post_img"];
            postTime =[self.myfamilyDic objectForKey:@"post_time"];
            postText = [self.myfamilyDic objectForKey:@"post_txt"];
            if([[self.myfamilyDic objectForKey:@"post_like"] isEqual:@"<null>"])
            {
                postLike = 0;
            }
                postLike = [[self.myfamilyDic objectForKey:@"post_like"]intValue];

            if([[self.myfamilyDic objectForKey:@"post_reply"] isEqual:@"<null>"])
            {
                postReply = 0;
            }

            postReply = [[self.myfamilyDic objectForKey:@"post_reply"]intValue];
            postOpen = [self.myfamilyDic objectForKey:@"post_open"];
            userImg = [self.myfamilyDic objectForKey:@"user_img"];
            userName= [self.myfamilyDic objectForKey:@"user_name"];
            famiilyName = [self.myfamilyDic objectForKey:@"fam_name"];
            profileImg  =[self.myfamilyDic objectForKey:@"user_img"];
            tagName =[self.myfamilyDic objectForKey:@"tag_name"];
            postNo = [[self.myfamilyDic objectForKey:@"post_no"]intValue];


            myPets = [MyPets myPet:postImg tagName:tagName profileImage:profileImg userName:userName familyName:famiilyName postOpen:postOpen postNo:postNo postReply:postReply postTime:postTime postText:postText postLike:postLike];

            [myPetsData addObject:myPets];

        }



        [[NSNotificationCenter defaultCenter]postNotificationName:@"MYPET_INFO_UPDATE" object:Nil];


    } failure:
     ^(AFHTTPRequestOperation *operation, NSError *error) {
         NSLog(@"Error:%@",error);
     }];
    

  }

-(void)sendPetArray:(MyPets *)myPet
{
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    NSNumber *postNo = [NSNumber numberWithInteger:myPet.postNo];

    NSDictionary *sendDic = [NSDictionary dictionaryWithObjectsAndKeys:postNo,@"postNo", nil];

    [nc postNotificationName:@"sendPetArray" object:self userInfo: sendDic];

}

-(id)init
{

    self = [super init];
        famID = @"aaa";
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(setFamID:) name:@"SEND_SEARCH_FAM_ID" object:nil];


            return self;

}

-(id)mypetsAt:(int)index
{

    NSLog(@"%@",[myPetsData objectAtIndex:index]);
    return [myPetsData objectAtIndex:index];

}
@end

