//
//  VCMine.m
//  网易云音乐UI
//
//  Created by 小哲的DELL on 2018/7/24.
//  Copyright © 2018年 小哲的DELL. All rights reserved.
//

#import "VCMine.h"

@interface VCMine ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong)UITableView *tableView;

@property (nonatomic, copy)NSArray *arrayData0_1;
@property (nonatomic, copy)NSArray *arrayData0_2;
@property (nonatomic, copy)NSArray *arrayData1_1;
@property (nonatomic, copy)NSArray *arrayData1_2;
@property (nonatomic, copy)NSArray *arrayImage0;
@property (nonatomic, copy)NSArray *arrayImage1;


@end

@implementation VCMine

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStyleGrouped];

    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
    //定义第一组cell的标题和副标题及图片
    _arrayData0_1 = [[NSArray alloc] initWithObjects:@"本地音乐", @"最近播放", @"我的电台", @"我的收藏", nil];
    _arrayData0_2 = [[NSArray alloc] initWithObjects:@"103", @"101", @"0", @"专辑/歌手/视频/专栏", nil ];
    
    UIImage *image0_1 = [UIImage imageNamed:@"音乐2"];
    UIImage *image0_2 = [UIImage imageNamed:@"最近播放"];
    UIImage *image0_3 = [UIImage imageNamed:@"电台"];
    UIImage *image0_4 = [UIImage imageNamed:@"我的收藏"];
    _arrayImage0 = [[NSArray alloc] initWithObjects:image0_1, image0_2, image0_3, image0_4, nil];
    
    //定义第二组cell的标题和副标题和图片
    NSArray *array1_1 = [[NSArray alloc] initWithObjects:@"我喜欢的音乐", @"肾上腺素", nil];
    NSArray *array1_2 = [[NSArray alloc] initWithObjects:@"422首，已下载10首", @"8首", nil];
    
    UIImage *image1_1 = [UIImage imageNamed:@"1_1"];
    UIImage *image1_2 = [UIImage imageNamed:@"1_2.jpg"];
    NSArray *arrayImage1 = [[NSArray alloc] initWithObjects:image1_1, image1_2, nil];
    
    //定义第三组cell的标题和副标题和图片
    NSArray *array2_1 = [[NSArray alloc] initWithObjects:@"美国Billboard周榜", @"程序员编程敲代码神速的纯音乐", @"苹果历年广告歌/发布会音乐全集", @"这些节奏，一发不可收拾", @"年度最受欢迎个性推荐歌曲", nil];
    NSArray *array2_2 = [[NSArray alloc] initWithObjects:@"100首 by Billboard公告牌", @"102首 by 喵帕斯、巴卫", @"394首 by Roger", @"113首 by A-JUN同学", @"69首 by 网易云音乐", nil];
    
    UIImage *image2_1 = [UIImage imageNamed:@"2_1.jpg"];
    UIImage *image2_2 = [UIImage imageNamed:@"2_2.jpg"];
    UIImage *image2_3 = [UIImage imageNamed:@"2_3.jpg"];
    UIImage *image2_4 = [UIImage imageNamed:@"2_4.jpg"];
    UIImage *image2_5 = [UIImage imageNamed:@"2_5.jpg"];
    
    NSArray *arrayImage2 = [[NSArray alloc] initWithObjects:image2_1, image2_2, image2_3, image2_4, image2_5, nil];
    
    //创建二维数组
    _arrayData1_1 = [[NSArray alloc] initWithObjects:array1_1, array2_1, nil];
    _arrayData1_2 = [[NSArray alloc] initWithObjects:array1_2, array2_2, nil];
    
    _arrayImage0 = [[NSArray alloc] initWithObjects:image0_1, image0_2, image0_3, image0_4, nil];
    _arrayImage1 = [[NSArray alloc] initWithObjects:arrayImage1, arrayImage2, nil];
    
    //使最后一个cell不被遮挡
    _tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    self.edgesForExtendedLayout = UIRectEdgeAll;
    self.automaticallyAdjustsScrollViewInsets = NO;
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSArray *array = [NSArray arrayWithObjects:@"4", @"2", @"5", nil];
    return [array[section] integerValue];
}

-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}

-(UIView*) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return nil;
}

//获取头部高度
-(CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if(section == 0){
        return 0;
    } else{
        return 10;
    }
}

//获取尾部高度
-(CGFloat) tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0;
}

//获取头部标题
-(NSString*) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if(section == 1){
        return @"我创建的歌单(2)                                                                         ···";
    }else{
        return @"我收藏的歌单(5)                                                                         ···";
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell0 = nil;
    UITableViewCell *cell = nil;
    cell0 = [tableView dequeueReusableCellWithIdentifier:@"cell0"];
    cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if(indexPath.section == 0){
        if(cell0 == nil){
            cell0 = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell0"];
        }
        cell0.textLabel.text = _arrayData0_1[indexPath.row];
        cell0.detailTextLabel.text = [_arrayData0_2 objectAtIndex:indexPath.row] ;
        cell0.imageView.image = [_arrayImage0 objectAtIndex:indexPath.row];
        return cell0;
    } else{
        if(cell == nil){
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
        }
        cell.textLabel.text = [[_arrayData1_1 objectAtIndex:indexPath.section-1] objectAtIndex:indexPath.row];
        cell.detailTextLabel.text = [[_arrayData1_2 objectAtIndex:indexPath.section-1] objectAtIndex:indexPath.row];
        cell.imageView.image = [[_arrayImage1 objectAtIndex:indexPath.section-1] objectAtIndex:indexPath.row];
        return cell;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
