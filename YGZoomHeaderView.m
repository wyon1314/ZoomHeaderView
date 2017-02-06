//
//  YGZoomHeaderView.m
//  ZoomHeaderView
//
//  Created by 酷星 on 2017/2/6.
//  Copyright © 2017年 wyon. All rights reserved.
//

#import "YGZoomHeaderView.h"
#import "Masonry.h"

@interface YGZoomHeaderView ()

@property (nonatomic, strong) UIImageView *imgView;

@end

@implementation YGZoomHeaderView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initUI];
    }
    return self;
}

- (void)initUI {
    
    self.imgView = [[UIImageView alloc] init];
    [self addSubview:_imgView];
    _imgView.image = [UIImage imageNamed:@"test"];
    
    [_imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.equalTo(self);
    }];
}

- (void)setOffsetY:(CGFloat)offsetY {
    _offsetY = offsetY;
    
    if (offsetY < 0) {
        [_imgView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self).offset(offsetY);
            make.left.equalTo(self).offset(offsetY);
            make.right.equalTo(self).offset(-offsetY);
        }];
    } else  {
        [_imgView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.right.left.equalTo(self);
        }];
    }

}

@end
