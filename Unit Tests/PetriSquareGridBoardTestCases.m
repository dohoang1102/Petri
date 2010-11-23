//
//  PetriSquareGridBoardTestCases.m
//  Petri
//
//  Created by Paul Martin on 10/11/22.
//  Copyright 2010 Alex Heinz, Paul Martin, and Alex Rozenshteyn. All rights reserved.
//

#import "PetriSquareGridBoardTestCases.h"
#import "PetriGridBoard.h"
#import "PetriSquareGridBoard.h"

#define WIDTH 20
#define HEIGHT 25

@implementation PetriSquareGridBoardTestCases

- (void)setUp
{
	board = [[PetriSquareGridBoard alloc] initWithWidth:WIDTH height:HEIGHT];
	STAssertNotNil(board, @"Initializing PetriSquareGridBoard failed.");
}

- (void)tearDown
{
	board = nil;
}

- (void)testInitUsesCorrectDimensions
{
	STAssertTrue([board width]==WIDTH && [board height]==HEIGHT, @"Board width or height not assigned correctly.");
}

@end
