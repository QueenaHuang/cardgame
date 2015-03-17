//
//  Deck.h
//  CardGame
//
//  Created by cindy on 2015/3/13.
//  Copyright (c) 2015年 cindy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject
- (void)addCard:(Card *)card atTop:(BOOL)atTop;
- (void)addCard:(Card *)card;
- (Card *)drawRandomCard;

@end
