//
//  ViewController.m
//  WWDCAutoLayout
//
//  Created by 张晓珊 on 2018/8/3.
//  Copyright © 2018年 张晓珊. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) UILabel *label1;
@property (nonatomic, strong) UIButton *button1;

@property (nonatomic, strong) UILabel *label2;

@property (nonatomic, strong) UIStackView *stackView;

@property (nonatomic, strong) UILabel *label3;
@property (nonatomic, strong) UILabel *label4;
@property (nonatomic, strong) UILabel *label5;

@property (nonatomic, strong) UIImageView *image;
@property (nonatomic, strong) UILabel *label6;

@property (nonatomic, strong) UILabel *label7;
@property (nonatomic, strong) UILabel *label8;

@end

@implementation ViewController

- (void)loadView {
    [super loadView];
    self.view.backgroundColor = [UIColor whiteColor];
//    [self setUpUI];
//    [self setUpStackView];
//    [self setUpConstrainingNegativeSpace];
    [self setUpContentPriorities];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)setUpUI {
    [self.view addSubview:self.label1];
    [self.view addSubview:self.button1];
    [self.view addSubview:self.label2];
    
    NSLayoutConstraint *label1CenterY = [NSLayoutConstraint constraintWithItem:self.label1 attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1 constant:0];
    NSLayoutConstraint *label1ConterX = [NSLayoutConstraint constraintWithItem:self.label1 attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1 constant:0];
    
    NSLayoutConstraint *button1Right = [self.button1.rightAnchor constraintEqualToAnchor:self.view.rightAnchor constant:-10];
    NSLayoutConstraint *button1CenterY = [self.button1.centerYAnchor constraintEqualToAnchor:self.view.centerYAnchor constant:0];
    
    NSArray<NSLayoutConstraint *> *label2XConstraint = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[label2]-|" options:0 metrics:nil views:@{@"label2": self.label2}];
    
    [NSLayoutConstraint activateConstraints:@[label1CenterY, label1ConterX, button1Right, button1CenterY]];
    [NSLayoutConstraint activateConstraints:label2XConstraint];
    
    [self.view addConstraint:label1CenterY];
}

- (void)setUpStackView {
     self.view.backgroundColor = [UIColor blackColor];
    [self.view addSubview:self.stackView];
    
    NSLayoutConstraint *stackViewCenterY = [self.stackView.centerYAnchor constraintEqualToAnchor:self.view.centerYAnchor];
    NSLayoutConstraint *stackViewCenterX = [self.stackView.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor];
//    NSLayoutConstraint *stackViewWidth = [self.stackView.widthAnchor constraintEqualToConstant:64];
//    NSLayoutConstraint *stackViewHeight = [self.stackView.heightAnchor constraintEqualToConstant:192];
    
    [NSLayoutConstraint activateConstraints:@[stackViewCenterX, stackViewCenterY]];
}

- (void)setUpConstrainingNegativeSpace {
    
    UILayoutGuide *guide1 = [UILayoutGuide new];
    UILayoutGuide *guide2 = [UILayoutGuide new];
    UILayoutGuide *guide3 = [UILayoutGuide new];
    [self.view addSubview:self.label3];
    [self.view addSubview:self.label4];
    [self.view addSubview:self.label5];
    [self.view addSubview:self.label6];
    [self.view addSubview:self.image];
    [self.view addLayoutGuide:guide1];
    [self.view addLayoutGuide:guide2];
    [self.view addLayoutGuide:guide3];
    
    NSDictionary *views = @{@"label3": self.label3, @"label4": self.label4, @"label5": self.label5, @"guide1": guide1, @"guide2": guide2, @"label6": self.label6, @"guide3": guide3, @"image": self.image};;
    
    NSArray *constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[label3(50)]-[guide1(==guide2)]-[label4(50)]-[guide2]-[label5(50)]-20-|" options:0 metrics:nil views:views];
    NSLayoutConstraint *label3Top = [self.label3.topAnchor constraintEqualToAnchor:self.view.topAnchor constant:100];
    NSLayoutConstraint *label4Top = [self.label4.topAnchor constraintEqualToAnchor:self.label3.topAnchor];
    NSLayoutConstraint *label5Top = [self.label5.topAnchor constraintEqualToAnchor:self.label3.topAnchor];
    
    NSLayoutConstraint *guide3CenterX = [guide3.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor];
    NSLayoutConstraint *guide3CenterY = [guide3.centerYAnchor constraintEqualToAnchor:self.view.centerYAnchor];
    NSLayoutConstraint *imageTop = [self.image.topAnchor constraintEqualToAnchor:guide3.topAnchor];
    NSLayoutConstraint *imageCenterX = [self.image.centerXAnchor constraintEqualToAnchor:guide3.centerXAnchor];
    NSLayoutConstraint *label6Bottom = [self.label6.bottomAnchor constraintEqualToAnchor:guide3.bottomAnchor];
    NSLayoutConstraint *label6CenterX = [self.label6.centerXAnchor constraintEqualToAnchor:guide3.centerXAnchor];
    NSLayoutConstraint *label6Top = [self.label6.topAnchor constraintEqualToAnchor:self.image.bottomAnchor];
    
    [NSLayoutConstraint activateConstraints:constraints];
    [NSLayoutConstraint activateConstraints:@[label3Top, label5Top, label4Top, imageTop, imageCenterX, label6CenterX, label6Bottom, guide3CenterX, guide3CenterY, label6Top]];
    
}

