//
//  Sticky.m
//  Stickies
//
//  Created by Dhruv on 21/11/15.
//  Copyright (c) 2015 whynoceros. All rights reserved.
//

#import "Sticky.h"


@implementation Sticky

@synthesize bgView = _bgView;

- (IBAction)mute{

    self.alpha = .25;

}

- (IBAction)delete{
    
    //Simple Animation
    
//    [UIView animateWithDuration:1.0 delay:0.0 options:UIViewAnimationOptionAutoreverse | UIViewAnimationOptionRepeat animations:^{
//    
//        self.transform = CGAffineTransformMakeRotation(0.5);
//    } completion:nil];
    
    // Swing
    CGPoint current = CGPointMake(self.frame.origin.x, self.frame.origin.y);
    [self.layer setAnchorPoint:CGPointMake(0, 0)];
    self.layer.position = current;
    
    CABasicAnimation *swing = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    swing.fromValue = [NSNumber numberWithInt:0];
    swing.toValue = [NSNumber numberWithInt: 1.5];
    swing.duration = 1.5;
    swing.autoreverses = YES;
    swing.repeatCount = 3;
    swing.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    [self.layer addAnimation:swing forKey:@"rotation"];
    
    // After swing remove form the superView
    
    CGPoint dropTo = CGPointMake(self.frame.origin.x, self.superview.frame.size.height);
    CABasicAnimation *drop = [CABasicAnimation animationWithKeyPath:@"position"];
    drop.fromValue = [NSValue valueWithCGPoint:current];
    drop.toValue = [NSValue valueWithCGPoint:dropTo];
    drop.duration = 3.0;
    drop.beginTime = CACurrentMediaTime()+3.5;
    [self.layer addAnimation:drop forKey:@"position"];
    [self performSelector:@selector(removeFromSuperview) withObject:nil afterDelay:6.5];
    
    
}

- (IBAction)flag{
    
//
//    UIImageView *flagView = [[UIImageView alloc]initWithFrame:CGRectMake(25, 15, 40, 40)];
//    [flagView setImage:[UIImage imageNamed:@"bombIcon"]];
//    [self addSubview:flagView];
    
    // Animation
    //Text
    CATextLayer *flagLayer = [CATextLayer layer];
    flagLayer.position = CGPointMake(25, 20);
    flagLayer.bounds = CGRectMake(0, 0, 30, 30);
    flagLayer.backgroundColor = [[UIColor redColor]CGColor];
    flagLayer.string = @"!";
    flagLayer.fontSize = 24;
    flagLayer.alignmentMode = @"center";
    [self.bgView.layer addSublayer:flagLayer];
    
    // Animation
    CABasicAnimation *pulse = [CABasicAnimation animationWithKeyPath:@"opacity"];
    pulse.fromValue = [NSNumber numberWithInt:1];
    pulse.toValue = [NSNumber numberWithInt:.2];
    pulse.duration = 1.0;
    pulse.autoreverses = YES;
    pulse.repeatCount = HUGE_VAL;
    [flagLayer addAnimation:pulse forKey:@"opacity"];
    
    
    
}


- (IBAction)upgrade{
    
    //Before
    
//    CGPoint from                    = self.center;
//    CGPoint to                      = CGPointMake(750, 584);//Plug for simplicity
//    self.layer.position             = to;
//    CABasicAnimation *slide         = [CABasicAnimation animationWithKeyPath:@"position"];
//    slide.fromValue                 = [NSValue valueWithCGPoint:from];
//    slide.toValue                   = [NSValue valueWithCGPoint:to];
//    slide.duration                  = 2.0;
//    [self.layer addAnimation:slide forKey:@"position"];
    
    // After the KeyFrame - it
    CGPoint from = self.center;
    CGPoint corner = CGPointMake(750, self.center.y);
    CGPoint to = CGPointMake(750, 584);
    self.layer.position = to;
    CAKeyframeAnimation *rightTurn = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    [rightTurn setValues:[NSArray arrayWithObjects:[NSValue valueWithCGPoint:from],[NSValue valueWithCGPoint:corner],[NSValue valueWithCGPoint:to], nil]];
    rightTurn.duration = 2.0;
    [self.layer addAnimation:rightTurn forKey:@"position"];
     
    

}


@end
