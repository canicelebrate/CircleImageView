//
//  CircleImageView.m
//  CircleImageView
//
//  Created by César Vilera on 8/26/15.
//  Copyright (c) 2015 18Feats. All rights reserved.
//

#import "CircleImageView.h"

@implementation CircleImageView
- (id)initWithFrame:(CGRect)frame backgroundColor:(UIColor *)backgroundColor borderColor:(UIColor *)borderColor borderWidth:(float)borderWidth
{
    self = [super initWithFrame:frame];
    if (self) {
        self.layer.masksToBounds = YES;
        CGPoint saveCenter = self.center;
        CGRect newFrame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, self.frame.size.height);
        self.frame = newFrame;
        self.layer.cornerRadius = self.frame.size.width / 2.0;
        self.center = saveCenter;
        [self.layer setBackgroundColor:(backgroundColor.CGColor)];
        [self.layer setBorderColor:(borderColor.CGColor)];
        [self.layer setBorderWidth:borderWidth];
    }
    return self;
}


-(void)setTextViewWithText:(NSString *)text frame:(CGRect)frame backgroundColor:(UIColor *)backgroundColor textColor:(UIColor *)textColor font:(UIFont *)font {
    UITextView *textview = [[UITextView alloc] initWithFrame:frame];
    [textview setBackgroundColor:backgroundColor];
    [textview setTextColor:textColor];
    [textview setFont:font];
    textview.text = [text uppercaseString];
    [textview sizeToFit];
    [self addCenterView:textview];
}

-(void)setTopText:(NSString *)text backgroundColor:(UIColor *)backgroundColor textColor:(UIColor *)textColor font:(UIFont *)font {
    
    [self setTextViewWithText:text frame:CGRectMake(0, 0, 65, 20) backgroundColor:backgroundColor textColor:textColor font:font];
}

-(void)setBottomText:(NSString *)text backgroundColor:(UIColor *)backgroundColor textColor:(UIColor *)textColor font:(UIFont *)font {
    
    [self setTextViewWithText:(NSString *)text frame:CGRectMake(0, 35, 65, 20)backgroundColor:backgroundColor textColor:textColor font:font];
}

-(void)addCenterView:(UIView *)view {
    [self centerViewHorizontally:view];
    [self addSubview:view];
}

-(void)centerViewHorizontally: (UIView *)view {
    float imageViewWidth = self.frame.size.width/2;
    float viewWidth = view.frame.size.width/2;
    float aux = imageViewWidth - viewWidth;
    
    view.frame = CGRectMake(aux,view.frame.origin.y,view.frame.size.width,view.frame.size.height);
}

-(void)centerViewVertically: (UIView *)view {
    float imageViewHeight = self.frame.size.height/2;
    float viewHeight = view.frame.size.height/2;
    float aux = imageViewHeight - viewHeight;
    
    view.frame = CGRectMake(view.frame.origin.x,aux,view.frame.size.width,view.frame.size.height);
}

@end
