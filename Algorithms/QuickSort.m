//
//  QuickSort.m
//  Algorithms
//
//  Created by Niladri Bora on 9/7/15.
//  Copyright (c) 2015 Niladri Bora. All rights reserved.
//

#import "QuickSort.h"

@implementation QuickSort

+(NSArray*) doQuickSort:(NSArray*) input{
    return [QuickSort partitionAndSort:input];
}

+(void) swapId:(NSInteger) idx1 with:(NSInteger) idx2 inArray:(NSMutableArray*) a{
    id e1 = a[idx1];
    id e2 = a[idx2];
    a[idx1] = e2;
    a[idx2] = e1;
}

+(NSArray*) partitionAndSort:(NSArray*) inputArray{
    if(!inputArray || inputArray.count==0)
        return nil;
    if(inputArray.count == 1)
        return inputArray;
    NSMutableArray* mutableInput = [inputArray mutableCopy];
    //select pivot idx first
    NSInteger pivotIdx = arc4random() % (mutableInput.count);
    //pivot
    NSInteger currIdx = 0;
    //replace first element withe pivot
    [self swapId:0 with:pivotIdx inArray:mutableInput];
    pivotIdx = 0;
    NSNumber* pivot = mutableInput[pivotIdx];
    BOOL isAllequalElements = YES;
    for(currIdx = 1 ; currIdx < mutableInput.count; currIdx++){
        if([mutableInput[currIdx] integerValue] <
           [pivot integerValue]){
            //insert new element at pivot index and shift array to the right
            mutableInput[pivotIdx] = mutableInput[currIdx];
            for(NSInteger i=currIdx-1; i >pivotIdx; i--){
                mutableInput[i+1] = mutableInput[i];
            }
            pivotIdx++;
            isAllequalElements = NO;
        }
        else if ([mutableInput[currIdx] integerValue] !=
                 [pivot integerValue]){
            isAllequalElements = NO;
        }
    }
    if (isAllequalElements) {
        return mutableInput;//optimization
    }
    mutableInput[pivotIdx] = pivot;
    NSRange leftRange;
    leftRange.location = 0;
//    leftRange.length = (pivotIdx == 0)? 1 : pivotIdx;
    leftRange.length = pivotIdx;
    
    NSLog(@"input=%@ pivot=%@ pivotIdx=%ld", inputArray, pivot, pivotIdx);
    NSRange rightRange;
//    rightRange.location = (pivotIdx == 0)? 1 : pivotIdx;
//    rightRange.length = (pivotIdx == 0)? (mutableInput.count -1): (mutableInput.count - pivotIdx);
    rightRange.location = pivotIdx;
    rightRange.length = (mutableInput.count - pivotIdx);

    
    NSArray* left = [mutableInput subarrayWithRange:leftRange];
    NSArray* right = [mutableInput subarrayWithRange:rightRange];
    NSLog(@"left.location=%lu left.length=%lu right.location=%lu right.length=%lu",
          (unsigned long)leftRange.location, (unsigned long)leftRange.length,
          (unsigned long)rightRange.location, (unsigned long)rightRange.length);
    NSLog(@"left=%@ right=%@", left, right);
    left = [QuickSort partitionAndSort:left];
    right = [QuickSort partitionAndSort:right];
    [mutableInput removeAllObjects];
    if(left){
        [mutableInput addObjectsFromArray:left];
    }
    if(right){
        [mutableInput addObjectsFromArray:right];
    }
    return mutableInput;
}

@end
