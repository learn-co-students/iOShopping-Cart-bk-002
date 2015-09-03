//
//  FISShoppingCart.h
//  
//
//  Created by Daniel Aksenov on 9/2/15.
//
//

#import <Foundation/Foundation.h>
#import "FISItem.h"

@interface FISShoppingCart : NSObject

@property (strong, nonatomic) NSMutableArray *items;

- (NSUInteger)calculateTotalPriceInCents;
- (void)addItem:(FISItem *)item;
- (void)removeItem:(FISItem *)item;
- (void)removeAllItemsLikeItem:(FISItem *)item;
- (void)sortItemsByNameAsc;
- (void)sortItemsByNameDesc;
- (void)sortItemsByPriceInCentsAsc;
- (void)sortItemsByPriceInCentsDesc;
- (NSArray *)allItemsWithName:(NSString *)name;
- (NSArray *)allItemsWithMinimumPriceInCents:(NSUInteger)price;
- (NSArray *)allItemsWithMaximumPriceInCents:(NSUInteger)price;

@end
