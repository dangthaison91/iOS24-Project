#import <UIKit/UIKit.h>

@interface MyView : UIView <UIGestureRecognizerDelegate>
{
	// Views the user can move
	UIImageView *firstPieceView;
	UIImageView *secondPieceView;
	UIImageView *thirdPieceView;
	
	UILabel *touchPhaseText;	// Displays the touch phase
	UILabel *touchInfoText;		// Displays touch information for  multiple taps
	UILabel *touchTrackingText;		// Displays touch tracking information
	UILabel *touchInstructionsText; // Displays instructions for how to split apart pieces that are on top of each other
	
	BOOL piecesOnTop;  // Keeps track of whether or not two or more pieces are on top of each other
	int touchCount;
    
    UIView *pieceForReset;
    
	CGPoint startTouchPosition; 
}

@property (nonatomic, retain) IBOutlet UIImageView *firstPieceView;
@property (nonatomic, retain) IBOutlet UIImageView *secondPieceView;
@property (nonatomic, retain) IBOutlet UIImageView *thirdPieceView;
@property (nonatomic, retain) IBOutlet UILabel *touchPhaseText;
@property (nonatomic, retain) IBOutlet UILabel *touchInfoText;
@property (nonatomic, retain) IBOutlet UILabel *touchTrackingText;
@property (nonatomic, retain) IBOutlet UILabel *touchInstructionsText;

@end

