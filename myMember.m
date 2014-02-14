//
//  myMember.m
//  ProjectPETMILY
//
//  Created by 한상민(iPhone) on 2014. 2. 5..
//  Copyright (c) 2014년 한상민(개만정벌). All rights reserved.
//

#import "myMember.h"

@implementation myMember
+(id)myMember:(NSString *)profileImage
{
    myMember *member = [[myMember alloc]init];
    

    member.profileImage = profileImage;

    return member;
}
@end
