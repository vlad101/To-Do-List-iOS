//
//  AddItemViewController.m
//  To-Do-List
//
//  Created by Vladimir Efros on 7/14/13.
//  Copyright (c) 2013 Vladimir Efros. All rights reserved.
//

#import "AddItemViewController.h"
#import "ItemListing.h"
#import "UIFont+ListAdditions.h"

@interface AddItemViewController ()
@property (weak, nonatomic) IBOutlet UILabel *headerLabel;
@property (weak, nonatomic) IBOutlet UILabel *bodyLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UITextView *headerField;
@property (weak, nonatomic) IBOutlet UITextView *bodyField;
@property (weak, nonatomic) IBOutlet UILabel *statusLabel;
@end

@implementation AddItemViewController

@synthesize headerField = _headerField;
@synthesize bodyField = _bodyField;
@synthesize dateLabel = _dateLabel;
@synthesize headerLabel = _headerLabel;
@synthesize bodyLabel = _bodyLabel;
@synthesize statusLabel = _statusLabel;

@synthesize item;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"addItemViewController");
    
    [[self headerField] setFont:[UIFont ve_listFontWithSize:15.0f]];
    [[self bodyField] setFont:[UIFont ve_listFontWithSize:15.0f]];
    [[self headerLabel] setFont:[UIFont ve_listFontWithSize:15.0f]];
    [[self bodyLabel] setFont:[UIFont ve_listFontWithSize:15.0f]];
    [[self dateLabel] setFont:[UIFont ve_listFontWithSize:15.0f]];
    [[self statusLabel] setFont:[UIFont ve_listFontWithSize:15.0f]];
    [[self statusLabel] setTextColor:[UIColor redColor]];
    
    [[self view] setBackgroundColor:[UIColor groupTableViewBackgroundColor]];
    
    [self.headerField setDelegate:self];
    [self.bodyField setDelegate:self];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"dd-MM-yyyy 'at' hh:mma"];
    
    [_dateLabel setText:[formatter stringFromDate:[NSDate date]]];
    
    [[self navigationItem] setTitle:@"Add Item"];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [[self view] endEditing:YES];
}

- (IBAction)addItem:(id)sender
{
    [self createItem];
}

- (Item *)createItem
{
    item = [[Item alloc] initWithHeader:[_headerField text] body:[_bodyField text]];
    [[ItemListing sharedListing] addNewItemToListing:item];
    NSLog(@"New Item created: %@", item);
    [_statusLabel setText:@"Item added!"];
    
    return item;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{    
    [[self view] endEditing:YES];
}

@end
