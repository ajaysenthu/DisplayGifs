//
//  CustomCollectionViewCell.h
//  GifViewer
//
//  Created by Ajay on 6/9/17.
//  Copyright © 2017 AJ Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Giphy;


@interface CustomCollectionViewCell : UICollectionViewCell


@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property (strong, nonatomic) Giphy *giphy;

@end
