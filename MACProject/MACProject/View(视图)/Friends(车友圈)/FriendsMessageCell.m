//
//  FriendsMessageCell.m
//  MACProject
//
//  Created by MacKun on 16/9/21.
//  Copyright © 2016年 com.mackun. All rights reserved.
//

#import "FriendsMessageCell.h"
#import "YYText.h"
#import "MACImageGroupView.h"
@interface FriendsMessageCell(){
    
}
@property (nonatomic,strong) UIImageView  *avactorImageView;
@property (nonatomic,strong) UILabel *nameLabel;
@property (nonatomic,strong) UILabel *timeLabel;
@property (nonatomic,strong) YYLabel *contentLabel;
@property (nonatomic,strong) MACImageGroupView *gridView;//图片
@property (nonatomic,strong) UILabel *browserNumLabel;//浏览次数
@property (nonatomic,strong) UIButton *addGoodBtn;//点赞
@property (nonatomic,strong) UIButton *addCommentBtn;//评论
@property (nonatomic,strong) UILabel *goodNumLabel;//点赞数量
@property (nonatomic,strong) UITableView *commentTableView;//评论列表
@end

@implementation FriendsMessageCell

- (void)awakeFromNib {
    // Initialization code
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if ( self ) {
        //头像
        _avactorImageView             = [[UIImageView alloc] init];
        _avactorImageView.contentMode = UIViewContentModeScaleAspectFill;
        _avactorImageView.image       = [UIImage imageNamed:@"placeholder_dropbox"];
        [self.contentView addSubview:_avactorImageView];
        [_avactorImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.mas_equalTo(8);
            make.width.height.mas_equalTo(44);
        }];
        //姓名
        _nameLabel                 = [[UILabel alloc]init];
        _nameLabel.numberOfLines   = 1;
        _nameLabel.text            = @"麦克坤";
      //  _nameLabel.backgroundColor = [UIColor RandomColor];
        _nameLabel.font            = [UIFont systemFontOfSize:17.0f];
        [self.contentView addSubview:_nameLabel];
        [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_avactorImageView.mas_right).offset(8);
            make.top.equalTo(_avactorImageView.mas_top);
            make.height.mas_equalTo(21.f);
            make.right.equalTo(self.contentView.mas_right).offset(-8);
        }];
        //时间
        _timeLabel                 = [[UILabel alloc]init];
        _timeLabel.numberOfLines   = 1;
        //_timeLabel.backgroundColor = [UIColor RandomColor];
        
        _timeLabel.font            = [UIFont systemFontOfSize:15.0f];
        _timeLabel.text            = @"2016.09.28 10:30";
        [self.contentView addSubview:_timeLabel];
        [_timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_nameLabel.mas_left);
            make.top.equalTo(_nameLabel.mas_bottom).offset(2);
            make.height.mas_equalTo(21.f);
            make.right.equalTo(self.contentView.mas_right).offset(-8);
        }];

        //内容
        _contentLabel                 = [[YYLabel alloc]init];
        _contentLabel.numberOfLines   = 0;
        _contentLabel.preferredMaxLayoutWidth = self.contentView.width-16;
      //  _contentLabel.backgroundColor = [UIColor RandomColor];
        _contentLabel.font            = [UIFont systemFontOfSize:17.0f];
        _contentLabel.text            = @"简单测试一下";
        [self.contentView addSubview:_contentLabel];
        [_contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_avactorImageView.mas_bottom).offset(5);
            make.left.mas_equalTo(8);
            make.right.equalTo(self.contentView.mas_right).offset(-8);
        }];
        
        //图片
        _gridView = [MACImageGroupView new];
       // _gridView.backgroundColor = [UIColor RandomColor];
        [self.contentView addSubview:_gridView];
        [_gridView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_contentLabel.mas_bottom);
            make.left.mas_equalTo(8);
            make.right.equalTo(self.contentView.mas_right).offset(-8);
        }];

      
        //评论
        _addCommentBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_addCommentBtn setTitle:@"评论" forState:UIControlStateNormal];
        //_addCommentBtn.tintColor = [UIColor RandomColor];
        _addCommentBtn.backgroundColor = [UIColor RandomColor];
        [self.contentView addSubview:_addCommentBtn];
        [_addCommentBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_gridView.mas_bottom).offset(5);
            make.right.equalTo(self.contentView.mas_right).offset(-8);
            make.height.width.mas_equalTo(44);
        }];

        //点赞
        _addGoodBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_addGoodBtn setTitle:@"点赞" forState:UIControlStateNormal];
       // _addGoodBtn.tintColor = [UIColor RandomColor];
        _addGoodBtn.backgroundColor = [UIColor RandomColor];

        [self.contentView addSubview:_addGoodBtn];
        [_addGoodBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_addCommentBtn.mas_top);
            make.right.equalTo(_addCommentBtn.mas_left).offset(-8);
            make.height.width.mas_equalTo(44);
        }];
        //浏览量
        _browserNumLabel                 = [[UILabel alloc]init];
        _browserNumLabel.numberOfLines   = 1;
        //_browserNumLabel.backgroundColor = [UIColor RandomColor];
        _browserNumLabel.text            = @"66次浏览";
        _browserNumLabel.font            = [UIFont systemFontOfSize:15.0f];
        
        [self.contentView addSubview:_browserNumLabel];
        [_browserNumLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_addCommentBtn.mas_top);
            make.left.mas_equalTo(8.0);
            make.height.mas_equalTo(44.0);
            make.right.mas_equalTo(_addGoodBtn.mas_left).offset(-8);
        }];

       //点赞数量
        _goodNumLabel                 = [[UILabel alloc]init];
        _goodNumLabel.numberOfLines   = 1;
       // _goodNumLabel.backgroundColor = [UIColor RandomColor];
        _goodNumLabel.text            = @"66人点赞";
        _goodNumLabel.font            = [UIFont systemFontOfSize:15.0f];
        
        [self.contentView addSubview:_goodNumLabel];
        [_goodNumLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_browserNumLabel.mas_bottom).offset(5);
            make.left.mas_equalTo(8.0);
            make.height.mas_equalTo(21.0);
            make.right.equalTo(self.contentView.mas_right).offset(-8);
            make.bottom.equalTo(self.contentView.mas_bottom).offset(-8);
        }];
        //评论列表
    }
    return self;
}
-(void)setModel:(FriendsMessageModel *)model{
    _model                = model;
    _browserNumLabel.text = @"66次浏览";
    _contentLabel.text    = @"简单聊点什么呢,发生大股东嘎嘎的个区文工团去玩儿去问发搜噶搜噶搜噶傻吊噶啥的噶去等噶嘎嘎发噶发噶发嘎多发生的";
    _goodNumLabel.text    = @"66人点赞";
    _gridView.dataSource  = @[@"http://img4.imgtn.bdimg.com/it/u=625004603,817273667&fm=11&gp=0.jpg",
                             @"http://img6n.soufunimg.com/agents/2016_08/07/M02/09/06/wKgEUFem6FKIYzINAAB3D_rQ-MAAAOGfgCie9YAAHcn210.jpg",
                             @"http://pic1.882668.com.160cha.com/882668/2016/09/18/121526458.jpg"];
    
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
