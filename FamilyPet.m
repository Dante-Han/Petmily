//
//  FamilyPet.m
//  ProjectPETMILY
//
//  Created by Ethan Hansa on 2014. 1. 30..
//  Copyright (c) 2014년 한상민(개만정벌). All rights reserved.
//

#import "FamilyPet.h"

@implementation FamilyPet

//+(id)familyPet:(NSString *)name petId:(NSInteger)petId petKind:(NSString *)petKind petBirth:(NSString *)petBirth familyID:(NSString *)familyId petTxt:(NSString *)petTxt petImg:(NSString *)petImg petGender:(NSString *)petGender

+(id)familyPet:(NSString *)name petId:(NSInteger)petID petImg:(NSString *)petImg
{

    FamilyPet *pet = [[FamilyPet alloc]init];

    pet.petName = name;
 //   pet.familyID = familyId;
  //  pet.petTxt = petTxt;
    pet.petId = petID;
//    pet.petGender = petGender;
   // pet.petBirth = petBirth;
    pet.petImg= petImg;
   // pet.petKind = petKind;

    return pet;
}



@end
