//
//  ZJSZoomView.m
//  ZJS_ViewZoom
//
//  Created by 周建顺 on 15/12/24.
//  Copyright © 2015年 周建顺. All rights reserved.
//

#import "ZJSZoomView.h"

static  void *content2 = &content2;
static  void *content1 = &content1;

@interface ZJSZoomView ()<UIScrollViewDelegate>

@property (nonatomic,strong) UIScrollView *scrollView;
@property (nonatomic,strong) UIView *contentView;
@property (nonatomic,strong) UIImageView *imageView;


@property (nonatomic,strong) UIButton *button1;
@property (nonatomic,strong) UIButton *button2;

@end

@implementation ZJSZoomView

-(instancetype)init{
    self = [super init];
    if (self) {
        [self setup];
    }
    return self;
}

//-(instancetype)initWithFrame:(CGRect)frame{
//    self = [super initWithFrame:frame];
//    if (self) {
//        [self setup];
//    }
//    return self;
//}


-(void)setup{
    _scrollView = [[UIScrollView alloc] init];
    _scrollView.delegate = self;
    _scrollView.maximumZoomScale = 4.f;
    _scrollView.minimumZoomScale = 1.f;
    [self addSubview:_scrollView];
    
    _contentView = [[UIView alloc] init];
    _contentView.backgroundColor = [UIColor redColor];
    [_scrollView addSubview:_contentView];
    
    _imageView = [[UIImageView alloc] init];
    _imageView.backgroundColor = [UIColor greenColor];
    UIImage *image = [UIImage imageNamed:@"image2.jpg"];
    _imageView.image = image;
    [_contentView addSubview:_imageView];
    

    UISwipeGestureRecognizer *left = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(left:)];
    left.direction = UISwipeGestureRecognizerDirectionLeft;
    [self.contentView addGestureRecognizer:left];
    
    UISwipeGestureRecognizer *right = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(right:)];
    right.direction = UISwipeGestureRecognizerDirectionRight;
    [self.contentView addGestureRecognizer:right];
    
    // 单点手势
    UITapGestureRecognizer *singleRecognizerContentview;
    singleRecognizerContentview = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(singelTapMark:)];
   // singleRecognizerContentview.delegate = self;
    [self.contentView addGestureRecognizer:singleRecognizerContentview];
    
    NSLog(@"setup");
    [_scrollView addObserver:self forKeyPath:@"contentSize" options:NSKeyValueObservingOptionNew context:content1];

    
    _button1 = [UIButton buttonWithType:UIButtonTypeContactAdd];
    _button1.backgroundColor = [UIColor purpleColor];
    [_scrollView addSubview:_button1];
    _button2 = [UIButton buttonWithType:UIButtonTypeInfoDark];
    [_scrollView addSubview:_button2];
}


-(void)dealloc{
    [_scrollView removeObserver:self forKeyPath:@"contentSize" context:content1];
}





-(void)layoutSubviews{
    //[super layoutSubviews];
    _scrollView.frame = self.bounds;
    _contentView.frame = _scrollView.bounds;
    _scrollView.contentSize = _contentView.bounds.size ;
    _imageView.frame = _contentView.bounds;
    
    _button1.frame = CGRectMake(100, 100, 50, 50);
    _button1.center = CGPointMake(100, 100);
    _button2.frame = CGRectMake(100, 200, 50, 50);
     _button2.center = CGPointMake(100, 200);
    
    _button2.center = [self convertPoint:CGPointMake(100, 200)];
    _button1.center =  [self convertPoint:CGPointMake(100, 100)];

//    _scrollView.contentScaleFactor = 1.f;
}

-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
    return self.contentView;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if (context == content2) {
        
        NSLog(@"%@",change);
        //NSLog(@"%@",_imageView);
    } else if(context == content1){
        NSLog(@"%@",change);
        
        _button2.center = [self convertPoint:CGPointMake(100, 200)];
        _button1.center =  [self convertPoint:CGPointMake(100, 100)];
        
    }else {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}

-(CGPoint)convertPoint:(CGPoint)point{
   
    CGPoint newPoint = [self.contentView convertPoint:point toView:self.scrollView];
    return newPoint;
}

-(void)left:(UISwipeGestureRecognizer *)gesture{
    NSLog(@"left");
    UIImage *image = [UIImage imageNamed:@"image2.jpg"];
    _imageView.image = image;
}

-(void)right:(UISwipeGestureRecognizer *)gesture{
    NSLog(@"right");
    UIImage *image = [UIImage imageNamed:@"image1.jpg"];
    _imageView.image = image;
}

-(void)singelTapMark:(UITapGestureRecognizer *)gesture{
    NSLog(@"tap");
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
