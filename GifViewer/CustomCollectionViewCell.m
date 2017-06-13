//
//  CustomCollectionViewCell.m
//  GifViewer
//
//  Created by Ajay on 6/9/17.
//  Copyright © 2017 AJ Inc. All rights reserved.
//

#import "CustomCollectionViewCell.h"
#import "Giphy.h"

@implementation CustomCollectionViewCell

//-(void)setUrlString:(NSString *)urlString {
//    
//    
//    _urlString = urlString;
//    
//    [self downloadImageWithURL:urlString];
//}



-(void)setGiphy:(Giphy *)giphy {
    
    _giphy = giphy;
    
    [self downloadImageWithURL:giphy.stillImageURL];
}

-(void)downloadImageWithURL:(NSURL*)url {
    
    NSURLSession *session = [NSURLSession sharedSession];
    
//    NSURL *url = [NSURL URLWithString:urlString];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url cachePolicy:NSURLRequestReturnCacheDataElseLoad timeoutInterval:60];
    
    NSURLSessionDownloadTask *task = [session downloadTaskWithRequest:request completionHandler:^(NSURL * _Nullable location, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        NSData *data = [NSData dataWithContentsOfURL:location];
        
        UIImage *image = [UIImage imageWithData:data];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            self.imageView.image = image;

        });
        
    }];
    
    [task resume];
    
}

@end
