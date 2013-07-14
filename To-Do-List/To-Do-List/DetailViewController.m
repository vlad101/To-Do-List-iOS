//
//  DetailViewController.m
//  To-Do-List
//
//  Created by Vladimir Efros on 7/13/13.
//  Copyright (c) 2013 Vladimir Efros. All rights reserved.
//

#import "DetailViewController.h"
#import "Item.h"
#import "UIFont+ListAdditions.h"

@interface DetailViewController ()
@property (weak, nonatomic) IBOutlet UITextView *headerField;
@property (weak, nonatomic) IBOutlet UITextView *bodyField;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *headerLabel;
@property (weak, nonatomic) IBOutlet UILabel *bodyLabel;
@end

@implementation DetailViewController

@synthesize headerField = _headerField;
@synthesize bodyField = _bodyField;
@synthesize dateLabel = _dateLabel;
@synthesize headerLabel = _headerLabel;
@synthesize bodyLabel = _bodyLabel;

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
    
    [[self headerField] setFont:[UIFont ve_listFontWithSize:15.0f]];
    [[self bodyField] setFont:[UIFont ve_listFontWithSize:15.0f]];
    [[self headerLabel] setFont:[UIFont ve_listFontWithSize:15.0f]];
    [[self bodyLabel] setFont:[UIFont ve_listFontWithSize:15.0f]];
    [[self dateLabel] setFont:[UIFont ve_listFontWithSize:15.0f]];
    
    [[self view] setBackgroundColor:[UIColor groupTableViewBackgroundColor]];
    
    [self.headerField setDelegate:self];
    [self.bodyField setDelegate:self];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [_headerField setText:[self.item header]];
    [_bodyField setText:[self.item body]];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"dd-MM-yyyy 'at' hh:mma"];
    [_dateLabel setText:[formatter stringFromDate:[NSDate date]]];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [[self view] endEditing:YES];
    
    [item setHeader:[_headerField text]];
    [item setBody:[_bodyField text]];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [[self view] endEditing:YES];    
}

- (void)setItem:(Item *)i
{
    item = i;
    [[self navigationItem] setTitle:[item header]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
