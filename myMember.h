//
//  myMember.h
//  ProjectPETMILY
//
//  Created by 한상민(iPhone) on 2014. 2. 5..
//  Copyright (c) 2014년 한상민(개만정벌). All rights reserved.
//

#import <Foundation/Foundation.h>

@interface myMember : NSObject

@property NSString *name;
//@property NSString *EMail;
//@property NSString *petMilyID;
@property NSString *profileImage;


+(id)myMember:(NSString*)profileImage;

@end
