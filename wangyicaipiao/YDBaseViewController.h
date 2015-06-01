//
//  YDBaseViewController.h
//  wangyicaipiao
//
//  Created by alyadan on 15/5/1.
//  Copyright (c) 2015年 alyadan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YDSettingItem.h"
#import "YDSettingGroup.h"
#import "YDSettingCell.h"

@interface YDBaseViewController : UITableViewController
@property(nonatomic,strong)NSMutableArray *data;
@property(nonatomic, strong)NSString *identifier;
@end
