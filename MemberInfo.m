//
//  SearchInfo.m
//  ProjectPETMILY
//
//  Created by Ethan Hansa on 2014. 1. 31..
//  Copyright (c) 2014년 한상민(개만정벌). All rights reserved.
//

#import "MemberInfo.h"
#import "Member.h"

@implementation MemberInfo

static MemberInfo *_instance = nil;

+(id)defaultMemberInfo
{
    if(_instance == nil)

    {
        _instance = [[MemberInfo alloc]init];
        
    }
    return _instance;
}
-(int)searchMemberCount
{
    return 0;
}

-(id)init
{
    
    self = [super init];


if(self)
{
    NSArray *profileImage;
    NSArray *name;
    NSArray *familyName;
    NSArray *email;
    NSArray *memberInfoData;

    name = @[@"한상민",@"쏘야",@"에바",@"보아",@"아만다"];
    profileImage = @[@"1.jpg",@"2.png",@"3.png",@"4.png",@"5.png"];
    familyName = @[@"가족",@"가족",@"가족",@"가족",@"가족"];
    email = @[@"e-mail",@"e-mail",@"e-mail",@"e-mail",@"e-mail"];

  /*  for(int i=0;i<5;i++)
    {
        memberInfoData = @[[Member member:[name objectAtIndex:i] profileImage:[profileImage objectAtIndex:i] petmilyID:[familyName objectAtIndex:i] EMail:[email objectAtIndex:i]]];
    }*/

}

    return self;
}


@end
