//
//  FamilyPet.h
//  ProjectPETMILY
//
//  Created by Ethan Hansa on 2014. 1. 30..
//  Copyright (c) 2014년 한상민(개만정벌). All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FamilyPet : NSObject

@property (nonatomic)NSInteger petId;
//@property (nonatomic)NSString *petGender;
//@property (nonatomic)NSString *petKind;
//@property (nonatomic)NSString *petBirth;
@property (nonatomic)NSString *petName;
//@property (nonatomic)NSString *familyID;
//@property (nonatomic)NSString *petTxt;
@property (nonatomic)NSString *petImg;

//+(id)familyPet:(NSString *)name petId:(NSInteger)petId petKind:(NSString*)petKind petBirth:(NSString*)petBirth familyID:(NSString*)familyId petTxt:(NSString*)petTxt petImg:(NSString*)petImg petGender:(NSString*)petGender;

+(id)familyPet:(NSString*)name petId:(NSInteger)petID petImg:(NSString*)petImg;





@end
