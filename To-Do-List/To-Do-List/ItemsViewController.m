//
//  ItemsViewController.m
//  To-Do-List
//
//  Created by Vladimir Efros on 7/12/13.
//  Copyright (c) 2013 Vladimir Efros. All rights reserved.
//

#import "ItemsViewController.h"
#import "ItemListing.h"
#import "Item.h"
#import "UIFont+ListAdditions.h"

@implementation ItemsViewController

- (id)init
{
    // Call the superclass's designated initializer.
    // Set top and bottom rows have rounded corners.
    self = [super initWithStyle:UITableViewStyleGrouped];
    
    if(self)
    {
        for(int i = 0; i < 5; i++)
            [[ItemListing sharedListing] createItem];
    }
    
    return self;
}

// Ensure that all instances of ListViewController use the same style,
// no matter what initialization method is sent to it.
- (id)initWithStyle:(UITableViewStyle)style
{
    return [self init];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[[ItemListing sharedListing] allItems] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    
    if(!cell)
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCell"];
    
    Item *p  = [[[ItemListing sharedListing] allItems] objectAtIndex:[indexPath row]];
    NSLog(@"%@",[p description]);
    
    [[cell textLabel] setFont:[UIFont ve_listFontWithSize:20.0f]];
    [[cell textLabel] setText:[p description]];
    
    return cell;
}

@end
