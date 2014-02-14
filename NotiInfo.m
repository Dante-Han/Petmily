//
//  NotiInfo.m
//  ProjectPETMILY
//
//  Created by 한상민(iPhone) on 2014. 2. 10..
//  Copyright (c) 2014년 한상민(개만정벌). All rights reserved.
//

#import "NotiInfo.h"
#import "NotiItem.h"

@implementation NotiInfo


static NotiInfo *_instance=nil;

+(id)defaultNotiInfo
{
    if(nil==_instance)
        _instance = [[NotiInfo alloc]init];
    return _instance;
}


-(id)init
{
    self = [super init];
    //    myMemberData = [[NSMutableArray alloc]init];
    NSString *name;
    NSString *profileImage;
    NSString *comment;
    NSDate *notidate;

    if(self)
    {
        //        Member *myMember = [Member myMember:petmilyID profileImage:myMemberImage];

//        myMemberData  = @[[myMember myMember:@"id" profileImage:@"4.png"],[myMember myMember:@"id" profileImage:@"3.png"],[myMember myMember:@"id" profileImage:@"1.jpg"]];

        NotiItem *notiItem = [NotiItem notification:name profileImage:profileImage comment:comment notiDate:notidate];
        //[Member member:memberName profileImage:myMemberImage petmilyID:petmilyID EMail:email];
        //        [myMemberData addObject:myMember];
        [notiInfoData addObject:notiItem];
    }

    return self;
}

-(int)notiCount
{
    return (int)[notiInfoData count];
}


-(id)NotiAt:(int)index
{
    return [notiInfoData   objectAtIndex:index];
}
@end



