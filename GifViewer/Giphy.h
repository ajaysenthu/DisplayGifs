//
//  Giphy.h
//  GifViewer
//
//  Created by Ajay on 6/13/17.
//  Copyright © 2017 AJ Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Giphy : NSObject


@property (strong, nonatomic) NSURL *stillImageURL;

@property (strong, nonatomic) NSURL *animatedGifURL;


+(instancetype)giphyWithDictionary:(NSDictionary *) dictionary ;

@end
