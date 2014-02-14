//
//  HonorInfo.m
//  ProjectPETMILY
//
//  Created by 한상민(iPhone) on 2014. 1. 29..
//  Copyright (c) 2014년 한상민(개만정벌). All rights reserved.
//

#import "HonorInfo.h"

@implementation HonorInfo

{
    NSMutableArray *listData;
}
static HonorInfo *_instance=nil;

+(id)defaultHonor
{
    if(nil == _instance)

        _instance = [[HonorInfo alloc]init];
        return _instance;

    return self;

}

-(id)init

{
    listData = [[NSMutableArray alloc]init];
    NSString *listString;
    
    int j;
    for(int i = 1; i<13; i+=3)
    {
        listString= [NSString stringWithFormat:@"image%d.jpg",i];

        HonorList *list = [HonorList honor:listString];

//        if([listData indexOfObject:)
  //          listString = [NSString stringWithFormat:@"line.png"];
   //         list = [HonorList honor:listString];


        [listData addObject:list];
    }


    return self;
}
-(int)listCount
{
    return (int)[listData count];
}

-(id)listAt:(int)index
{
    return [listData objectAtIndex:index];
}

@end
