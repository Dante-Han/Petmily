//
//  Reply.h
//  ProjectPETMILY
//
//  Created by 한상민(iPhone) on 2014. 2. 11..
//  Copyright (c) 2014년 한상민(개만정벌). All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Reply : NSObject


@property (readwrite,nonatomic)NSString *userImage;
@property (readwrite,nonatomic)NSInteger postNo;
@property (readwrite,nonatomic)NSDate *reTime;
@property (readwrite,nonatomic)NSString *reTxt;
@property (readwrite,nonatomic)NSString *userName;

+(id)reply:(NSString*)userImg userName:(NSString*)userName reTime:(NSDate*)reTime reTxt:(NSString*)reTxt;


@end
