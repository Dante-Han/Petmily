//
//  MyPets.m
//  ProjectPETMILY
//
//  Created by 한상민(iPhone) on 2014. 2. 7..
//  Copyright (c) 2014년 한상민(개만정벌). All rights reserved.
//

#import "MyPets.h"

@implementation MyPets

+(id)myPet:(NSString *)postImage tagName:(NSString *)tagName profileImage:(NSString *)profileImage userName:(NSString *)userName familyName:(NSString *)familyName postOpen:(NSString *)postOpen postNo:(NSInteger)postNo postReply:(NSInteger)postReply postTime:(NSDate *)postTime postText:(NSString *)postTxt postLike:(NSInteger)postLike
{
    MyPets *mypet = [[MyPets alloc]init];

    mypet.postImage = postImage;
    mypet.tagName = tagName;
    mypet.profileImage = profileImage;
    mypet.userName = userName;
    mypet.familyName = familyName;
    mypet.postOpen = postOpen;
    mypet.postNo = postNo;
    mypet.postReply = postReply;
    mypet.postTime = postTime;
    mypet.postTxt = postTxt;
    mypet.postLike = postLike;

    return mypet;
}


@end
