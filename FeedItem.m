//
//  FeedItem.m
//  ProjectPETMILY
//
//  Created by 한상민(iPhone) on 2014. 1. 29..
//  Copyright (c) 2014년 한상민(개만정벌). All rights reserved.
//

#import "FeedItem.h"

@implementation FeedItem



+(id)feed:(NSString *)postImage tagName:(NSString *)tagName profileImage:(NSString *)profileImage userName:(NSString *)userName familyName:(NSString *)familyName postOpen:(NSString *)postOpen postNo:(NSInteger)postNo postReply:(NSInteger)postReply postTime:(NSDate *)postTime postText:(NSString *)postTxt postLike:(NSInteger)postLike
{
    FeedItem   *item = [[FeedItem alloc]init];

    item.postImage = postImage;
    item.tagName = tagName;
    item.profileImage = profileImage;
    item.userName = userName;
    item.familyName = familyName;
    item.postOpen = postOpen;
    item.postNo = postNo;
    item.postReply = postReply;
    item.postTime = postTime;
    item.postTxt = postTxt;
    item.postLike = postLike;

    return item;

}//팩토리 메소드

-(id)   init
{
    self=[super init];
    if(self)
    {

    }

    return self;
}


@end
