//
//  SearchInfo.h
//  ProjectPETMILY
//
//  Created by 한상민(iPhone) on 2014. 2. 4..
//  Copyright (c) 2014년 한상민(개만정벌). All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Search.h"
@interface SearchInfo : NSObject
{
    NSString *searchString;
}


@property (readwrite,nonatomic)NSMutableDictionary *userSearchDic;
@property (readwrite,nonatomic)NSDictionary *userCount;

-(void)setSearchString:(NSString*)search;
-(void)setSearchSwitch:(BOOL)search;

-(void)sendSearchFamID:(Search *)search;


-(id)SearchAt:(int)index;
-(int)searchCount;

+(id)defaultSearchInfo;

-(void)refreshUser;
-(void)refreshFam;


@end
