//
//  HCCellFrame.h
//  demo
//
//  Created by suhc on 16/3/10.
//  Copyright © 2016年 kongjianjia. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HCCellDataModel.h"

@interface HCCellFrameModel : NSObject

/**
 *  数据模型
 */
@property (nonatomic, strong) HCCellDataModel *dataModel;

/**
 *  label的frame
 */
@property (nonatomic, assign) CGRect labelFrame;

/**
 *  图片的frame
 */
@property (nonatomic, assign) CGRect imageFrame;

/**
 *  cell的高度
 */
@property (nonatomic, assign) CGFloat cellHeight;

@end
