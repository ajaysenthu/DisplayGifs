//
//  Giphy.m
//  GifViewer
//
//  Created by Ajay on 6/13/17.
//  Copyright © 2017 AJ Inc. All rights reserved.
//

#import "Giphy.h"

@implementation Giphy




+(instancetype)giphyWithDictionary:(NSDictionary *) dictionary {
    
    Giphy *giphy = [[Giphy alloc]init];
    
    if(giphy) {
        
        giphy.animatedGifURL = [NSURL URLWithString:[dictionary valueForKeyPath:@"images.original.url"]];
        
        giphy.stillImageURL = [NSURL URLWithString:[dictionary valueForKeyPath:@"images.downsized_still.url"]];
    }
    
    return giphy;
    
}

@end
