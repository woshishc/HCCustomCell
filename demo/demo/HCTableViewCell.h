//
//  HCTableViewCell.h
//  demo
//
//  Created by suhc on 16/3/10.
//  Copyright © 2016年 kongjianjia. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HCCellFrameModel.h"

@interface HCTableViewCell : UITableViewCell
/**
 *  数据模型
 */
@property (nonatomic, strong) HCCellFrameModel *frameModel;

/**
 *  快速创建cell
 *
 *  @param tableView 需要创建cell的tableView
 *
 *  @return 创建好的cell
 */
+ (instancetype)cellWithTableView:(UITableView *)tableView;

@end
