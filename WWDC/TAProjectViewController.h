//
//  TAProjectViewController.h
//  WWDC
//
//  Created by Tosin Afolabi on 13/04/2014.
//  Copyright (c) 2014 Tosin Afolabi. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, TAProjectType) {
    TAProjectTypeProcuses,
    TAProjectTypeTheNews,
    TAProjectTypeGoCode,
    TAProjectTypeBricks,
    TAProjectTypeCandlePath,
};

@interface TAProjectViewController : UIViewController

- (instancetype)initWithType:(TAProjectType)type;

@end
