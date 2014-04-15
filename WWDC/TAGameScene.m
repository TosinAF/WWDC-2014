//
//  TAGameScene.m
//  WWDC
//
//  Created by Tosin Afolabi on 14/04/2014.
//  Copyright (c) 2014 Tosin Afolabi. All rights reserved.
//

#import "TAGameScene.h"
#import "JSTileMap.h"

@interface TAGameScene ()

@property (nonatomic) JSTileMap* tileMap;

@end

@implementation TAGameScene

- (id)initWithSize:(CGSize)size {

    self = [super initWithSize:size];

    if (self) {

        self.backgroundColor = [SKColor blackColor];
        [self loadTileMap];

        
    }

    return self;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */

}

- (void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

- (void)loadTileMap
{
    self.tileMap = [JSTileMap mapNamed:@"pacman.tmx"];
    self.tileMap.position = CGPointMake(10, 0);
    [self addChild:self.tileMap];

    TMXObjectGroup *objectGroup = [self.tileMap groupNamed:@"Objects"];

    NSDictionary *spawnPoint = [objectGroup objectNamed:@"SpawnPoint"];
    int x = [spawnPoint[@"x"] integerValue];
    int y = [spawnPoint[@"y"] integerValue];

    SKSpriteNode *player = [[SKSpriteNode alloc] initWithImageNamed:@"pacman"];
    [player setPosition:CGPointMake(x, y-11)];
    [self addChild:player];
}



@end
