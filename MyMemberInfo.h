//
//  MyMemberInfo.h
//  ProjectPETMILY
//
//  Created by 한상민(iPhone) on 2014. 2. 4..
//  Copyright (c) 2014년 한상민(개만정벌). All rights reserved.
//

#import <Foundation/Foundation.h>
#import "myMember.h"

@interface MyMemberInfo : NSObject

+(id)defaultMyMemberInfo;

//-(int)petCount;
-(int)myMemberCount;
-(id)MemberAt:(int)index;
-(void)refresh;

@property (strong,nonatomic) NSMutableArray *myMemberArray;
-(void)setFamID:(NSNotification*)noti;

@end
