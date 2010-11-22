//
//  PetriSquareGridBoard.h
//  Petri
//
//  Created by Paul Martin on 10/11/20.
//  Copyright 2010 Alex Heinz, Paul Martin, and Alex Rozenshteyn. All rights reserved.
//

#import "PetriGridBoard.h"

/**
 * Concrete implementation of PetriGridBoard for boards with square grid layouts
 */
@interface PetriSquareGridBoard : PetriGridBoard

/*!
 Override. Returns the cells laterally adjacent to (i.e., above, below, and to the left and right of) the specified location.
 
 @param location A location on the board around which to look for valid placement cells.
 */
- (NSSet*)placementCellsAdjacentToLocation:(PetriBoardLocation*)location;

/*!
 Override. Returns the cells laterally or diagonally adjacent to the specified location.
 
 @param location A location on the board around which to look for capturable cells.
 */
- (NSSet*)capturableCellsAdjacentToLocation:(PetriBoardLocation*)location;

/*!
 Override. Check if a location is a valid place to put a piece
 
 @param piece piece to place
 @param location location to place the piece
 @param player player placing the piece
 @return true if the location is valid
 */
- (BOOL)isValidPlacementForPiece:(PetriPiece*)piece
					  atLocation:(PetriBoardLocation*)location
					  withPlayer:(PetriPlayer*)player;

/*!
 Override. Runs every time a piece is placed and performs all captures that are possible
 recursively until no more captures are available
 */
- (void)capture;

@end
