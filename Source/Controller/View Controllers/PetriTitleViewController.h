//
//  PetriTitleViewController.h
//  Petri
//
//  Created by Alex Heinz on 11/6/10.
//  Copyright 2010 Alex Heinz, Paul Martin, and Alex Rozenshteyn. All rights reserved.
//

#import "PetriMainWindowViewController.h"

/*!
 \brief The controller for the Title view.
 
 The PetriTitleViewController is responsible for recieving events from the buttons on the title view, which allow the user to create or join game groups.
 */
@interface PetriTitleViewController : PetriMainWindowViewController
{
	
}

/*!
 Creates a new game group for a local game, and switches to the Game Group view.
 
 \warning This method is intended for testing purposes only; IBActions will not be used in the final interface.
 */
- (IBAction)createLocalGameGroup:(id)sender;

@end
