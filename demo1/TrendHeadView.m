//
//  TrendHeadView.m
//  CEX
//
//  Created by cex on 2018/9/12.
//  Copyright © 2018年 mingthink. All rights reserved.
//

#import "TrendHeadView.h"

@implementation TrendHeadView
-(instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier{
    self=[super  initWithReuseIdentifier:reuseIdentifier];
    if (self) {
        [self initSubViews];
    }
    return self;
}
-(void)initSubViews{
    _lab_name = [[UILabel alloc]initWithFrame:CGRectMake(10, 12, 200, 20)];
    _lab_name.font = [UIFont systemFontOfSize:15];
    _lab_name.textColor = [UIColor blackColor];
    [self addSubview:_lab_name];
    
    UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(headViewTap)];
    tap.numberOfTapsRequired=1;
    [self addGestureRecognizer:tap];

}
-(void)headViewTap{
    if (_delegate && [_delegate respondsToSelector:@selector(selectedWithHeadView:)]){
        [_delegate selectedWithHeadView:self];
    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
