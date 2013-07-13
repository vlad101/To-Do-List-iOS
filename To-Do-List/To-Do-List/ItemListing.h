//
//  ItemListing.h
//  To-Do-List
//
//  Created by Vladimir Efros on 7/12/13.
//  Copyright (c) 2013 Vladimir Efros. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Item;

@interface ItemListing : NSObject
{
    NSMutableArray *allItems;
}

+ (ItemListing *)sharedListing;

- (NSArray *)allItems;
- (Item *)createItem;

@end
