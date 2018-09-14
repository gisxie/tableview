//
//  ContentCell.m
//  demo1
//
//  Created by cex on 2018/9/14.
//  Copyright © 2018年 demo. All rights reserved.
//

#import "ContentCell.h"
#define DEVW [[UIScreen mainScreen] bounds].size.width 
@implementation ContentCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initSubViews];
    }
    return self;
}
-(void)initSubViews{
    _lab_title = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, DEVW-20, 20)];
    [self.contentView addSubview:_lab_title];
    _lab_title.font = [UIFont systemFontOfSize:15];
    _lab_title.textColor = [UIColor blackColor];
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
