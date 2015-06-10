//
//  MainTableViewCell.m
//  wangyicaipiao
//
//  Created by alyadan on 15/6/1.
//  Copyright (c) 2015年 alyadan. All rights reserved.
//

#import "MainTableViewCell.h"
#import "YDSettingItem.h"

@interface MainTableViewCell()

@end
@implementation MainTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

//-(void)setItem:(YDSettingItem *)item
//{
//    _item = item;
//    [self setupData];
//  
//}

-(void)setupData
{
    self.myLabel.text = _item.title;
    if(_item.icon)
        self.myImageView.image = [UIImage imageNamed:_item.icon];
}

-(void)setup:(UIImage *)image text:(NSString *)text
{
    self.myImageView.image = image;
    self.myLabel.text = text;
}

+(instancetype)cellWithTableView:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath identifier:(NSString *)identifier
{
    
    
    MainTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    return cell;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
