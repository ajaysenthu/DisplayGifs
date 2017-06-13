//
//  CollectionViewController.m
//  GifViewer
//
//  Created by Ajay on 6/9/17.
//  Copyright © 2017 AJ Inc. All rights reserved.
//

#import "CollectionViewController.h"
#import "CustomCollectionViewCell.h"
#import "Giphy.h"
#import "DetailViewController.h"

@interface CollectionViewController ()

@property (strong, nonatomic) NSMutableArray *giphys;

@end

@implementation CollectionViewController

static NSString * const reuseIdentifier = @"GifCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Register cell classes
//    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    // Do any additional setup after loading the view.
    
    [self createRequest];
}

-(void)createRequest {
    
    
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSURL *url = [NSURL URLWithString:@"https://api.giphy.com/v1/gifs/trending?api_key=dc6zaTOxFJmzC&rating=pg"];
    
    self.giphys = [NSMutableArray array];
    
    NSURLSessionDownloadTask *task = [session downloadTaskWithURL:url completionHandler:^(NSURL * _Nullable location, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        
        
//        NSString *responseText = [[NSString alloc]initWithContentsOfURL:location encoding:NSUTF8StringEncoding error:nil];
        
        NSData *data = [NSData dataWithContentsOfURL:location];
        
        NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
        
        
//        _imageURLs = [dictionary valueForKeyPath:@"data.images.downsized_still.url"];
        
        NSArray *dictionaries = [dictionary valueForKey:@"data"];
        
        for (NSDictionary *dict in dictionaries) {
            
            Giphy *giphy = [Giphy giphyWithDictionary:dict];
            
            [self.giphys addObject:giphy];
            
        }
        
        NSLog(@"URLs are %@", _giphys);
        
        dispatch_async(dispatch_get_main_queue(), ^{
        
        [self.collectionView reloadData];
            
        });

    }];
    
    [task resume];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    
    if([segue.identifier isEqualToString:@"showDetail"]) {
        
        
        NSIndexPath *selectedIndexPath = [self.collectionView indexPathsForSelectedItems][0];
        
        Giphy *giphy = self.giphys[selectedIndexPath.row];
        
        DetailViewController *detailViewController = segue.destinationViewController;
        
        detailViewController.giphy = giphy;
    }
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {

    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return _giphys.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    CustomCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    // Configure the cell
    
    
//    NSString *URLString = _imageURLs[indexPath.row];
//    
//   
//    cell.urlString = URLString;
    
    
    Giphy *giphy = [self.giphys objectAtIndex:indexPath.row];
    
    cell.giphy = giphy;
    
    return cell;
}

#pragma mark <UICollectionViewDelegate>


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    
    [self performSegueWithIdentifier:@"showDetail" sender:self];
}





@end
