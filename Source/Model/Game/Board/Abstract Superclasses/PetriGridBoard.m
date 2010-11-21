//
//  PetriGridBoard.m
//  Petri
//
//  Created by Alex Heinz on 10/13/10.
//  Copyright 2010 Alex Heinz, Paul Martin, and Alex Rozenshteyn. All rights reserved.
//

#import "PetriGridBoard.h"
#import "PetriBoardCell.h"
#import "PetriBoardLocation.h"
#import "PetriPiece.h"

@implementation PetriGridBoard

- (id)init
{
	return [self initWithWidth:10
						height:10];
}

- (id)initWithWidth:(NSInteger)boardWidth
			 height:(NSInteger)boardHeight
{
	// Check that we aren't instantiating an abstract class
	if ([self isMemberOfClass:[PetriGridBoard class]])
	{
		[self doesNotRecognizeSelector:_cmd];
		return nil;
	}
	
	// Create the two-dimensional array of board cells
	NSMutableArray* tempBoard = [NSMutableArray arrayWithCapacity:boardWidth];
	
	for (NSInteger x = 0; x < boardWidth; x++)
	{
		NSMutableArray* column = [NSMutableArray arrayWithCapacity:boardHeight];
		
		for (NSInteger y = 0; y < boardHeight; y++)
		{
			[column addObject:[[PetriBoardCell alloc] init]];
		}
		
		[tempBoard addObject:[column copy]];
	}
	
	// Assign to local ivar
	cells = [tempBoard copy];
	
	width = boardWidth;
	height = boardHeight;
	
	return self;
}

- (void)placePiece:(PetriPiece*)piece
		atLocation:(PetriBoardLocation*)cellLocation
		 withOwner:(PetriPlayer*)player
{
	// Iterate over location-offsets in the piece
	for (PetriBoardLocation* pieceLocation in [piece cellLocations])
	{
		// Find the cell located at (piece origin) + (location offset)
		PetriBoardCell* cell = [self cellAtX:([pieceLocation x] + [cellLocation x])
										   Y:([pieceLocation y] + [cellLocation y])];
		
		// Create a body cell for the piece's owner
		[cell setOwner:player];
		[cell setCellType:bodyCell];
	}
}

- (PetriBoardCell*)cellAtLocation:(PetriBoardLocation*)location
{
	return [self cellAtX:[location x]
					   Y:[location y]];
}

- (PetriBoardCell*)cellAtX:(NSInteger)x
						 Y:(NSInteger)y
{
	return [[cells objectAtIndex:x] objectAtIndex:y];
}

- (NSSet*)placementCellsAdjacentToLocation:(PetriBoardLocation*)location
{
	[self doesNotRecognizeSelector:_cmd];
	return nil;
}

- (NSSet*)capturableCellsAdjacentToLocation:(PetriBoardLocation*)location
{
	[self doesNotRecognizeSelector:_cmd];
	return nil;
}

@synthesize width;
@synthesize height;

@end
