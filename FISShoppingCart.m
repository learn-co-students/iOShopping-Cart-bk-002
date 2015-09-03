//
//  FISShoppingCart.m
//  
//
//  Created by Daniel Aksenov on 9/2/15.
//
//

#import "FISShoppingCart.h"

@implementation FISShoppingCart

- (NSUInteger)calculateTotalPriceInCents {
    NSUInteger totalPrice = 0;
    
    if ([self.items count] == 0 ) {
        return totalPrice;
    } else {
        for (FISItem *item in self.items) {
            totalPrice += item.priceInCents;
        }
        return totalPrice;
    }
}

- (void)addItem:(FISItem *)item {
    [self.items addObject:item];
}

- (void)removeItem:(FISItem *)item {
    NSUInteger index = [self.items indexOfObject:item];
    [self.items removeObjectAtIndex:index];
}

- (void)removeAllItemsLikeItem:(FISItem *)item {
    [self.items removeObject:item];
    
}

- (void)sortItemsByNameAsc {
    NSSortDescriptor *sortByNameAsc = [NSSortDescriptor sortDescriptorWithKey:@"name"
                                                                    ascending:YES
                                                                     selector:@selector(caseInsensitiveCompare:) ];
    [self.items sortUsingDescriptors:@[sortByNameAsc]];
}

- (void)sortItemsByNameDesc {
    NSSortDescriptor *sortByNameDesc = [NSSortDescriptor sortDescriptorWithKey:@"name"
                                                                    ascending:NO
                                                                     selector:@selector(caseInsensitiveCompare:) ];
    [self.items sortUsingDescriptors:@[sortByNameDesc]];
}

- (void)sortItemsByPriceInCentsAsc {
    NSSortDescriptor *sortByPriceAsc = [NSSortDescriptor sortDescriptorWithKey:@"priceInCents"
                                                                    ascending:YES
                                                                     selector:nil];
    [self.items sortUsingDescriptors:@[sortByPriceAsc]];
    
}

- (void)sortItemsByPriceInCentsDesc {
    NSSortDescriptor *sortByPriceDesc = [NSSortDescriptor sortDescriptorWithKey:@"priceInCents"
                                                                     ascending:NO
                                                                      selector:nil];
    [self.items sortUsingDescriptors:@[sortByPriceDesc]];
    
}

- (NSArray *)allItemsWithName:(NSString *)name {
    NSPredicate *namePredicate = [NSPredicate predicateWithFormat:@"name == %@",name];
    NSArray *names = [self.items filteredArrayUsingPredicate:namePredicate];
    return names;
}

- (NSArray *)allItemsWithMinimumPriceInCents:(NSUInteger)price {
    NSPredicate *pricePredicate = [NSPredicate predicateWithFormat:@"priceInCents >= %li",price];
    NSArray *items = [self.items filteredArrayUsingPredicate:pricePredicate];
    return items;
}

- (NSArray *)allItemsWithMaximumPriceInCents:(NSUInteger)price {
    NSPredicate *pricePredicate = [NSPredicate predicateWithFormat:@"priceInCents <= %li",price];
    NSArray *items = [self.items filteredArrayUsingPredicate:pricePredicate];
    return items;
}






@end
