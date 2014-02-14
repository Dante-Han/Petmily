//
//  Reply.m
//  ProjectPETMILY
//
//  Created by 한상민(iPhone) on 2014. 2. 11..
//  Copyright (c) 2014년 한상민(개만정벌). All rights reserved.
//

#import "Reply.h"

@implementation Reply



+(id)reply:(NSString*)userImg userName:(NSString*)userName reTime:(NSDate*)reTime reTxt:(NSString*)reTxt
{

    Reply *reply = [[Reply alloc]init];

    reply.userImage= userImg;
    reply.userName = userName;
    reply.reTime = reTime;
    reply.reTxt = reTxt;

    return reply;
}


@end
/*  "user_img": "http://pds26.egloos.com/pds/201308/04/31/b0007531_51fd6f6c51d8c.jpg",
"user_name": "에이",
"re_time": "2014-02-10T06:14:19.000Z",
"re_txt": "1-1번댓글"*/
