//
//  ViewController.m
//  demo1
//
//  Created by cex on 2018/9/12.
//  Copyright © 2018年 demo. All rights reserved.
//

#import "ViewController.h"
#import "TrendHeadView.h"
#import "ContentCell.h"
#define DEVW [[UIScreen mainScreen] bounds].size.width
#define DEVH [[UIScreen mainScreen] bounds].size.height
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource,HeadViewSelectDelegate>
{
      UITableView *mainTabV;
}
@property(nonatomic,strong)NSMutableArray *statusArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _statusArray = [NSMutableArray arrayWithObjects:@0,@0,@0,@0,@0,@0,@0,@0,@0,@0,@0,@0,@0,@0,@0,@0,@0,@0,@0,@0,@0,@0,@0,@0,@0,@0,@0,@0,@0,@0,@0,@0,@0,@0,@0,@0,@0,@0,@0,@0,@0,@0,@0,@0,@0,@0,@0,@0,@0,@0,@0,@0,@0,@0,@0,@0,@0,@0,@0,@0,@0,@0,@0,@0,@0,@0,@0,@0,@0,@0,@0,@0,@0,@0,@0, nil];
    mainTabV=[[UITableView alloc]initWithFrame:CGRectMake(0, 70, DEVW,DEVH-70) style:UITableViewStyleGrouped];
    [self.view addSubview:mainTabV];
    mainTabV.delegate=self;
    mainTabV.dataSource=self;
    mainTabV.tableFooterView = [[UIView alloc]init];
    if (@available(iOS 11.0, *)) {
        //mainTabV.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        mainTabV.estimatedRowHeight = 0;
        mainTabV.estimatedSectionFooterHeight = 0;
        mainTabV.estimatedSectionHeaderHeight = 0;
    }
    [NSTimer scheduledTimerWithTimeInterval:1 repeats:YES block:^(NSTimer * _Nonnull timer) {
           [mainTabV reloadData];

    }];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return _statusArray.count;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if ([_statusArray[section] isEqualToNumber:@0]) {
        return 0;
    }else {
        return 1;
    }
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identify=@"Cell";
//    NSInteger section=indexPath.section;
//    NSInteger row=indexPath.row;
    ContentCell *cell=[tableView dequeueReusableCellWithIdentifier:identify];
    if (!cell) {
        cell=[[ContentCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify];
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
    }
    cell.lab_title.text = @"content,content,content,content,content,content,content,content,content,content,content";
    return cell;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    static NSString *identifier = @"Header";
    TrendHeadView *headerView=[tableView dequeueReusableHeaderFooterViewWithIdentifier:identifier];
    if (!headerView) {
        headerView= [[TrendHeadView alloc] initWithReuseIdentifier:identifier];
  }
    headerView.lab_name.text=[NSString stringWithFormat:@"section-%zd",section];
    headerView.delegate=self;
    headerView.section=section;
    return headerView;
    
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return nil;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 50;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return CGFLOAT_MIN;
}
-(void)selectedWithHeadView:(TrendHeadView *)headView{
    NSInteger section=headView.section;
    for (int i=0; i<_statusArray.count; i++) {
        if (i!=section) {
            if ([_statusArray[i] isEqualToNumber:@1]) {
                [_statusArray replaceObjectAtIndex:i withObject:@0];
                [mainTabV reloadSections:[NSIndexSet indexSetWithIndex:i] withRowAnimation:UITableViewRowAnimationAutomatic];
                break;
            }
            }
    }
    int status = [_statusArray[section] intValue];
    NSNumber *num = status == 0 ? @1 :@0;
    [_statusArray replaceObjectAtIndex:section withObject:num];
    [mainTabV reloadSections:[NSIndexSet indexSetWithIndex:section] withRowAnimation:UITableViewRowAnimationAutomatic];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
