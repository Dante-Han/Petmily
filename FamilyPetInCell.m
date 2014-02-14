//
//  FamilyPetInCell.m
//  ProjectPETMILY
//
//  Created by Ethan Hansa on 2014. 1. 30..
//  Copyright (c) 2014년 한상민(개만정벌). All rights reserved.
//

#import "FamilyPetInCell.h"
#import "FamilyPet.h"
#import <UIImageView+AFNetworking.h>

@interface FamilyPetInCell()
@property (weak, nonatomic) IBOutlet UIImageView *petImage;
@property (weak, nonatomic) IBOutlet UILabel *petName;
@property (weak, nonatomic) IBOutlet UILabel *petSex;

@end

@implementation FamilyPetInCell


-(void)setPet:(FamilyPet*)pet

{
    NSURL *petURL = [NSURL URLWithString:pet.petImg];

    [self.petImage setImageWithURL:petURL];

    self.petImage.layer.masksToBounds = YES;
self.petImage.layer.cornerRadius = 25.0;
    self.petImage.layer.borderColor = [UIColor whiteColor].CGColor;
self.petImage.layer.borderWidth = 3.0f;
    self.petImage.layer.rasterizationScale = [UIScreen mainScreen].scale;
    self.petImage.layer.shouldRasterize = YES;
    self.petImage.clipsToBounds = YES;

    self.petName.text = pet.petName;
//    self.petSex.text = pet.petGender;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
