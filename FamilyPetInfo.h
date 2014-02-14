//
//  FamilyPetInfo.h
//  ProjectPETMILY
//
//  Created by Ethan Hansa on 2014. 1. 30..
//  Copyright (c) 2014년 한상민(개만정벌). All rights reserved.
//

#import <Foundation/Foundation.h>

#import "FamilyPet.h"


@interface FamilyPetInfo : NSObject
@property (strong,nonatomic)NSMutableDictionary *familyPetDic;

+(id)defaultFamilyPetInfo;
-(void)setFamID:(NSNotification*)noti;

-(void)refresh;

-(int)petCount;
-(id)petAt:(int)index;
  @end
