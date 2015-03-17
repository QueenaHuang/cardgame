//
//  PlayingCard.h
//  CardGame
//
//  Created by cindy on 2015/3/13.
//  Copyright (c) 2015年 cindy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface PlayingCard : Card

@property (strong,nonatomic) NSString *suit;
@property (nonatomic) NSUInteger rank;

+ (NSArray *)validSuits;
+ (NSUInteger)maxRank;


@end
