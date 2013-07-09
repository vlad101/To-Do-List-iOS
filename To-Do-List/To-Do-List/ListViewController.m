//
//  ListViewController.m
//  To-Do-List
//
//  Created by Vladimir Efros on 7/8/13.
//  Copyright (c) 2013 Vladimir Efros. All rights reserved.
//

#import "ListViewController.h"
#import "Item.h"

@interface ListViewController ()
@property (nonatomic, strong) Item *testItem;
@property (nonatomic, copy) NSMutableArray *items;
@end

@implementation ListViewController

@synthesize items = _items;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if(self)
    {        
        // Create a test array.
        _items = [[NSMutableArray alloc] init];
        
        // Create an array of 10 items and display it to the console.
        for(int i = 0; i < 10; i++)
        {
            // Create an Item object.
            //Item *item = [[Item alloc] initWithHeader:@"H" body:@"B"];
            //Item *item = [[Item alloc] init];
            //Item *item = [[Item alloc] initWithHeader:@"H"];
            //Item *item = [[Item alloc] initWithBody:@"B"];
            
            // Create a random item.
            Item *item = [Item randomItem];
            
            // Add an item to an array.
            [_items addObject:item];
            
            // Display all items to the console.
            NSLog(@"Item %d: %@", i + 1, [_items objectAtIndex:i]);
        }
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
