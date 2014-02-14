//
//  Member.h
//  ProjectPETMILY
//
//  Created by Ethan Hansa on 2014. 1. 31..
//  Copyright (c) 2014년 한상민(개만정벌). All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Member : NSObject

@property NSString *name;
@property NSString *EMail;
@property NSString *petMilyID;
@property NSString *profileImage;


+(id)member:(NSString*)name profileImage:(NSString*)profileImage petmilyID:(NSString*)petmilyID EMail:(NSString*)EMail;
//+(id)myMember:(NSString*)petmilyID profileImage:(NSString*)profileImage;

@end
