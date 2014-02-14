//
//  NotiItem.h
//  ProjectPETMILY
//
//  Created by 한상민(iPhone) on 2014. 2. 10..
//  Copyright (c) 2014년 한상민(개만정벌). All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NotiItem : NSObject

@property (readwrite,nonatomic)NSString *name;
//@property NSString *EMail;
//@property NSString *petMilyID;
@property (readwrite,nonatomic)NSString *profileImage;
@property (readwrite,nonatomic)NSString *comment;
@property (readwrite,nonatomic)NSDate *notidate;


+(id)notification:(NSString*)name profileImage:(NSString*)profileImage comment:(NSString*)comment notiDate:(NSDate*)notiDate;


@end
