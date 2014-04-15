//
//  TAProjectViewController.m
//  WWDC
//
//  Created by Tosin Afolabi on 13/04/2014.
//  Copyright (c) 2014 Tosin Afolabi. All rights reserved.
//

#import "TATransition.h"
#import "TAHomeViewController.h"
#import "TAProjectViewController.h"

#define IMAGE_SIZE_WIDTH 250
#define IMAGE_SIZE_HEIGHT 430

@interface TAProjectViewController () <UIViewControllerTransitioningDelegate>

@property (nonatomic) NSString *projectTitle;
@property (nonatomic) NSString *leftDetailString;
@property (nonatomic) NSString *rightDetailString;
@property (nonatomic) NSArray *otherProjects;
@property (nonatomic) NSMutableArray *screenshots;

@end

@implementation TAProjectViewController

- (instancetype)initWithType:(TAProjectType)type
{
    self = [super init];

    if (self) {

        switch(type) {

            case TAProjectTypeProcuses:
                self.projectTitle = @"PROCUSES";
                self.otherProjects = @[@"THE NEWS", @"GOCODE", @"CANDLE PATH", @"BRICKS"];
                self.leftDetailString = @"Procuses aka Professional Excuses is a humour app that allows you the professional find the right excuse to use in order to procrastinate adding that new feature/requirement at a moments notice.\n\nIt combines excuses from\n\n     Designer Excuses \n     Developer Excuses \n     Account Manager Excuses \n\nKeep Calm & Use Procuses to Procrastinate!";
                self.rightDetailString = @"This was my first iOS app. It helped me get past the learning curve of Objective-C & iOS.\n\nBefore, I had only built terminal applications in Java & Python. Developing Procuses showed me how easy it was to create & distribute beautiful, functional apps on iOS.\n\nRead More at http://bit.ly/1nnfkRN";
                break;

            case TAProjectTypeTheNews:
                self.projectTitle = @"THE NEWS";
                self.otherProjects = @[@"PROCUSES", @"GOCODE", @"CANDLE PATH", @"BRICKS"];
                self.leftDetailString = @"The News is an iOS client that allows you to read Designer News as well as Hacker News. It is a fully featured client for both news sources as it allows the user to view, share, upvote & post articles or comments.\n\nIn order to move between news sources, the user simply swipes across on the navigation bar.\n\nThere are all sorts of supported gestures & deligthful animations in order to deliever a great user experience that feels right at home in iOS 7.";
                self.rightDetailString = @"This is my first large scale iOS app. It has taken 3 months of late nights & many cans of redbull to get to the final stages of development.\n\nI am quite proud of this app as it has allowed to discover numerous parts of the iOS SDK such as Networking, Blocks, GCD, UIView Animation, Custom View Controller Transistions & many more.\n\nIt has also been a challenge to ensure high code quality & reusablity of components. I can't wait for it to hit the AppStore, till then you can play with the current build at https://app.io/V0qqn2";
                break;

            case TAProjectTypeGoCode:
                self.projectTitle = @"GOCODE";
                self.otherProjects = @[@"THE NEWS", @"PROCUSES", @"CANDLE PATH", @"BRICKS"];
                self.leftDetailString = @"GoCode is an iOS app to introducing it's users to the basic concepts of coding. The app is designed to make the learning experience as fun as possible whilst keeping the user engaged at all stages.\n\nMobile is about to surpass desktop in terms of web traffic, as such, it's only fitting we try to get more people coding through this platform. I honestly believe, executed right, it would be a lot easier to get that friend of yours into coding if all they have to do is download an app.\n\nRead more at http://bit.ly/1khMeSj\n\n*Hackathon Project, not yet available in the AppStore.";
                self.rightDetailString = @"GoCode is my most techinally challenging iOS app so far. It all started when I discovered Codecademy's Hour of Code App. This sadly did not allow you to execute any code. Upon hearing about the new Javascript Bridge that comes with iOS 7, I decided to have a go at auctually at building a learn to code app with a built in Javascript Interpreter.\n\nIt's been a very successful experiment that generated some interest on Twitter & Medium as well as from Codecademy. I plan to continue working on the project over the summer as a lot of friends have become really intrested in learning to code. It's what all the cool kids are doing these days.\n";
                break;

            case TAProjectTypeBricks:
                self.projectTitle = @"BRICKS";
                self.otherProjects = @[@"THE NEWS", @"PROCUSES", @"GOCODE", @"CANDLE PATH"];
                self.leftDetailString = @"Bricks is a reinvention of the classsic BrickBreacker with an emphasis on a clean design & challenging gameplay. The game objective is simple, each level you must destroy all bricks but do it in style for those ludicrous high scores!\n\nPlayers can also easily compare how they fare against other players through Game Center. To keep the gameplay intresting over time, we added random challenges at each level that score bonus points if achieved.";
                self.rightDetailString = @"Bricks was co-developed with a friend, Stephen Sowole. I was responsible for the initial prototype & design. This is by far our most succesful app with over 6000 downloads on the AppStore & a five star app review rating.\n\nOur app reached the top 100 in the Puzzle Game Category & was featured in local publications(university newspaper). It's been quite an exciting experience & one of the most fun development projects I had the priviledge to be a part off.";
                break;

            case TAProjectTypeCandlePath:
                self.projectTitle = @"CANDLE PATH";
                self.otherProjects = @[@"THE NEWS", @"PROCUSES", @"GOCODE", @"BRICKS"];
                self.leftDetailString = @"CandlePath is an iOS application that enables anyone to find their way home safely, using open street light data to ensure you stay out of the dark and GPS to keep make sure you stay on route. Using an in-app purchase allows anyone to buy a safe night that ensures your family and security services are notified when you deviate from your path.";
                self.rightDetailString = @"Built by some friends & I during the London Paypal BattleHack Hackathon. The Application won 1st Place at the hackathons & my team got a free trip to San Jose to represent London at the BattleHack World Finals.\n\n*Hackathon Project, not yet available in the AppStore.";
                break;
        }

        // Load Screenshots
        
        NSArray *projectTitles = @[@"Procuses", @"TheNews", @"GoCode", @"Bricks", @"CandlePath"];
        self.screenshots = [[NSMutableArray alloc] init];

        for (int i = 1; i < 5; i++) {
            NSString *imageName = [NSString stringWithFormat:@"%@-%d", projectTitles[type], i];
            UIImage *image = [UIImage imageNamed:imageName];
            [self.screenshots addObject:image];
        }
    }

    return self;
}

