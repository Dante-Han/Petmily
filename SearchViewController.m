//
//  SearchViewController.m
//  ProjectPETMILY
//
//  Created by Ethan Hansa on 2014. 2. 3..
//  Copyright (c) 2014년 한상민(개만정벌). All rights reserved.
//

#import "SearchViewController.h"
#import "PetCMainViewController.h"
#import "SearchCell.h"
#import "SearchInfo.h"
#import "Search.h"

#import "MyPetsInfo.h"
@interface SearchViewController ()<UICollectionViewDataSource, UICollectionViewDelegate>
{
    BOOL  searchUser;
}

-(void)reloadSearchCell:(NSNotification*)noti;
@property (strong,nonatomic) SearchInfo *searchInfo;

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UITextField *searchText;



//-(void)sendSearchData:(NSString*)searchData;

@end

@implementation SearchViewController

- (IBAction)searchSwitch:(UISwitch*)sender {

    if(sender.isOn)
{
    searchUser = YES;

}
    else{
        searchUser = NO;}

    [self.searchInfo setSearchSwitch:searchUser];

}


-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    Search *searchItem = [[SearchInfo defaultSearchInfo]SearchAt:(int)indexPath.row];

    [self.searchInfo sendSearchFamID:searchItem];
    

    [[NSNotificationCenter defaultCenter]postNotificationName:@"GO_MYPAGE" object:Nil];

        [self.view endEditing:YES];





}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}


- (IBAction)searchClick:(id)sender {

    NSString *searchString = self.searchText.text;

    [self.searchInfo setSearchString:searchString];

    if(searchUser ==YES)
    {
        [self.searchInfo refreshUser];
    }
    else
    {
        [self.searchInfo refreshFam];
    }
    
    
}

/*-(void)sendSearchData:(NSString*)searchData
{

    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];


    NSDictionary *sendDic = [NSDictionary dictionaryWithObjectsAndKeys:searchData,@"searchString", nil];

    [nc postNotificationName:@"sendSearchData" object:self userInfo: sendDic];

}*/


-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{

    NSLog(@"searchcount %d",[self.searchInfo searchCount]);
    return [self.searchInfo searchCount];
}


-(UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{

    SearchCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"SEARCH_CELL" forIndexPath:indexPath];

    Search *search = [[SearchInfo defaultSearchInfo]SearchAt:(int)indexPath.row];

    if(searchUser ==YES)
    {
    [cell setUserSearch:search];
    }
    else
    {
        [cell setFamSearch:search];
    }
return cell;

}
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

-(void)reloadSearchCell:(NSNotification*)noti
{
    [self.collectionView reloadData];
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.searchInfo = [SearchInfo defaultSearchInfo];

    // Do any additional setup after loading the view.
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(reloadSearchCell:) name:@"USER_SEARCH_UPDATE" object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(reloadSearchCell:) name:@"FAM_SEARCH_UPDATE" object:nil];


}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
