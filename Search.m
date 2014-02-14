//
//  Search.m
//  ProjectPETMILY
//
//  Created by 한상민(iPhone) on 2014. 2. 11..
//  Copyright (c) 2014년 한상민(개만정벌). All rights reserved.
//

#import "Search.h"

@implementation Search


+(id)searchUser:(NSString *)userName famID:(NSString *)famID userImg:(NSString *)userImg famName:(NSString *)famName
{
    Search *search = [[Search alloc]init];

    search.userName = userName;
    search.userImg = userImg;
    search.famName = famName;
    search.famID =famID;
    return search;
}

+(id)searchFam :(NSString*)famID famImg : (NSString*)famImg famName : (NSString*)famName
{
    Search *search = [[Search alloc]init];

    search.famID = famID;
    search.famName = famName;
    search.famImg = famImg;

    return search;
}

@end