- (void)viewWillAppear:(BOOL)animated
{
    [[UIApplication sharedApplication] setStatusBarHidden:YES];
    [self.navigationController setNavigationBarHidden:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];

    [self layoutSubviews];
    [self setupScreenshotsView];
}

- (void)layoutSubviews
{
    // Landscape Orientation

    CGSize screenSize = self.view.bounds.size;
    //CGFloat screenWidth = screenSize.height;
    CGFloat screenHeight = screenSize.width;

    // Resources

    UIImage *deviceMockup = [UIImage imageNamed:@"DeviceOutline"];
    NSDictionary *enumDict = @{@"PROCUSES":@(TAProjectTypeProcuses),
                               @"THE NEWS":@(TAProjectTypeTheNews),
                               @"GOCODE":@(TAProjectTypeGoCode),
                               @"CANDLE PATH":@(TAProjectTypeCandlePath),
                               @"BRICKS":@(TAProjectTypeBricks)};

    // Frames

    CGRect projectTitleFrame = CGRectMake(50, 25, 300, 100);
    CGRect deviceMockupFrame = CGRectMake(370, 75, deviceMockup.size.width, deviceMockup.size.height);
    CGRect projectListBaseFrame = CGRectMake(50, screenHeight - 70, 200, 50);

    // Project Title

    UILabel *projectTitleLabel = [[UILabel alloc] initWithFrame:projectTitleFrame];
    [projectTitleLabel setText:self.projectTitle];
    [projectTitleLabel setTextColor:[UIColor blackColor]];
    [projectTitleLabel setFont:[UIFont fontWithName:@"Avenir-Book" size:40.0f]];


    UIImageView *deviceMockupView = [[UIImageView alloc] initWithImage:deviceMockup];
    [deviceMockupView setFrame:deviceMockupFrame];

    // Project List

    for (NSString *projectStr in self.otherProjects) {

        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setFrame:projectListBaseFrame];
        [button setTitle:projectStr forState:UIControlStateNormal];

        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blueColor] forState:UIControlStateHighlighted];
        [[button titleLabel] setTextAlignment:NSTextAlignmentCenter];
        [[button titleLabel] setFont:[UIFont fontWithName:@"AvenirNext-Regular" size:25.0f]];

        [button setTag:[enumDict[projectStr] intValue]];
        [button addTarget:self action:@selector(projectListButtonClicked:) forControlEvents:UIControlEventTouchUpInside];

        [self.view addSubview:button];

        projectListBaseFrame.origin.x += 250;

    }

    UIButton *homeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [homeButton setFrame:CGRectMake(840, 25, 150, 100)];
    [homeButton setTitle:@"Tosin A&F" forState:UIControlStateNormal];

    [homeButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [homeButton setTitleColor:[UIColor blueColor] forState:UIControlStateHighlighted];
    [[homeButton titleLabel] setTextAlignment:NSTextAlignmentCenter];
    [[homeButton titleLabel] setFont:[UIFont fontWithName:@"Avenir-Book" size:20.0f]];

    //[homeButton addTarget:self action:@selector(homeButtonClicked) forControlEvents:UIControlEventTouchUpInside];

    [self.view addSubview:homeButton];



    // Textviews

    UITextView *leftDetail = [[UITextView alloc] initWithFrame:CGRectMake(80, 250, 250, 320)];
    [leftDetail setBackgroundColor:[UIColor clearColor]];
    [leftDetail setTextAlignment:NSTextAlignmentJustified];
    //[leftDetail setTextColor:[UIColor whiteColor]];
    [leftDetail setText:self.leftDetailString];
    [leftDetail setFont:[UIFont fontWithName:@"Avenir-Book" size:12.0f]];
    [leftDetail setEditable:NO];
    [leftDetail setSelectable:YES];
    [leftDetail setScrollEnabled:NO];

    UITextView *rightDetail = [[UITextView alloc] initWithFrame:CGRectMake(730, 250, 250, 320)];
    [rightDetail setBackgroundColor:[UIColor clearColor]];
    //[rightDetail setTextColor:[UIColor whiteColor]];
    [rightDetail setText:self.rightDetailString];
    [rightDetail setTextAlignment:NSTextAlignmentJustified];
    [rightDetail setFont:[UIFont fontWithName:@"Avenir-Book" size:12.0f]];
    [rightDetail setEditable:NO];
    [rightDetail setSelectable:YES];
    [rightDetail setScrollEnabled:NO];


    [self.view addSubview:leftDetail];
    [self.view addSubview:rightDetail];
    [self.view addSubview:projectTitleLabel];
    [self.view addSubview:deviceMockupView];
}

