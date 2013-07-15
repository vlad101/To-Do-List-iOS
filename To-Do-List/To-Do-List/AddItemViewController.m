//
//  AddItemViewController.m
//  To-Do-List
//
//  Created by Vladimir Efros on 7/14/13.
//  Copyright (c) 2013 Vladimir Efros. All rights reserved.
//

#import "AddItemViewController.h"
#import "ItemListing.h"
#import "ImageListing.h"
#import "UIFont+ListAdditions.h"

@interface AddItemViewController ()
@property (weak, nonatomic) IBOutlet UILabel *headerLabel;
@property (weak, nonatomic) IBOutlet UILabel *bodyLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UITextView *headerField;
@property (weak, nonatomic) IBOutlet UITextView *bodyField;
@property (weak, nonatomic) IBOutlet UILabel *statusLabel;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) UIImage *image;
@end

@implementation AddItemViewController

@synthesize headerField = _headerField;
@synthesize bodyField = _bodyField;
@synthesize dateLabel = _dateLabel;
@synthesize headerLabel = _headerLabel;
@synthesize bodyLabel = _bodyLabel;
@synthesize statusLabel = _statusLabel;
@synthesize imageView = _imageView;
@synthesize image = _image;

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
    [_statusLabel setText:@"Item added!"];
    
    if(!_image)
    {
        item = [[Item alloc] initWithHeader:[_headerField text] body:[_bodyField text]];
        [[ItemListing sharedListing] addNewItemToListing:item];
    }
    else
        [self addItemWithImage];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{    
    [[self view] endEditing:YES];
}

- (IBAction)takePicture:(id)sender
{
    NSLog(@"Take picture");
    
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
        [imagePicker setSourceType:UIImagePickerControllerSourceTypeCamera];
    else
        [imagePicker setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
    
    [imagePicker setDelegate:self];
    
    [self presentViewController:imagePicker animated:YES completion:nil];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    _image = [info objectForKey:UIImagePickerControllerOriginalImage];
        
    [_imageView setImage:_image];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)addItemWithImage
{
    CFUUIDRef newUniqueID = CFUUIDCreate(kCFAllocatorDefault);
    
    CFStringRef newUniqueIDString = CFUUIDCreateString(kCFAllocatorDefault, newUniqueID)
    ;
    
    NSString *key = (__bridge NSString *)newUniqueIDString;
    
    item = [[Item alloc] initWithHeader:[_headerField text] body:[_bodyField text]];
    [[ItemListing sharedListing] addNewItemToListing:item];
    
    [item setImageKey:key];
    
    [[ImageListing sharedListing] setImage:_image forKey:[item imageKey]];
    
    CFRelease(newUniqueIDString);
    CFRelease(newUniqueID);
}

@end
