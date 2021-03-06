//
//  PetriClientNetworkController.m
//  Petri
//
//  Created by Paul Martin on 12/12/10.
//  Copyright 2010 Alex Heinz, Paul Martin, and Alex Rozenshteyn. All rights reserved.
//

#import "PetriClientNetworkController.h"

#import "PetriServerNetworkController.h"

@implementation PetriClientNetworkController

- (id)initWithServerHost:(NSString*)serverIpAddr
{
	//Instantiate a distributed server object
	id PetriServerNetworkControllerProxy = [NSConnection rootProxyForConnectionWithRegisteredName:@"PetriServerListenConnection"
																							 host:serverIpAddr];
	
	//Now set pointer to PetriServerNetworkControllerProxy
	serverNC = PetriServerNetworkControllerProxy;
	
	//Vend yourself
	NSSocketPort *port = [[NSSocketPort alloc] initWithTCPPort:PETRI_CLIENT_PORT];
	
	NSConnection *connection;
	
	connection = [NSConnection connectionWithReceivePort:port sendPort:port];
	[connection setRootObject:self];
	if ([connection registerName:@"PetriClientListenConnection"] == NO)
	{
		/* Handle error. */
	}

	//Pass host to server to make host connect to DO
	
	[PetriServerNetworkControllerProxy addClientByIpAddr:[[NSHost currentHost] address]];
	
	return self;
}
	
@end
