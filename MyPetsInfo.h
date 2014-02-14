//
//  MyPetsInfo.h
//  ProjectPETMILY
//
//  Created by 한상민(iPhone) on 2014. 2. 7..
//  Copyright (c) 2014년 한상민(개만정벌). All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MyPets.h"
#define MYHOME_URL @"http://pettest.0164740237.cloulu.com/myhome"

@interface MyPetsInfo : NSObject


@property (readwrite,nonatomic)NSMutableDictionary *myfamilyDic;
@property (readwrite,nonatomic)NSDictionary *postCount;

-(void)setFamID:(NSNotification*)noti;

-(int)mypetsCount;
-(id)mypetsAt:(int)index;

+(id)defaultMyPetsInfo;
-(void)sendPetArray:(MyPets *)myPet;


-(void)refresh;



@end