- (void)setUpContentPriorities {
    [self.view addSubview:self.label7];
    [self.view addSubview:self.label8];
    
    NSArray *array = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[label7]-[label8]-|" options:0 metrics:nil views:@{@"label7" : self.label7, @"label8" : self.label8}];
    NSLayoutConstraint *label7CenterY = [self.label7.centerYAnchor constraintEqualToAnchor:self.view.centerYAnchor];
    NSLayoutConstraint *label8CenterY = [self.label8.centerYAnchor constraintEqualToAnchor:self.view.centerYAnchor];
    
    [NSLayoutConstraint activateConstraints:@[label7CenterY, label8CenterY]];
    [NSLayoutConstraint activateConstraints:array];
    
}

#pragma mark - 懒加载
- (UILabel *)label1 {
    if (!_label1) {
        UILabel *label = [UILabel new];
        label.text = @"这是一个UILabel";
        label.translatesAutoresizingMaskIntoConstraints = NO;
        _label1 = label;
    }
    return _label1;
}

- (UIButton *)button1 {
    
    if (!_button1) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
        [button setTitle:@"点我呀" forState:UIControlStateNormal];
        button.translatesAutoresizingMaskIntoConstraints = NO;
        _button1 = button;
    }
    
    return _button1;
}

- (UILabel *)label2 {
    if (!_label2) {
        UILabel *label = [UILabel new];
        label.text = @"这是一个使用VFL的UILabel";
        label.translatesAutoresizingMaskIntoConstraints = NO;
        _label2 = label;
    }
    return _label2;
}

- (UIStackView *)stackView {
    if (!_stackView) {
        UIStackView *stackView = [UIStackView new];
        stackView.translatesAutoresizingMaskIntoConstraints = NO;
        stackView.axis = UILayoutConstraintAxisVertical;
        stackView.spacing = 10;
        stackView.alignment = UIStackViewAlignmentCenter;
        stackView.distribution = UIStackViewDistributionEqualSpacing;
        UIImageView *image1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"apple_48"]];
        UIImageView *image2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"apple_88"]];
        UIImageView *image3 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"apple_128"]];
        [stackView addArrangedSubview:image1];
        [stackView addArrangedSubview:image2];
        [stackView addArrangedSubview:image3];
        _stackView = stackView;
    }
    return _stackView;
}

- (UILabel *)label3 {
    if (!_label3) {
        UILabel *label = [UILabel new];
        label.text = @"Foo";
        label.textAlignment = NSTextAlignmentCenter;
        label.backgroundColor = [UIColor lightGrayColor];
        label.translatesAutoresizingMaskIntoConstraints = NO;
        _label3 = label;
    }
    return _label3;
}

- (UILabel *)label4 {
    if (!_label4) {
        UILabel *label = [UILabel new];
        label.text = @"Bar";
        label.textAlignment = NSTextAlignmentCenter;
        label.backgroundColor = [UIColor lightGrayColor];
        label.translatesAutoresizingMaskIntoConstraints = NO;
        _label4 = label;
    }
    return _label4;
}

- (UILabel *)label5 {
    if (!_label5) {
        UILabel *label = [UILabel new];
        label.text = @"Baz";
        label.textAlignment = NSTextAlignmentCenter;
        label.backgroundColor = [UIColor lightGrayColor];
        label.translatesAutoresizingMaskIntoConstraints = NO;
        _label5 = label;
    }
    return _label5;
}

- (UIImageView *)image {
    if (!_image) {
        UIImageView *image = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"setting"]];
        image.translatesAutoresizingMaskIntoConstraints = NO;
        _image = image;
    }
    return _image;
}

- (UILabel *)label6 {
    if (!_label6) {
        UILabel *label = [UILabel new];
        label.text = @"Configuration\nConfiguration\nConfiguration\nConfiguration";
        label.numberOfLines = 0;
        label.backgroundColor = [UIColor yellowColor];
        label.textAlignment = NSTextAlignmentCenter;
        label.translatesAutoresizingMaskIntoConstraints = NO;
        _label6 = label;
    }
    return _label6;
}

- (UILabel *)label7 {
    if (!_label7) {
        UILabel *label = [UILabel new];
        label.text = @"这是演示内容优先级的左边的label";
//        label.numberOfLines = 0;
        label.textAlignment = NSTextAlignmentLeft;
        label.translatesAutoresizingMaskIntoConstraints = NO;
        _label7 = label;
    }
    return _label7;
}

- (UILabel *)label8 {
    if (!_label8) {
        UILabel *label = [UILabel new];
        label.text = @"这是演示内容优先级的右边的label";
//        label.numberOfLines = 0;
        label.backgroundColor = [UIColor grayColor];
        label.textAlignment = NSTextAlignmentRight;
        label.translatesAutoresizingMaskIntoConstraints = NO;
        _label8 = label;
    }
    return _label8;
}


@end
