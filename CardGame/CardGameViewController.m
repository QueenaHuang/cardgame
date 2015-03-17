//
//  ViewController.m
//  CardGame
//
//  Created by cindy on 2015/3/7.
//  Copyright (c) 2015年 cindy. All rights reserved.
//

#import "CardGameViewController.h"
#import "PlayingCardDeck.h"
#import "CardMatchingGame.h"

@interface CardGameViewController ()
@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
@property (nonatomic) int flipCount;

@property (nonatomic) int test;
@property (strong, nonatomic) Deck *randomdeck;
@property (strong, nonatomic) CardMatchingGame *game;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@end

@implementation CardGameViewController
- (CardMatchingGame *)game
{
    if (!_game) _game = [[CardMatchingGame alloc] initWithCardCount:[self.cardButtons count] usingDeck:[self createDeck]];
    
    return _game;
}

-(Deck *)randomdeck
{
    // lazy instantiation
    if(!_randomdeck) _randomdeck = [self createDeck];
    return _randomdeck;
}

-(Deck *)createDeck
{
    return [[PlayingCardDeck alloc] init];
}

-(void) setFlipCount:(int)flipCount
{
    _flipCount = flipCount ;
    self.flipsLabel.text = [NSString stringWithFormat:@"Flips: %d", self.flipCount];
    NSLog(@"flipCount = %d ", self.flipCount);
}

/*
 any time the 'test' @property changes, the method is called.
 becase setTest() is the setter of the 'test'.
 if it use 'settest()', it doesn't work!
 */
-(void) setTest:(int)test
{
    
    _test = test;
    self.flipsLabel.text = [NSString stringWithFormat:@"Flips: %d", self.test];
    NSLog(@"i = %d ", self.test);
}

- (IBAction)touchCardButton:(UIButton *)sender

{
    
//    int chosenButtonIndex = = [self.cardButtons indexOfObject:sender];
//    [self.game chooseCardAtIndex:chosenButtonIndex];
//    [self updateUI];

    
    if ([sender.currentTitle length]) {
        [sender setBackgroundImage:[UIImage imageNamed:@"cardback"] forState:UIControlStateNormal];
        [sender setTitle:@"" forState:UIControlStateNormal];
    } else{
        Card *playcard = [self.randomdeck drawRandomCard];
        if (playcard) {
            [sender setBackgroundImage:[UIImage imageNamed:@"cardfront"] forState:UIControlStateNormal];
            [sender setTitle:[playcard contents] forState:UIControlStateNormal];
        }
        
    }
    
    self.test++;
    self.flipCount++;
}

- (void) updateUI
{
    for (UIButton *cardButton in self.cardButtons) {
        int cardButtonIndex = [self.cardButtons indexOfObject:cardButton];
        Card *card = [self.game cardAtIndex:cardButtonIndex];
        [cardButton setTitle:[self titleForCard:card] forState:UIControlStateNormal];
        [cardButton setBackgroundImage:[self backgroundImageForCard:card] forState:UIControlStateNormal];
        cardButton.enabled = !card.isMatched; // WHY ?
    }
}

- (NSString *)titleForCard:(Card *)card
{
    return card.isChosen ? card.contents : @"";
}
- (UIImage *)backgroundImageForCard:(Card *)card
{
    return [UIImage imageNamed:card.isChosen ? @"cardfront" : @"cardback"];
}
@end
