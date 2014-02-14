//
//  FeedItem.h
//  ProjectPETMILY
//
//  Created by 한상민(iPhone) on 2014. 1. 29..
//  Copyright (c) 2014년 한상민(개만정벌). All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FeedItem : NSObject

@property (readwrite,nonatomic)NSString *postImage;
@property (readwrite,nonatomic)NSInteger postNo;
@property (readwrite,nonatomic)NSDate *postTime;
@property (readwrite,nonatomic)NSString *tagName;
@property (readwrite,nonatomic)NSString *profileImage;
@property (readwrite,nonatomic)NSString *userName;
@property (readwrite,nonatomic)NSString *familyName;
@property (readwrite,nonatomic)NSInteger postReply;
@property (readwrite,nonatomic)NSString *postOpen;
@property (readwrite,nonatomic)NSString *postTxt;
@property (readwrite,nonatomic)NSInteger postLike;



//name, like, comment는 dictionary

+(id)feed:(NSString *)postImage tagName:(NSString*)tagName profileImage:(NSString *)profileImage userName:(NSString *)userName familyName:(NSString*)familyName postOpen:(NSString *)postOpen postNo:(NSInteger)postNo postReply:(NSInteger)postReply postTime:(NSDate*)postTime postText:(NSString*)postTxt postLike:(NSInteger)postLike;



@end
