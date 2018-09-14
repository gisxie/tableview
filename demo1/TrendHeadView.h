//
//  TrendHeadView.h
//  CEX
//
//  Created by cex on 2018/9/12.
//  Copyright © 2018年 mingthink. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol HeadViewSelectDelegate;
@interface TrendHeadView : UITableViewHeaderFooterView
@property(nonatomic,retain)UILabel *lab_name;
@property(nonatomic,assign)NSInteger section;
@property(nonatomic,assign)id<HeadViewSelectDelegate> delegate;
@end

@protocol HeadViewSelectDelegate <NSObject>
-(void)selectedWithHeadView:(TrendHeadView *)headView;
@end
