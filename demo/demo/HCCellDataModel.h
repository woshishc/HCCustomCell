//
//  HCModel.h
//  demo
//
//  Created by suhc on 16/3/10.
//  Copyright © 2016年 kongjianjia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HCCellDataModel : NSObject

/**
 *  内容
 */
@property (nonatomic, copy) NSString *content;

/**
 *  图片名字
 */
@property (nonatomic, copy) NSString *imageName;

+ (instancetype)dataModelWithDic:(NSDictionary *)dic;

@end
