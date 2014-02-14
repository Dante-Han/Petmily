//
//  HonorList.m
//  ProjectPETMILY
//
//  Created by 한상민(iPhone) on 2014. 1. 29..
//  Copyright (c) 2014년 한상민(개만정벌). All rights reserved.
//

#import "HonorList.h"

@implementation HonorList


+(id)honor:(NSString*)image
{
    HonorList *list = [[HonorList alloc]init];

    list.image = image;

    return list;

}

@end
