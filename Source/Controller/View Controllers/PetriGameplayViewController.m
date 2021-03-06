//
//  PetriGameplayViewController.m
//  Petri
//
//  Created by Alex Heinz on 11/6/10.
//  Copyright 2010 Alex Heinz, Paul Martin, and Alex Rozenshteyn. All rights reserved.
//

#import "PetriGameplayViewController.h"

#import "PetriModel.h"
#import "PetriGame.h"
#import "PetriBoard.h"
#import "PetriItem.h"

NSString* const PetriGameplayViewNibName =	@"GameplayView";

@implementation PetriGameplayViewController

+ (void)initialize
{
	[self exposeBinding:@"game"];
}

- (id)initWithWindowController:(PetriMainWindowController*)windowController
{
	return [super initWithWindowController:windowController
								   nibName:PetriGameplayViewNibName];
}

- (void)awakeFromNib
{
	// Bind to the model
	[self bind:@"game"
	  toObject:[self mainWindowController]
   withKeyPath:@"model.gameGroup.game"
	   options:nil];
	
	// Bind the gameplay view to this controller
	[gameplayView bind:@"game"
			  toObject:self
		   withKeyPath:@"game"
			   options:nil];
}

- (void)didDisplayInWindow
{
	// Give first responder status to the gameplay view
	[[[self view] window] makeFirstResponder:gameplayView];
}

#pragma mark -
#pragma mark Interface Actions

- (IBAction)endGame:(id)sender
{
	// FIXME: testing code; needs to prompt user, etc.
	// Return to the game group view
	[[self mainWindowController] displayViewControllerForKey:PetriGameGroupViewControllerKey];
}

- (IBAction)returnToTitleView:(id)sender
{
	// FIXME: testing code; needs to prompt user, check if host, etc.
	// Return to the title view
	[[self mainWindowController] displayViewControllerForKey:PetriTitleViewControllerKey];
	
	// Leave/tear down the game group
	[[[self mainWindowController] model] leaveGameGroup];
}

- (IBAction)skipTurn:(id)sender
{
	// If the game is over, ignore this action
	if ([[self game] isGameOver])
		return;
	
	// Ask the game to advance to the next turn
	[[self game] nextTurn];
	
	// If the gameplay view has a layer on the cursor, drop it
	[gameplayView dropCarriedObjects:sender];
}

#pragma mark -
#pragma mark Interface Validation

// FIXME: this isn't working
- (BOOL)validateUserInterfaceItem:(id <NSValidatedUserInterfaceItem>)item
{
	if (([item action] == @selector(skipTurn:)) && [[self game] isGameOver])
		return NO;
	
	return [super validateUserInterfaceItem:item];
}

#pragma mark -
#pragma mark PetriGameplayView Delegate Methods

- (BOOL)gameplayView:(PetriGameplayView*)gameplayView
canRotateCurrentPiece:(id<PetriPiece>)piece
		   forPlayer:(PetriPlayer*)pieceOwner
{
	// FIXME: check that the player performing the rotation is local to the machine
	return YES;
}

- (void)gameplayView:(PetriGameplayView*)gameplayView
  rotateCurrentPiece:(id<PetriPiece>)piece
		   forPlayer:(PetriPlayer*)pieceOwner
{
	// Ask the game to rotate the current piece
	[[self game] rotateCurrentPiece];
	
	// FIXME: anything else?
}

- (BOOL)gameplayView:(PetriGameplayView*)gameplayView
	   canPlacePiece:(id<PetriPiece>)piece
		   forPlayer:(PetriPlayer*)pieceOwner
			  onCell:(PetriBoardCell*)cell
			 ofBoard:(id<PetriBoard>)board
{
	return [board validatePlacementOfPiece:piece
								 withOwner:pieceOwner
									onCell:cell];
}

- (void)gameplayView:(PetriGameplayView*)gameplayView
		  placePiece:(id<PetriPiece>)piece
		   forPlayer:(PetriPlayer*)pieceOwner
			  onCell:(PetriBoardCell*)cell
			 ofBoard:(id<PetriBoard>)board
{
	[[self game] placePiece:piece
				  forPlayer:pieceOwner
					 onCell:cell];
}

- (BOOL)gameplayView:(PetriGameplayView*)gameplayView
		  canUseItem:(PetriItem*)item
		   forPlayer:(PetriPlayer*)itemUser
			 onCells:(NSArray*)cells
			 ofBoard:(id<PetriBoard>)board
{
	return [item validateItemOnCells:cells
							  pieces:nil
							 players:nil
							byPlayer:itemUser
							 onBoard:board];
}

- (void)gameplayView:(PetriGameplayView*)gameplayView
			 useItem:(PetriItem*)item
		   forPlayer:(PetriPlayer*)itemUser
			 onCells:(NSArray*)cells
			 ofBoard:(id<PetriBoard>)board
{
	// Use the item
	[[self game] useItem:item
				 onCells:cells
				  pieces:nil
				 players:nil
				byPlayer:itemUser];

}

#pragma mark -
#pragma mark Accessors

@synthesize game;

@end
