//
//  PlayingCard.m
//  Matchismo
//
//  Created by Dulio Denis on 1/26/13.
//  Copyright (c) 2013 Stanford University. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard
@synthesize suit = _suit; // because we provided both getter & setter

- (int)match:(NSArray *)otherCards
{
    int score = 0;
    if ([otherCards count] == 1) {
        PlayingCard *otherCard = [otherCards lastObject];
        if ([otherCard.suit isEqualToString:self.suit]) {
            score = 1;
        } else if (otherCard.rank == self.rank) {
            score = 4;
        }
    }
    
    else if ([otherCards count] == 2) {
        PlayingCard *otherCard1 = [otherCards objectAtIndex:0];
        PlayingCard *otherCard2 = [otherCards objectAtIndex:1];
        
        // absolute 3 card matches
        if ([otherCard1.suit isEqualToString:self.suit] && [otherCard2.suit isEqualToString:self.suit]) {
            score = 4;         NSLog(@"We match 3 card suits!");
        } else if (otherCard1.rank == self.rank && otherCard2.rank == self.rank) {
            score = 8;         NSLog(@"We match 3 card ranks!");
        }
    }
    
    return score;
}

+ (NSArray *)validSuits
{
    return @[@"♠", @"♣", @"♥", @"♦"];
}

- (NSString *)contents
{
    NSArray *rankStrings = [PlayingCard rankStrings];
    return [rankStrings[self.rank] stringByAppendingString:self.suit];
}

- (void)setSuit:(NSString *)suit
{
    if ([[PlayingCard validSuits] containsObject:suit]) {
        _suit = suit;
    }
}

- (NSString *)suit
{
    return _suit ? _suit : @"?";
}

+ (NSArray *)rankStrings
{
    return @[@"?", @"A", @"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10", @"J",@"Q",@"K"];
}

+ (NSUInteger)maxRank
{
    return [self rankStrings].count-1;
}

- (void)setRank:(NSUInteger)rank
{
    if (rank <= [PlayingCard maxRank]) {
        _rank = rank;
    }
}

@end
