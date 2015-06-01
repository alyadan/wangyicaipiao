//
//  turnTableView.m
//  wangyicaipiao
//
//  Created by alyadan on 15/5/31.
//  Copyright (c) 2015年 alyadan. All rights reserved.
//

#import "TurnTableView.h"
#import "AstrologyButton.h"

@interface TurnTableView(){
@private
    UIButton *selectedBtn;
    CADisplayLink *link;
}
@property (weak, nonatomic) IBOutlet UIImageView *midLayout;
@end

@implementation TurnTableView

+(instancetype)turnTableView
{
    return  [[[NSBundle mainBundle] loadNibNamed:@"TurnTableView" owner:nil options:nil] lastObject];
}

-(void)awakeFromNib
{
    //load the big image
    UIImage *bigImage = [UIImage imageNamed:@"LuckyAstrology"];
    UIImage *bigImagePressed  = [UIImage imageNamed:@"LuckyAstrologyPressed"];
    NSLog(@"%f",[UIScreen mainScreen].scale);
    // add 12 button
    for(int i = 0; i < 12 ; i++){
        UIButton *btn = [AstrologyButton buttonWithType:UIButtonTypeCustom];
        btn.tag = i;
        //select smallImage
        CGImageRef smallImage = CGImageCreateWithImageInRect(bigImage.CGImage, CGRectMake(i * bigImage.size.width / 6, 0, bigImage.size.width/6, bigImage.size.height*2));
    	[btn setImage:[UIImage imageWithCGImage:smallImage] forState:UIControlStateNormal];
        smallImage = CGImageCreateWithImageInRect(bigImagePressed.CGImage, CGRectMake(i * bigImage.size.width / 6, 0, bigImage.size.width/6, bigImage.size.height*2));
    	[btn setImage:[UIImage imageWithCGImage:smallImage] forState:UIControlStateSelected];
        [btn setBackgroundImage:[UIImage imageNamed:@"LuckyRototeSelected"] forState:UIControlStateSelected];
        
        btn.frame = CGRectMake(0, 0, 68, 143);
        
        //set the anchorPoint
        btn.layer.anchorPoint = CGPointMake(0.5, 1);
        btn.layer.position = self.midLayout.center;
        
        //set rotation
        [btn.layer setAffineTransform:CGAffineTransformMakeRotation((M_PI) / 6 * i)];
        [self.midLayout addSubview:btn];
        
        [btn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchDown];
        
        if(i == 0){
            [self clickBtn:btn];
        }
    }
}

-(void)clickBtn:(UIButton *)btn
{
    if (btn == selectedBtn) {
        return;
    }
    selectedBtn.selected = NO;
    btn.selected = YES;
    selectedBtn = btn;
}
/**
 use the CoreAnimation
 */
- (IBAction)startChoose{
    [self stopRotation];

//    fixAngle = (angleSum + (selectedBtn.tag - rollTag) * (M_PI / 6));
//    int i = 1;
//    while(i){
//        if (fixAngle > 2*M_PI) {
//            fixAngle -= 2*M_PI;
//            continue;
//        }else if(fixAngle < 0){
//            fixAngle += 2*M_PI;
//            continue;
//        }
//        i = 0;
//    }
    
    CABasicAnimation *anim = [CABasicAnimation animation];
    anim.keyPath = @"transform.rotation";
    anim.toValue = @((8 * 2*M_PI) - (selectedBtn.tag * M_PI / 6));
    anim.duration = 3;
    anim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    anim.delegate = self;
    
    [self.midLayout.layer addAnimation:anim forKey:nil];
    self.userInteractionEnabled = NO;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
	    self.midLayout.transform = CGAffineTransformMakeRotation(2*M_PI - (selectedBtn.tag * M_PI / 6));
    });
}
//
-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
 
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self startRotating];
        self.userInteractionEnabled = YES;
    });
}

-(void)startRotating
{
///**
//	CoreAnimation
//*/
//    CABasicAnimation *anim  = [CABasicAnimation animation];
//    anim.keyPath = @"transform.rotation";
//    anim.toValue = @(2*M_PI);
//    anim.duration = 5;
//    anim.repeatCount = MAXFLOAT;
//    [self.midLayout.layer addAnimation:anim forKey:nil];
//    fixAngle = (angleSum + (selectedBtn.tag - rollTag) * (M_PI / 6));

    if (link) {
        return;
    }

    link = [CADisplayLink displayLinkWithTarget:self selector:@selector(update)];
    [link addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
}


-(void)stopRotation
{
    [link invalidate];
    link = nil;
}

-(void)update
{
   	static double angle = M_PI/(60*5);
    self.midLayout.transform = CGAffineTransformRotate(self.midLayout.transform,angle);
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
