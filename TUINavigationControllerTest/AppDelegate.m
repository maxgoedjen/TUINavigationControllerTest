//
//  AppDelegate.m
//  TUINavigationControllerTest
//
//  Created by Max Goedjen on 11/12/12.
//  Copyright (c) 2012 Clink Apps. All rights reserved.
//

#import "AppDelegate.h"
#import "ColorViewController.h"

@interface AppDelegate ()

@property (nonatomic) TUINavigationController *navController;

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    CGRect b = CGRectMake(0, 0, 500, 450);
    _window = [[NSWindow alloc] initWithContentRect:b styleMask:NSTitledWindowMask | NSClosableWindowMask | NSResizableWindowMask backing:NSBackingStoreBuffered defer:NO];
	[_window setMinSize:NSMakeSize(300, 250)];
	[_window center];
	
	TUINSView *insView = [[TUINSView alloc] initWithFrame:b];
	
    [_window setContentView:insView];
    
    [_window makeKeyAndOrderFront:nil];
	
	ColorViewController *red = [[ColorViewController alloc] initWithColor:[NSColor redColor]];
	_navController = [[TUINavigationController alloc] initWithRootViewController:red];
	[insView setRootView:_navController.view];
	
	[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(_pushPop) userInfo:nil repeats:YES];

}

- (void)_pushPop {
	if ([[_navController viewControllers] count] > 3) {
//		[_navController popToRootViewControllerAnimated:YES];
//		[_navController popToViewController:[_navController viewControllers][1] animated:YES];
		[_navController popViewControlerAnimated:YES];
	} else {
		NSColor *color;
		switch ([[_navController viewControllers] count]) {
			case 0:
				color = [NSColor greenColor];
				break;
			case 1:
				color = [NSColor blueColor];
				break;
			case 2:
				color = [NSColor purpleColor];
				break;
			case 3:
				color = [NSColor darkGrayColor];
				break;
				
			default:
				break;
		}
		ColorViewController *colorVC = [[ColorViewController alloc] initWithColor:color];
		[_navController pushViewController:colorVC animated:YES];
	}
	
}

@end
