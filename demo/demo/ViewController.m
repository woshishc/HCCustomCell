//
//  ViewController.m
//  demo
//
//  Created by suhc on 16/3/9.
//  Copyright © 2016年 kongjianjia. All rights reserved.
//

#import "ViewController.h"
#import <HCTools/HCTools.h>
#import "HCTableViewCell.h"
#import "HCLabel.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UILabel *label;
}
/**
 *  数据
 */
@property (nonatomic, strong) NSMutableArray *dataList;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addTableView];
    
}

- (void)addLabel{
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineSpacing = 14;
    
    NSMutableDictionary *attrDic = [NSMutableDictionary dictionary];
    attrDic[NSParagraphStyleAttributeName] = paragraphStyle;
    attrDic[NSFontAttributeName] = [UIFont systemFontOfSize:16.f];
    
    NSString *str = @"哈哈哈哈哈哈";
    NSMutableAttributedString *attrStrM = [[NSMutableAttributedString alloc] initWithString:str attributes:attrDic];
    
    label = [[UILabel alloc] init];
    label.backgroundColor = [UIColor redColor];
    label.numberOfLines = 0;
    label.attributedText = attrStrM;
    [self.view addSubview:label];
    
    CGFloat maxWidth = [UIScreen mainScreen].bounds.size.width - 180;
    CGFloat width = 0;
    CGFloat height = 0;
    CGRect rect = [str boundingRectWithSize:CGSizeMake(maxWidth, MAXFLOAT) options:NSStringDrawingUsesDeviceMetrics attributes:attrDic context:nil];
    if (rect.size.width >= maxWidth) {
        //多行
        height = [str boundingRectWithSize:CGSizeMake(maxWidth, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:attrDic context:nil].size.height;
        width = maxWidth;
    }else{
        //一行
        height = rect.size.height;
        width = rect.size.width;
    }
    label.frame = CGRectMake(90, 100, width, height);
}

- (void)addTableView{
    UITableView *tableView = [[UITableView alloc] init];
    tableView.frame = CGRectMake(0, 20, self.view.width, self.view.height - 20);
    tableView.dataSource = self;
    tableView.delegate = self;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView.tableFooterView = [[UIView alloc] init];
    [self.view addSubview:tableView];
}

#pragma mark - UITableViewDataSource
/**
 *  每组有多少行
 */
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //1.创建cell
    HCTableViewCell *cell = [HCTableViewCell cellWithTableView:tableView];
    
    //2.设置数据
    cell.frameModel = _dataList[indexPath.row];
    
    //3.返回cell
    return cell;
}

#pragma mark - UITableViewDelegate
//选中某一行cell
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    HCCellFrameModel *frameModel = _dataList[indexPath.row];
    return frameModel.cellHeight;
}

#pragma mark - 懒加载
- (NSMutableArray *)dataList{
    if (_dataList == nil) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"DataList" ofType:@"plist"];
        NSArray *dataArray = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *tempArray = [NSMutableArray arrayWithCapacity:dataArray.count];
        for (NSDictionary *dic in dataArray) {
            HCCellDataModel *dataModel = [HCCellDataModel dataModelWithDic:dic];
            HCCellFrameModel *frameModel = [[HCCellFrameModel alloc] init];
            frameModel.dataModel = dataModel;
            [tempArray addObject:frameModel];
        }
        _dataList = tempArray;
    }
    
    return _dataList;
}
    
@end
