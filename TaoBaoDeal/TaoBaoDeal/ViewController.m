//
//  ViewController.m
//  TaoBaoDeal
//
//  Created by issuser on 16/7/17.
//  Copyright © 2016年 WeijieLi. All rights reserved.
//

#import "ViewController.h"
#import "lCConfirmShopping.h"

@interface ViewController ()

@property (nonatomic,retain) UIView *cartView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.cartView = [[UIView alloc]initWithFrame:CGRectMake(0,self.view.frame.size.height,self.view.frame.size.width, self.view.frame.size.height/2)];
    self.cartView.backgroundColor = [UIColor cyanColor];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)Push:(id)sender {
    [[lCConfirmShopping shareManager]pushMessageCartView:self.cartView superview:self.view];
    
//    CGRect rect = self.cartView.frame;
//    rect.origin.y = [UIScreen mainScreen].bounds.size.height / 2;
//    self.maskView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
//    self.maskView.backgroundColor = [UIColor blackColor];
//    self.maskView.alpha = 0.0;  //透明视图，
//    [self.view addSubview:self.maskView];
//
//    //动画
//    [UIView animateWithDuration:0.3 animations:^{
//        self.maskView.alpha = 0.5;
//        self.view.layer.transform = [self firstTran];
//    }completion:^(BOOL finished) {
//        [UIView animateWithDuration:0.2 animations:^{
//            self.view.layer.transform = [self secondTran];
//        }];
//
//    }];
//    
//    [UIView animateWithDuration:0.3 animations:^{
//      
//        self.cartView.frame = rect;
//        //windows视图添加
//        [[UIApplication sharedApplication].windows[0] addSubview:self.cartView];
//    }];
//    

    
}

//- (CATransform3D)firstTran{
//   CATransform3D transform =CATransform3DIdentity;//获取一个标准默认的CATransform3D仿射变换矩阵
//    //transform = CATransform3DMakeRotation(0.4, 1, 0, 0);
//    transform = CATransform3DRotate(transform,0.4,0,0,0);//获取旋转angle角度后的rotation矩阵。
//    //transform.m24 = -1/2000;
//    transform = CATransform3DScale(transform, 0.9, 0.9, 1);
//    return transform;
//
//}
//
//- (CATransform3D)secondTran{
//    CATransform3D transform =CATransform3DIdentity;//获取一个标准默认的CATransform3D仿射变换矩阵
//    
//    //x轴偏移0 往下为正数，，y偏移 右正，，z偏移 外正
//    transform = CATransform3DTranslate(transform, 0, self.view.frame.size.height * (-0.08), 0);
//    
//    
//    transform = CATransform3DScale(transform, 0.8, 0.8, 1); //x,y轴缩放0，8.。。z缩放1
//    return transform;
//}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [[lCConfirmShopping shareManager]dismissMessageCart:self.cartView superView:self.view];
//    CGRect rect = self.cartView.frame;
//    rect.origin.y = [UIScreen mainScreen].bounds.size.height;
//    [UIView animateWithDuration:0.3 animations:^{
//        self.view.layer.transform = [self firstTran];
//       
//        self.maskView.alpha = 0.0;
//       
//       
//    }completion:^(BOOL finished) {
//        [UIView animateWithDuration:0.2 animations:^{
//            //[self.cartView removeFromSuperview];
//        self.view.layer.transform = CATransform3DIdentity; //回复原状
//            
//        }];
//
//    }];
//    
//    [UIView animateWithDuration:0.6 animations:^{
//         self.cartView.frame = rect;
//        
//    }completion:^(BOOL finished) {
//        [self.cartView removeFromSuperview];
//    }];
}

@end













































