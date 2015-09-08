//
//  Heap.m
//  Algorithms
//
//  Created by Niladri Bora on 9/7/15.
//  Copyright (c) 2015 Niladri Bora. All rights reserved.
//

#import "Heap.h"

@interface Heap()

@property(strong, nonatomic, readwrite) NSMutableArray* heapArray;

@end

@implementation Heap

-(instancetype) initWithArray:(NSArray*) inArray{
    self = [super init];
    if(self){
        _heapArray = [inArray mutableCopy];
    }
    return self;
}

/**
 Assumes left[idx] and right[idx] are perfect heaps but 
 A[idx] < left[idx] || A[idx] < right[idx]
 */
-(void) heapifyAtIdx:(const NSInteger) idx{
    NSInteger leftIdx = [Heap leftOfIdx:idx];
    NSInteger rightIdx = [Heap rightOfIdx:idx];
    long parentVal = [self.heapArray[idx] longValue];
    NSInteger greatestIdx = idx;
    if(leftIdx < self.heapArray.count &&
       [self.heapArray[leftIdx] longValue] > parentVal){
        greatestIdx = leftIdx;
    }
    if(rightIdx < self.heapArray.count &&
       [self.heapArray[rightIdx] longValue] > [self.heapArray[greatestIdx] longValue]){
        greatestIdx = rightIdx;
    }
    if(greatestIdx != idx){
        [self swapElement:greatestIdx with:idx];
        [self heapifyAtIdx:greatestIdx];
    }
}

-(void) buildHeap{
    for(NSInteger i = (NSInteger)floor((self.heapArray.count-1)/2);
        i >= 0; i--){
        [self heapifyAtIdx:i];
    }
    /**
     if we chose we could call heapify on the entire array(as long as we go backwards from the end). Starting at the middle is only an optimization
     */
//    for(NSInteger i = self.heapArray.count -1;
//        i >= 0; i--){
//        [self heapifyAtIdx:i];
//    }

}

-(NSString*) description{
    return [self.heapArray description];
}

+(NSArray*) heapSort:(NSArray*) inArray{
    Heap* h = [[Heap alloc] initWithArray:inArray];
    [h buildHeap];
    
    NSMutableArray* sortedArray = [NSMutableArray new];
    while(h.heapArray.count>1){
        [sortedArray addObject:h.heapArray[0]];
        NSRange r;
        r.location = 1 ;
        r.length = h.heapArray.count-1;
        NSMutableArray* a2 = [[h.heapArray
                               subarrayWithRange:r] mutableCopy];
        //move last element to first to keep heap property from idx=1..end
        id lastElem = [a2 lastObject];
        [a2 removeLastObject];
        [a2 insertObject:lastElem atIndex:0];
        h = [[Heap alloc] initWithArray:a2];
        /**
         Note - to implement a priority queue we have to do this only 
         once - after removing the top element
         */
        [h heapifyAtIdx:0];
        NSLog(@"loc=%ld len=%ld top=%@ a2=%@", r.location, r.length,
              [sortedArray lastObject],
              h.heapArray);

    }
    if(h.heapArray.count == 1){
        [sortedArray addObject:h.heapArray[0]];
    }
    return sortedArray;
}

#pragma mark - Utility methods

-(void) swapElement:(const NSInteger) idx1
               with:(const NSInteger) idx2{
    id e1 = self.heapArray[idx1];
    id e2 = self.heapArray[idx2];
    self.heapArray[idx1] = e2;
    self.heapArray[idx2] = e1;
}

+(NSInteger) parentOfIdx:(const NSInteger) i{
    return (NSInteger)floor(i/2);
}

+(NSInteger) leftOfIdx:(const NSInteger) i{
    return 2*i;
}

+(NSInteger) rightOfIdx:(const NSInteger) i{
    return 2*i+1;
}

@end
