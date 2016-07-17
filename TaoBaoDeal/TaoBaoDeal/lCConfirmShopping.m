//
//  lCConfirmShopping.m
//  TaoBaoDeal
//
//  Created by issuser on 16/7/17.
//  Copyright © 2016年 WeijieLi. All rights reserved.
//

#import "lCConfirmShopping.h"

@interface lCConfirmShopping()

@property (nonatomic,retain) UIView *coverView;

@end

@implementation lCConfirmShopping

static lCConfirmShopping *manger =nil;

+ (instancetype)shareManager{
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            if (manger == nil) {
                manger = [[self alloc]init];
            }
        });
        return manger;
    
}

- (void)pushMessageCartView:(UIView *)cartView superview:(UIView *)superView{    
    CGRect rect = cartView.frame;
    rect.origin.y = [UIScreen mainScreen].bounds.size.height / 2;
    self.coverView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    self.coverView.backgroundColor = [UIColor blackColor];
    self.coverView.alpha = 0.0;  //透明视图，
    self.coverView.tag = 01;
    [superView addSubview:self.coverView];
    
    //动画
    [UIView animateWithDuration:0.3 animations:^{
        self.coverView.alpha = 0.5;
        superView.layer.transform = [self firstTran];
    }completion:^(BOOL finished) {
        [UIView animateWithDuration:0.2 animations:^{
            superView.layer.transform = [self secondTran];
        }];
        
    }];
    
    [UIView animateWithDuration:0.3 animations:^{
        
        cartView.frame = rect;
        //windows视图添加
        [[UIApplication sharedApplication].windows[0] addSubview:cartView];
    }];

}

- (CATransform3D)firstTran{
    CATransform3D transform =CATransform3DIdentity;//获取一个标准默认的CATransform3D仿射变换矩阵
    //transform = CATransform3DMakeRotation(0.4, 1, 0, 0);
    transform = CATransform3DRotate(transform,0.4,0,0,0);//获取旋转angle角度后的rotation矩阵。
    //transform.m24 = -1/2000;
    transform = CATransform3DScale(transform, 0.9, 0.9, 1);
    return transform;
    
}

- (CATransform3D)secondTran{
    CATransform3D transform =CATransform3DIdentity;//获取一个标准默认的CATransform3D仿射变换矩阵
    
    //x轴偏移0 往下为正数，，y偏移 右正，，z偏移 外正
    transform = CATransform3DTranslate(transform, 0, [UIScreen mainScreen].bounds.size.height * (-0.08), 0);
    
    transform = CATransform3DScale(transform, 0.8, 0.8, 1); //x,y轴缩放0，8.。。z缩放1
    return transform;
}

- (void)dismissMessageCart:(UIView *)cartView superView:(UIView *)superView{
    CGRect rect = cartView.frame;
    rect.origin.y = [UIScreen mainScreen].bounds.size.height;
    [UIView animateWithDuration:0.3 animations:^{
        superView.layer.transform = [self firstTran];
        
        self.coverView.alpha = 0.0;
        
        
    }completion:^(BOOL finished) {
        [UIView animateWithDuration:0.2 animations:^{
            //[self.cartView removeFromSuperview];
            superView.layer.transform = CATransform3DIdentity; //回复原状
            
        }];
        
    }];
    
    [UIView animateWithDuration:0.6 animations:^{
        cartView.frame = rect;
        
    }completion:^(BOOL finished) {
        [cartView removeFromSuperview];
    }];

}
















@end








