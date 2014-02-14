//
//  FamilyPetInfo.m
//  ProjectPETMILY
//
//  Created by Ethan Hansa on 2014. 1. 30..
//  Copyright (c) 2014년 한상민(개만정벌). All rights reserved.
//

#import "FamilyPetInfo.h"
#import <AFNetworking.h>
#define PET_INFO_URL @"http://pettest.0164740237.cloulu.com/myhome"

@implementation FamilyPetInfo
{
    NSMutableArray *familyPetData;
    NSMutableDictionary *tempDic;
    NSString *famID;
}

static FamilyPetInfo *_instance=nil;


+(id)defaultFamilyPetInfo
{
    if(nil == _instance)
        _instance = [[FamilyPetInfo alloc]init];

    return _instance;
}



-(void)refresh
{

    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];

    NSDictionary *parameters = @{@"fam_id":famID};

    [manager POST:PET_INFO_URL parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {

        NSInteger allCount;

        NSInteger petID;

       // NSString *petBirth;
        NSString *petImg;
        NSString *petName;
        /*NSString *familyID;
        NSString *petGender;
        NSString *petTxt;
        NSString *petKind;*/

        FamilyPet *familyPets;

        familyPetData = [[NSMutableArray alloc]init];

        tempDic =[responseObject objectForKey:@"pet_info"];

        allCount = tempDic.count-1;
//        NSLog(@"temp: %@",tempDic);


        for(int i = 0; i < allCount; i++)
        {
            self.familyPetDic=[[NSMutableDictionary alloc]init];

            self.familyPetDic = [responseObject objectForKey:@"pet_info"][i];

            petImg = [self.familyPetDic objectForKey:@"pet_img"];
            //petBirth =[self.familyPetDic objectForKey:@"pet_birth"];
            //petTxt = [self.familyPetDic objectForKey:@"pet_txt"];
            petID= [[self.familyPetDic objectForKey:@"pet_id"]intValue];
            //petKind = [self.familyPetDic objectForKey:@"pet_kind"];
            //petGender = [self.familyPetDic objectForKey:@"pet_gender"];
            //familyID = [self.familyPetDic objectForKey:@"fam_id"];
            petName = [self.familyPetDic objectForKey:@"pet_name"];


            familyPets = [FamilyPet familyPet:petName petId:petID petImg:petImg];
            [familyPetData addObject:familyPets];

        }

        
        
        [[NSNotificationCenter defaultCenter]postNotificationName:@"FAMILYPET_INFO_UPDATE" object:Nil];
        
        
    } failure:
     ^(AFHTTPRequestOperation *operation, NSError *error) {
         NSLog(@"Error:%@",error);
     }];
    
    
}

// Search에서 클릭한 가족 이름을 전달 받음. 그리고 없다면 가족 이름을 aaa로 설정(임시)
-(id)init
{

    self = [super init];
    famID = @"aaa";
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(setFamID:) name:@"SEND_SEARCH_FAM_ID" object:nil];


    return self;

}

-(void)setFamID:(NSNotification*)noti
{

     NSDictionary *dic = [noti userInfo];
    famID = [dic objectForKey:@"famID"];
        


}


-(int)petCount
{
    return (int)familyPetData.count;
}

-(id)petAt:(int)index
{

        
    return [familyPetData objectAtIndex:index];
}

@end
