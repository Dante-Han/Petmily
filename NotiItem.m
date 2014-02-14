//
//  NotiItem.m
//  ProjectPETMILY
//
//  Created by 한상민(iPhone) on 2014. 2. 10..
//  Copyright (c) 2014년 한상민(개만정벌). All rights reserved.
//

#import "NotiItem.h"

@implementation NotiItem

+(id)notification:(NSString*)name profileImage:(NSString*)profileImage comment:(NSString*)comment notiDate:(NSDate*)notiDate

{
    //myMember *member = [[myMember alloc]init];

    NotiItem *notiItem = [[NotiItem alloc]init];

    notiItem.name = name;
    notiItem.profileImage = profileImage;
    notiItem.notidate = notiDate;



    return notiItem;
}


@end
