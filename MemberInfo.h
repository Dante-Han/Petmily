//
//  SearchInfo.h
//  ProjectPETMILY
//
//  Created by Ethan Hansa on 2014. 1. 31..
//  Copyright (c) 2014년 한상민(개만정벌). All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Member.h"
@interface MemberInfo : NSObject

{
    NSMutableArray *memberInfoData;
}

+(id)defaultMemberInfo;
-(int)searchMemberCount;


@end
