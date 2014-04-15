//
//  TAGameViewController.m
//  WWDC
//
//  Created by Tosin Afolabi on 14/04/2014.
//  Copyright (c) 2014 Tosin Afolabi. All rights reserved.
//

#import "TAGameViewController.h"

@interface TAGameViewController ()

@property (strong, nonatomic) TAGameScene* scene;

@end

@implementation TAGameViewController

- (instancetype)init
{
    self = [super init];

    if (self) {
        SKView *skView = [SKView new];
        self.view = skView;
    }

    return self;
}

- (void)viewWillAppear:(BOOL)animated
{
    [[UIApplication sharedApplication] setStatusBarHidden:YES];
    [self.navigationController setNavigationBarHidden:YES];
}

- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];

    [self.view setBackgroundColor:[UIColor blackColor]];

    // Configure the view.
    SKView * skView = (SKView *)self.view;
    //skView.showsFPS = YES;
    //skView.showsNodeCount = YES;
    //skView.showsDrawCount = YES;
    //skView.backgroundColor = [SKColor blackColor];

    // Create and configure the scene.
    self.scene = [TAGameScene sceneWithSize:skView.bounds.size];
    self.scene.scaleMode = SKSceneScaleModeResizeFill;

    // Present the scene.
    [skView presentScene:self.scene];
}

- (BOOL)shouldAutorotate
{
    return YES;
}

- (NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskLandscape;
}

@end
