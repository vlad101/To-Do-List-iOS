//
//  AddItemViewController.h
//  To-Do-List
//
//  Created by Vladimir Efros on 7/14/13.
//  Copyright (c) 2013 Vladimir Efros. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Item.h"

@interface AddItemViewController : UIViewController
<UITextViewDelegate, UINavigationControllerDelegate,  UIImagePickerControllerDelegate>
{}

@property(nonatomic, strong) Item *item;

- (IBAction)takePicture:(id)sender;

@end
