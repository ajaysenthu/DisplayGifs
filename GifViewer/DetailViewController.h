//
//  DetailViewController.h
//  GifViewer
//
//  Created by Ajay on 6/14/17.
//  Copyright © 2017 AJ Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Giphy;

@interface DetailViewController : UIViewController


@property (weak, nonatomic) IBOutlet UIWebView *webView;


@property (strong, nonatomic) Giphy *giphy;

@end
