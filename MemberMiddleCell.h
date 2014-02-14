//
//  MemberMiddleCell.h
//  ProjectPETMILY
//
//  Created by 한상민(iPhone) on 2014. 2. 4..
//  Copyright (c) 2014년 한상민(개만정벌). All rights reserved.
//

#import <UIKit/UIKit.h>
#import "myMember.h"

@interface MemberMiddleCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
-(void)setMyMember:(myMember*)member;
@end
