//
//  TAHomeViewController.m
//  WWDC
//
//  Created by Tosin Afolabi on 14/04/2014.
//  Copyright (c) 2014 Tosin Afolabi. All rights reserved.
//

#import "TAHomeViewController.h"
#import "TAProjectViewController.h"
#import "TATransition.h"

@interface TAHomeViewController () <UIViewControllerTransitioningDelegate>

@property (nonatomic, strong) UIImageView *imageView;

@end

@implementation TAHomeViewController

- (void)viewWillAppear:(BOOL)animated
{
    [[UIApplication sharedApplication] setStatusBarHidden:YES];
    [self.navigationController setNavigationBarHidden:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Profile Image

    UIImage *profileImage = [UIImage imageNamed:@"profile"];

    self.imageView = [[UIImageView alloc] initWithImage:profileImage];
    [self.imageView setFrame:CGRectMake(390, 70, profileImage.size.width, profileImage.size.height)];

    [self.imageView setClipsToBounds:YES];
    [[self.imageView layer] setCornerRadius:profileImage.size.width / 2];
    //[[self.imageView layer] setBorderColor:[UIColor colorWithRed:0.173 green:0.243 blue:0.314 alpha:1].CGColor];
    //[[self.imageView layer] setBorderWidth:2.0f];

    UILabel *welcomeLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 20, self.view.bounds.size.height, self.view.bounds.size.width)];
    [welcomeLabel setText:@"Hey, I'm Tosin Afolabi"];
    [welcomeLabel setTextAlignment:NSTextAlignmentCenter];
    [welcomeLabel setFont:[UIFont fontWithName:@"AvenirNext-UltraLight" size:60.0f]];

    UILabel *label2 = [[UILabel alloc] initWithFrame:CGRectMake(0, 100, self.view.bounds.size.height, self.view.bounds.size.width)];
    [label2 setText:@"I'm a iOS & Web Developer with a keen eye for design."];
    [label2 setTextAlignment:NSTextAlignmentCenter];
    [label2 setFont:[UIFont fontWithName:@"AvenirNext-UltraLight" size:30.0f]];

    UILabel *label3 = [[UILabel alloc] initWithFrame:CGRectMake(50, 200, self.view.bounds.size.height - 100, self.view.bounds.size.width)];
    [label3 setText:@"I Love building cool products that are aesthically pleasing & provide a great user experience. I am currently in my junior year at the University of Nottingham "];
    [label3 setTextAlignment:NSTextAlignmentLeft];
    [label3 setNumberOfLines:0];
    [label3 setFont:[UIFont fontWithName:@"AvenirNext-UltraLight" size:30.0f]];

    UIButton *projectButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [projectButton setFrame:CGRectMake(420, 650, 200, 100)];
    [projectButton setTitle:@"View Projects" forState:UIControlStateNormal];

    [projectButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [projectButton setTitleColor:[UIColor blueColor] forState:UIControlStateHighlighted];
    [[projectButton titleLabel] setTextAlignment:NSTextAlignmentCenter];
    [[projectButton titleLabel] setFont:[UIFont fontWithName:@"AvenirNext-Regular" size:25.0f]];

    [projectButton addTarget:self action:@selector(showProjectView) forControlEvents:UIControlEventTouchUpInside];

    [self.view addSubview:projectButton];


    [self.view addSubview:self.imageView];
    [self.view addSubview:welcomeLabel];
    [self.view addSubview:label2];
    [self.view addSubview:label3];
}

- (void)showProjectView
{
    TAProjectViewController *projectVC = [[TAProjectViewController alloc] initWithType:TAProjectTypeCandlePath];
    //projectVC.modalPresentationStyle = UIModalPresentationCustom;
    //projectVC.transitioningDelegate = self;
    //[self.navigationController pushViewController:projectVC animated:YES];
    [self presentViewController:projectVC animated:YES completion:nil];
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    return [[TATransition alloc] init];
}

@end
