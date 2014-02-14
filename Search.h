//
//  Search.h
//  ProjectPETMILY
//
//  Created by 한상민(iPhone) on 2014. 2. 11..
//  Copyright (c) 2014년 한상민(개만정벌). All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Search : NSObject
@property (readwrite,nonatomic)NSString *userName;
@property (readwrite,nonatomic)NSString *famID;
@property (readwrite,nonatomic)NSString *userImg;
@property (readwrite,nonatomic)NSString *famName;
@property (readwrite,nonatomic)NSString *famImg;


//name, like, comment는 dictionary

+(id)searchUser:(NSString *)userName famID:(NSString*)userID userImg:(NSString*)userImg famName:(NSString*)famName;
+(id)searchFam :(NSString*)famID famImg : (NSString*)famImg famName : (NSString*)famName;
@end
