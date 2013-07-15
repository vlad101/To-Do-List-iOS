//
//  ItemsViewController.m
//  To-Do-List
//
//  Created by Vladimir Efros on 7/12/13.
//  Copyright (c) 2013 Vladimir Efros. All rights reserved.
//

#import "ItemsViewController.h"
#import "DetailViewController.h"
#import "ItemListing.h"
#import "Item.h"
#import "AddItemViewController.h"
#import "UIFont+ListAdditions.h"

@implementation ItemsViewController

- (id)init
{
    // Call the superclass's designated initializer.
    // Set top and bottom rows have rounded corners.
    self = [super initWithStyle:UITableViewStyleGrouped];
    
    if(self)
    {
        UINavigationItem *n = [self navigationItem];
        
        [n setTitle:@"To-Do List"];
        
        //for(int i = 0; i < 5; i++)
            //[[ItemListing sharedListing] createItem];
        
        UIBarButtonItem *bbi = [[UIBarButtonItem alloc]
                                initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                target:self
                                action:@selector(addNewItem:)];
        
        [[self navigationItem] setRightBarButtonItem:bbi];
        
        [[self navigationItem] setLeftBarButtonItem:[self editButtonItem]];
    }
    
    return self;
}

// Ensure that all instances of ListViewController use the same style,
// no matter what initialization method is sent to it.
- (id)initWithStyle:(UITableViewStyle)style
{
    return [self init];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [[self tableView] reloadData];
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

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(editingStyle == UITableViewCellEditingStyleDelete)
    {
        ItemListing *ps = [ItemListing sharedListing];
        NSArray *items = [ps allItems];
        Item *p = [items objectAtIndex:[indexPath row]];
        [ps removeItem:p];
        
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
    [[ItemListing sharedListing] moveItemAtIndex:[fromIndexPath row] toIndex:[toIndexPath row]];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DetailViewController *detailViewController = [[DetailViewController alloc] init];
    
    NSArray *items = [[ItemListing sharedListing] allItems];
    Item *selectedItem = [items objectAtIndex:[indexPath row]];
    [detailViewController setItem:selectedItem];
    
    [[self navigationController] pushViewController:detailViewController animated:YES];
}

- (IBAction)addNewItem:(id)sender
{
    AddItemViewController *addItemViewController = [[AddItemViewController alloc] initWithNibName:@"AddItemViewController" bundle:nil];
    [self.navigationController pushViewController:addItemViewController animated:YES];
    NSLog(@"Pushed a addItemViewController");
    
    if([addItemViewController item])
    {
        NSLog(@"The item is added to listing!");
        //Item *newItem = [[ItemListing sharedListing] createItem];
        Item *newItem = [[ItemListing sharedListing] addNewItemToListing:[addItemViewController item]];
        int lastRow = [[[ItemListing sharedListing] allItems] indexOfObject:newItem];
        NSIndexPath *ip = [NSIndexPath indexPathForRow:lastRow inSection:0];
    
        [[self tableView] insertRowsAtIndexPaths:[NSArray arrayWithObject:ip] withRowAnimation:UITableViewRowAnimationTop];
    }
}

@end
