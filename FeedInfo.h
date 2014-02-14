//
//  FeedInfo.h
//  ProjectPETMILY
//
//  Created by 한상민(iPhone) on 2014. 1. 29..
//  Copyright (c) 2014년 한상민(개만정벌). All rights reserved.
//

#import <Foundation/Foundation.h>

#import "FeedItem.h"

@interface FeedInfo : NSObject


@property (readwrite,nonatomic)NSMutableDictionary *totalDic;
@property (readwrite,nonatomic)NSDictionary *postCount;
-(void)sendFeedArray:(FeedItem *)feedItem;


-(int)feedCount;
-(id)feedAt:(int)index;

+(id)defaultFeedInfo;

-(void)refresh;
@end
