//
//  lCConfirmShopping.h
//  TaoBaoDeal
//
//  Created by issuser on 16/7/17.
//  Copyright © 2016年 WeijieLi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface lCConfirmShopping : NSObject

+ (instancetype)shareManager;

- (void)pushMessageCartView:(UIView *)cartView superview:(UIView *)superView;

- (void)dismissMessageCart:(UIView *)cartView superView:(UIView *)superView;

@end
