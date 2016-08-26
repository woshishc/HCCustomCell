//
//  HCTableViewCell.m
//  demo
//
//  Created by suhc on 16/3/10.
//  Copyright © 2016年 kongjianjia. All rights reserved.
//

#import "HCTableViewCell.h"
#import <hctools/HCTools.h>

@interface HCTableViewCell ()
{
    //正文
    UILabel *_label;
    //图片
    UIImageView *_imageView;
    //分割线
    UIView *_sepLine;
}
@end

@implementation HCTableViewCell
+ (instancetype)cellWithTableView:(UITableView *)tableView{
    static NSString *cellID = @"cell_ID";
    HCTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[HCTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        //初始化子控件
        [self setupSubviews];
        
        //设置选中样式
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    return self;
}

- (void)setupSubviews{
    //正文
    _label = [[UILabel alloc] init];
    _label.backgroundColor = [UIColor redColor];
    _label.numberOfLines = 0;
    _label.font = [UIFont systemFontOfSize:13];
    [self.contentView addSubview:_label];
    
    //图片
    _imageView = [[UIImageView alloc] init];
    _imageView.backgroundColor = [UIColor redColor];
    [self.contentView addSubview:_imageView];
    
    //分割线
    _sepLine = [[UIView alloc] init];
    _sepLine.backgroundColor = [UIColor redColor];
    [self.contentView addSubview:_sepLine];
}

- (void)setFrameModel:(HCCellFrameModel *)frameModel{
    _frameModel = frameModel;
    
    //1.根据模型设置子控件的内容
    [self setSubviewValues];
    
    //2.根据模型设置子控件的frame
    [self setSubviewFrames];
}

/**
 *  根据模型设置子控件的内容
 */
- (void)setSubviewValues{
    //正文
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    
    if (_frameModel.isOneLine) {
        paragraphStyle.lineSpacing = 0;
    }else{
        paragraphStyle.lineSpacing = 14;
    }
    NSString *str = _frameModel.dataModel.content;
    NSMutableDictionary *attrDic = [NSMutableDictionary dictionary];
    attrDic[NSParagraphStyleAttributeName] = paragraphStyle;
    attrDic[NSFontAttributeName] = [UIFont systemFontOfSize:13];
    NSMutableAttributedString *attrStrM = [[NSMutableAttributedString alloc] initWithString:str attributes:attrDic];
    
    _label.attributedText = attrStrM;
    
    //图片
    _imageView.image = [UIImage imageNamed:_frameModel.dataModel.imageName];
}

/**
 *  根据模型设置子控件的frame
 */
- (void)setSubviewFrames{
    //正文
    _label.frame = _frameModel.labelFrame;
    
    //图片
    _imageView.frame = _frameModel.imageFrame;
    
    //分割线
    _sepLine.frame = CGRectMake(0, _frameModel.cellHeight - 1, [UIScreen mainScreen].bounds.size.width, 1);
}

@end
