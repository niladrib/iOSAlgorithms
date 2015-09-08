//
//  MainScreenViewController.m
//  Algorithms
//
//  Created by Niladri Bora on 9/7/15.
//  Copyright (c) 2015 Niladri Bora. All rights reserved.
//

#import "MainScreenViewController.h"
#import "QuickSort.h"
#import "Heap.h"

@interface MainScreenViewController ()

@end

@implementation MainScreenViewController

- (IBAction)clickedQuickSort:(id)sender {
    NSArray* input = @[@1, @100, @150, @7, @0, @0, @99, @75, @75, @6, @125];
    NSLog(@"in=%@ out=%@", input, [QuickSort doQuickSort:input]);
}
- (IBAction)clickedHeapSort:(id)sender {
    NSArray* input = @[@1, @100, @150, @700, @0, @0, @999, @75, @75, @6, @125];
    Heap* h = [[Heap alloc] initWithArray:input];
    [h buildHeap];
    NSLog(@"heap=%@", h);
    NSArray* sorted = [Heap heapSort:input];
    NSLog(@"in=%@ out=%@", input, sorted);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
