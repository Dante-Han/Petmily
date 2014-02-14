//
//  SearchInfo.m
//  ProjectPETMILY
//
//  Created by 한상민(iPhone) on 2014. 2. 4..
//  Copyright (c) 2014년 한상민(개만정벌). All rights reserved.
//

#import "SearchInfo.h"
#import "Search.h"
#import <AFNetworking.h>

#define SEARCH_USER_ID_URL @"http://pettest.0164740237.cloulu.com/searchuser"
#define SEARCH_FAM_ID_URL @"http://pettest.0164740237.cloulu.com/searchfam"


@implementation SearchInfo


{
    NSMutableArray *searchData;
    NSDictionary *tempDic;
    BOOL searchSwitch;


}

static SearchInfo *_instance = nil;

-(void)setSearchString:(NSString*)search
{
    searchString = search;

}
-(void)setSearchSwitch:(BOOL)search
{
    searchSwitch = search;
}


+(id)defaultSearchInfo
{
    if(nil == _instance)
        _instance = [[SearchInfo alloc]init];
    return _instance;
}

/*-(int)feedCount
{
    return (int) feedData.count;
}*/


-(void)refreshUser
{

    searchData = [[NSMutableArray alloc]init];

    //[feedData addObject:item];

    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSDictionary *parameters = @{@"user_name":searchString};

    [manager POST:SEARCH_USER_ID_URL parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {

        Search *userSearch = [[Search alloc]init];


        NSString *userName;
        NSString *famName;
        NSString *userImg;
        NSString *famID;

        NSInteger allCount;

        NSDictionary *resultMsg;
        tempDic = [responseObject objectForKey:@"results"];
        resultMsg = [responseObject objectForKey:@"result_msg"];
        NSLog(@"result msg : %@",resultMsg);

        NSLog(@"respons %@",responseObject);
        allCount= tempDic.count-1;
        NSLog(@"all count %ld",allCount);

        self.userSearchDic = [[NSMutableDictionary alloc]init];

       if(allCount == 0 )
        {
            self.userSearchDic = [responseObject objectForKey:@"results"][0];
            famID = [self.userSearchDic objectForKey:@"fam_id"];
            userImg = [self.userSearchDic objectForKey:@"user_img"];
            userName = [self.userSearchDic objectForKey:@"user_name"];
            famName = [self.userSearchDic objectForKey:@"fam_name"];



            userSearch = [Search searchUser:userName famID:famID userImg:userImg famName:famName];
            [searchData addObject:userSearch];


        }
        for(int i = 0; i< allCount; i++)
        {

            self.userSearchDic = [responseObject objectForKey:@"results"][i];
                        NSLog(@"search dic : %@",self.userSearchDic);

            famID = [self.userSearchDic objectForKey:@"fam_id"];
            userImg = [self.userSearchDic objectForKey:@"user_img"];
            userName = [self.userSearchDic objectForKey:@"user_name"];
            famName = [self.userSearchDic objectForKey:@"fam_name"];



            userSearch = [Search searchUser:userName famID:famID userImg:userImg famName:famName];
            [searchData addObject:userSearch];
        }

        [[NSNotificationCenter defaultCenter]postNotificationName:@"USER_SEARCH_UPDATE" object:nil];
        
        
    } failure:
     ^(AFHTTPRequestOperation *operation, NSError *error) {
         NSLog(@"Error:%@",error);
     }];
    
}


-(void)sendSearchFamID:(Search *)search
{
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    NSString *famID =  search.famID;

    NSDictionary *sendDic = [NSDictionary dictionaryWithObjectsAndKeys:famID,@"famID", nil];

    [nc postNotificationName:@"SEND_SEARCH_FAM_ID" object:self userInfo: sendDic];
    
}


-(void)refreshFam
{
    searchData = [[NSMutableArray alloc]init];

    //[feedData addObject:item];

    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSDictionary *parameters = @{@"fam_name":searchString};

    [manager POST:SEARCH_FAM_ID_URL parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {

        Search *famSearch = [[Search alloc]init];


        NSString *famName;
        NSString *famImg;
        NSString *famID;

        NSInteger allCount;

        NSDictionary *resultMsg;
        tempDic = [responseObject objectForKey:@"results"];
        resultMsg = [responseObject objectForKey:@"result_msg"];
        NSLog(@"result msg : %@",resultMsg);

        NSLog(@"respons %@",responseObject);
        allCount= tempDic.count-1;
        NSLog(@"all count %ld",allCount);

        self.userSearchDic = [[NSMutableDictionary alloc]init];

       if(allCount == 0 )
        {
            self.userSearchDic = [responseObject objectForKey:@"results"][0];
            NSLog(@"search dic : %@",self.userSearchDic);

            famID = [self.userSearchDic objectForKey:@"fam_id"];
            famImg = [self.userSearchDic objectForKey:@"fam_img"];

            famName = [self.userSearchDic objectForKey:@"fam_name"];


            famSearch = [Search searchFam:famID famImg:famImg famName:famName];
            
            [searchData addObject:famSearch];

        }
        for(int i = 0; i< allCount; i++)
        {

            self.userSearchDic = [responseObject objectForKey:@"results"][i];
            NSLog(@"search dic : %@",self.userSearchDic);

            famID = [self.userSearchDic objectForKey:@"fam_id"];
            famImg = [self.userSearchDic objectForKey:@"fam_img"];

            famName = [self.userSearchDic objectForKey:@"fam_name"];


            famSearch = [Search searchFam:famID famImg:famImg famName:famName];

            [searchData addObject:famSearch];
        }

        [[NSNotificationCenter defaultCenter]postNotificationName:@"FAM_SEARCH_UPDATE" object:nil];
        
        
    } failure:
     ^(AFHTTPRequestOperation *operation, NSError *error) {
         NSLog(@"Error:%@",error);
     }];


}

-(int)searchCount
{
    return (int)[searchData count];
}

-(id)SearchAt:(int)index
{
    return [searchData objectAtIndex:index];
    
}



@end