- (void)homeButtonClicked
{
    //TAHomeViewController *home = [TAHomeViewController new];
    // I should pop & clear the nav stack, but no time sorry


    [UIView animateWithDuration:0.3 animations:^ {
        [self.view setAlpha:0.0];
    }];
    [self.navigationController popViewControllerAnimated:YES];
}


- (void)setupScreenshotsView
{

    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(402, 160, IMAGE_SIZE_WIDTH, IMAGE_SIZE_HEIGHT)];
    [scrollView setBackgroundColor:[UIColor colorWithRed:0.941 green:0.941 blue:0.941 alpha:1]];
    [scrollView setBounces:YES];
    [scrollView setPagingEnabled:YES];
    [scrollView setShowsHorizontalScrollIndicator:NO];
    [scrollView setContentSize:CGSizeMake([self.screenshots count] * IMAGE_SIZE_WIDTH, IMAGE_SIZE_HEIGHT)];

    int index = 0;

	for (UIImage *image in self.screenshots) {
		UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
		[imageView setFrame:CGRectMake(index * IMAGE_SIZE_WIDTH, 0, IMAGE_SIZE_WIDTH, IMAGE_SIZE_HEIGHT)];
		[scrollView addSubview:imageView];
        index++;
	}

    [self.view addSubview:scrollView];
}

- (void)projectListButtonClicked:(UIButton *)selector
{
    TAProjectViewController *projectVC = [[TAProjectViewController alloc] initWithType:[selector tag]];
    projectVC.modalPresentationStyle = UIModalPresentationCustom;
    projectVC.transitioningDelegate = self;
    [self presentViewController:projectVC animated:YES completion:nil];
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    return [[TATransition alloc] init];
}



@end
