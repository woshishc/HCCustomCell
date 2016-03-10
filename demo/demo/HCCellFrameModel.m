//
//  HCCellFrame.m
//  demo
//
//  Created by suhc on 16/3/10.
//  Copyright © 2016年 kongjianjia. All rights reserved.
//

#import "HCCellFrameModel.h"

@implementation HCCellFrameModel

- (void)setDataModel:(HCCellDataModel *)dataModel{
    _dataModel = dataModel;
    
    //计算label的frame
    CGFloat labelX = 12;
    CGFloat labelY = 12;
   
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineSpacing = 14;
    
    NSString *str = _dataModel.content;
    NSMutableDictionary *attrDic = [NSMutableDictionary dictionary];
    attrDic[NSParagraphStyleAttributeName] = paragraphStyle;
    attrDic[NSFontAttributeName] = [UIFont systemFontOfSize:13.f];
    
    CGFloat maxWidth = [UIScreen mainScreen].bounds.size.width - labelX * 2;
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
    _labelFrame = CGRectMake(labelX, labelY, width, height);
    
    //图片的frame
    CGFloat imageX = labelX;
    CGFloat imageY = CGRectGetMaxY(_labelFrame) + 24;
    CGFloat imageWidth = 90;
    CGFloat imageHeight = imageWidth;
    _imageFrame = CGRectMake(imageX, imageY, imageWidth, imageHeight);
    
    //cell的高度
    _cellHeight = CGRectGetMaxY(_imageFrame) + 12;
}

@end
