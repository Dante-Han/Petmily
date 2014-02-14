//
//  ReplyInfo.h
//  ProjectPETMILY
//
//  Created by 한상민(iPhone) on 2014. 2. 11..
//  Copyright (c) 2014년 한상민(개만정벌). All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ReplyInfo : NSObject


@property (readwrite,nonatomic)NSMutableDictionary *myReplyDic;
@property (readwrite,nonatomic)NSDictionary *postCount;


-(int)myReplyCount;
-(id)myReplyAt:(int)index;

+(id)defaultMyReplyInfo;
//-(void)sendPetArray:(int)index;

-(void)detailData:(NSNotification*)noti;
-(void)refresh;


@end
