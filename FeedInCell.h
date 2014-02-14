//
//  FeedInCell.h
//  ProjectPETMILY
//
//  Created by 한상민(iPhone) on 2014. 1. 29..
//  Copyright (c) 2014년 한상민(개만정벌). All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FeedItem.h"

@interface FeedInCell : UICollectionViewCell

-(void)setFeed:(FeedItem *)item index:(int)index;
-(CGSize)returnCellSize;

@end
