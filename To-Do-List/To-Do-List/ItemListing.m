//
//  ItemListing.m
//  To-Do-List
//
//  Created by Vladimir Efros on 7/12/13.
//  Copyright (c) 2013 Vladimir Efros. All rights reserved.
//

#import "ItemListing.h"
#import "Item.h"

@implementation ItemListing

+ (ItemListing *)sharedListing
{
    // Creating a singleton design.
    static ItemListing *itemListing = nil;
    if(!itemListing)
        // Skip over the trap to get an instance of the ItemListing.
        itemListing = [[super allocWithZone:nil] init];
    
    return itemListing;
}

+ (id)allocWithZone:(NSZone *)zone
{
    // Resurn the single sharedListing instance.
    return [self sharedListing];
}

- (id)init
{
    self = [super init];
    if(self)
        allItems = [[NSMutableArray alloc] init];
    
    return self;
}

- (NSArray *)allItems
{
    return allItems;
}

- (Item *)createItem
{
    Item *p = [Item randomItem];
    
    [allItems addObject:p];
    
    return p;
}

- (Item *)addNewItemToListing:(Item *)item
{
    Item *p = item;
    
    [allItems addObject:p];
    
    return p;
}

- (void)removeItem:(Item *)p
{
    [allItems removeObjectIdenticalTo:p];
}

- (void)moveItemAtIndex:(int)from toIndex:(int)to
{
   if(from == to)
       return;
    
    Item *p = [allItems objectAtIndex:from];
    
    [allItems removeObjectAtIndex:from];
    
    [allItems insertObject:p atIndex:to];
}

@end
