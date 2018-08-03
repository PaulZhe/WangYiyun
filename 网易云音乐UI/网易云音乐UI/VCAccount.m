//
//  VCAccount.m
//  网易云音乐UI
//
//  Created by 小哲的DELL on 2018/7/24.
//  Copyright © 2018年 小哲的DELL. All rights reserved.
//

#import "VCAccount.h"
#import "ZZTableViewCell.h"

@interface VCAccount ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong)UITableView *tableView;

@property (nonatomic, copy)NSArray *arrayData;
@property (nonatomic, copy)NSArray *arrayImage;


@end

@implementation VCAccount

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tableView = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStyleGrouped];
    
    //自定义类需要使用这个方法
    [self.tableView registerClass:[ZZTableViewCell class] forCellReuseIdentifier:@"labelCell"];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
    
    
    //定义小数组
    NSArray *array1 = [[NSArray alloc] initWithObjects:@"我的消息", nil];
    NSArray *array2 = [[NSArray alloc] initWithObjects:@"会员中心",@"商城",@"在线听歌免流量", nil];
    NSArray *array3 = [[NSArray alloc] initWithObjects:@"设置",@"扫一扫",@"个性换肤",@"夜间模式",@"定时关闭",@"音乐闹钟",@"驾驶模式",@"优惠劵", nil];
    NSArray *array4 = [[NSArray alloc] initWithObjects:@"分享网易云音乐",@"关于", nil];
    _arrayData = [[NSArray alloc] initWithObjects:array1,array2, array3, array4, nil];
    
    //image小数组
    UIImage *image1_1 = [UIImage imageNamed:@"1.1"];
    UIImage *image2_1 = [UIImage imageNamed:@"2.1"];
    UIImage *image2_2 = [UIImage imageNamed:@"2.2"];
    UIImage *image2_3 = [UIImage imageNamed:@"2.3"];
    UIImage *image3_1 = [UIImage imageNamed:@"3.1"];
    UIImage *image3_2 = [UIImage imageNamed:@"3.2"];
    UIImage *image3_3 = [UIImage imageNamed:@"3.3"];
    UIImage *image3_4 = [UIImage imageNamed:@"3.4"];
    UIImage *image3_5 = [UIImage imageNamed:@"3.5"];
    UIImage *image3_6 = [UIImage imageNamed:@"3.6"];
    UIImage *image3_7 = [UIImage imageNamed:@"3.7"];
    UIImage *image3_8 = [UIImage imageNamed:@"3.8"];
    UIImage *image4_1 = [UIImage imageNamed:@"4.1"];
    UIImage *image4_2 = [UIImage imageNamed:@"4.2"];
    
    NSArray *arrayImage1 = [[NSArray alloc] initWithObjects:image1_1, nil];
    NSArray *arrayImage2 = [[NSArray alloc] initWithObjects:image2_1, image2_2, image2_3, nil];
    NSArray *arrayImage3 = [[NSArray alloc] initWithObjects:image3_1, image3_2, image3_3, image3_4, image3_5,image3_6,image3_7, image3_8, nil];
    NSArray *arrayImage4 = [[NSArray alloc] initWithObjects:image4_1, image4_2, nil];
    
    _arrayImage = [[NSArray alloc] initWithObjects:arrayImage1, arrayImage2, arrayImage3, arrayImage4, nil];
    
    //使最后一个cell不被遮挡
    _tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    self.edgesForExtendedLayout = UIRectEdgeAll;
    self.automaticallyAdjustsScrollViewInsets = NO;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.section == 0)
        return 100;
    else return 50;
}

//获取尾部高度
-(CGFloat) tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 2;
}

-(UIView*) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return nil;
}

//协议函数
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 6;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSArray *array = [NSArray arrayWithObjects:@1, @1, @3, @8, @2, @1, nil];
    return [array[section] integerValue];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.section == 0){
        UITableViewCell *cell0 = [tableView dequeueReusableCellWithIdentifier:@"cell0"];
        if(cell0 == nil){
            cell0 = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell0"];
            
            UIButton *button = [[UIButton alloc] init];
            button.backgroundColor = [UIColor whiteColor];
            button.layer.masksToBounds = YES;
            button.layer.borderWidth = 1;
            button.layer.borderColor = [UIColor redColor].CGColor;
            button.frame = CGRectMake(315, 30, 83, 30);
            button.layer.cornerRadius = 15;
            
            [button setTitle:@"签到" forState:UIControlStateNormal];
            [button setTitle:@"已签到" forState:UIControlStateSelected];
            [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
            [button setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
            
            [button setImage:[UIImage imageNamed:@"0.2"] forState:UIControlStateNormal];
            
            [button addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchDown];
            [cell0.contentView addSubview:button];
        }
        
        
        [cell0.imageView setImage:[UIImage imageNamed:@"0.1.jpeg"]];
        cell0.textLabel.text = @"Chris Paul";
        cell0.detailTextLabel.text = @"Lv.8";
        
        return cell0;
    }else if(indexPath.section == 5){
        ZZTableViewCell *cell1 = [tableView dequeueReusableCellWithIdentifier:@"labelCell" forIndexPath:indexPath];
        [cell1.mybutton setTitle:@"退出登录" forState:UIControlStateNormal];
        [cell1.mybutton addTarget:self action:@selector(press) forControlEvents:UIControlEventTouchUpInside];
        UILabel *label = [[UILabel alloc] init];
        label.frame = CGRectMake(300, 10, 57, 30);
        label.text = @"asd";
        label.textColor =[UIColor blackColor];
        [cell1.contentView addSubview:label];
        return cell1;
    }else{
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
        if(cell == nil){
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
            
        }
        
        cell.textLabel.text = [[_arrayData objectAtIndex:indexPath.section-1] objectAtIndex:indexPath.row];
        
        cell.imageView.image = [[_arrayImage objectAtIndex:indexPath.section-1] objectAtIndex:indexPath.row];
        
        //自定义cell添加副标题
        if(indexPath.section == 3 && indexPath.row == 3){
                cell.detailTextLabel.text = @"自选颜色";
        }
        
        //添加开关
        if(indexPath.section == 3 && indexPath.row ==4){
            UISwitch *swi = [[UISwitch alloc] init];
            swi.center = CGPointMake(370, 25);
            [cell.contentView addSubview:swi];
        } else{
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }
        
        return cell;
    }
}

-(void)click:(UIButton*) button
{
    button.selected = !button.selected;
    if(button.selected){
        [button setImage:nil forState:UIControlStateNormal];
    }else{
        [button setImage:[UIImage imageNamed:@"0.2"] forState:UIControlStateNormal];

    }
}

-(void)press{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"确定要退出当前帐号吗？" message:nil preferredStyle: UIAlertControllerStyleActionSheet];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    
    UIAlertAction *deleteAction = [UIAlertAction actionWithTitle:@"退出" style:UIAlertActionStyleDestructive handler:nil];
    
    [alertController addAction:cancelAction];
    
    [alertController addAction:deleteAction];
    
    [self presentViewController:alertController animated:YES completion:nil];
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

