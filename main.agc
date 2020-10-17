
// Project: Pong 
// Created: 2020-10-09
//Author: Kimi N
//Date Modified: Oct 9, 2020

// show all errors
SetErrorMode(2)

// set window properties
SetWindowTitle( "Pong" )
SetWindowSize( 1024, 768, 0 )
SetWindowAllowResize( 1 ) // allow the user to resize the window

// set display properties
SetVirtualResolution( 1024, 768 ) // doesn't have to match the window
SetOrientationAllowed( 1, 1, 1, 1 ) // allow both portrait and landscape on mobile devices
SetSyncRate( 30, 0 ) // 30fps instead of 60 to save battery
SetScissor( 0,0,0,0 ) // use the maximum available screen space, no black borders
UseNewDefaultFonts( 1 ) // since version 2.0.22 we can use nicer default fonts

//----Sprites---
CreateImageColor(1, 255, 0, 0, 255) // Red
CreateImageColor(2, 0, 255, 0, 255) // Green
CreateImageColor(3, 0, 0, 255, 255) // Blue
CreateImageColor(4, 0, 0, 0, 255) //Black
CreateImageColor(5, 255, 255, 255, 255) // White

//Player Sprites
CreateSprite(1, 5) //Player 1
SetSpriteSize(1, 20, 200)
SetSpritePosition(1, 0, GetVirtualHeight()/2 - GetSpriteHeight(1)/2)
padOneY = GetVirtualHeight()/2 - GetSpriteHeight(1)/2
SetSpriteVisible(1, 0)

CreateSprite(2, 5) // Player 2
SetSpriteSize(2, 20, 200)
SetSpritePosition(2, GetVirtualWidth() - GetSpriteWidth(2), GetVirtualHeight()/2 - GetSpriteHeight(2)/2)
padTwoY = GetVirtualHeight()/2 - GetSpriteHeight(2)/2
SetSpriteVisible(2, 0)

CreateSprite(6, 5) // Bot Paddle
SetSpriteSize(6, 20, 200)
SetSpritePosition(6, GetVirtualWidth() - GetSpriteWidth(6), GetVirtualHeight()/2 - GetSpriteHeight(6)/2)
padBotY = GetVirtualHeight()/2 - GetSpriteHeight(6)/2
SetSpriteActive(6, 0)
SetSpriteVisible(6,0)

//Ball Sprite
CreateSprite(3, 5)
SetSpriteSize(3, 25, 25)
ballX = (GetVirtualWidth() - GetSpriteWidth(3))/2
ballY = (GetVirtualHeight() - GetSpriteHeight(3))/2
SetSpritePosition(3, (GetVirtualWidth() - GetSpriteWidth(3))/2, (GetVirtualHeight() - GetSpriteHeight(3))/2)
SetSpriteVisible(3, 0)

//Goal Sprites 
//LeftGoal
CreateSprite(4, 1)
SetSpriteSize(4, 10, GetVirtualHeight())
SetSpritePosition(4, -20 , GetVirtualHeight()/2 - GetSpriteHeight(4)/2)
SetSpriteVisible(4, 0)

//Right Goal
CreateSprite(5, 1)
SetSpriteSize(5, 10, GetVirtualHeight())
SetSpritePosition(5, GetVirtualWidth() - GetSpriteWidth(5) + 20, GetVirtualHeight()/2 - GetSpriteHeight(5)/2)
SetSpriteVisible(5, 0)

//Text Sprites

//----Start Screen----
CreateText(1, "PONG")
SetTextSize(1, 200)
SetTextPosition(1, (GetVirtualWidth() - GetTextTotalWidth(1))/2, (GetVirtualHeight() - GetTextTotalHeight(1))/2 - 100)

CreateText(2, "Press ENTER to start the game")
SetTextSize(2, 50)
SetTextPosition(2, (GetVirtualWidth() - GetTextTotalWidth(2))/2,(GetVirtualHeight() - GetTextTotalHeight(2))/2)

CreateText(3, "Press ESC to quit the game")
SetTextSize(3, 45)
SetTextPosition(3, (GetVirtualWidth() - GetTextTotalWidth(3))/2,(GetVirtualHeight() - GetTextTotalHeight(3))/2 + 50)
//-----------------
//Game Mode Selection
CreateText(9, "Select a Game Mode")
SetTextSize(9, 60)
SetTextPosition(9, (GetVirtualWidth() - GetTextTotalWidth(9))/2, (GetVirtualHeight() - GetTextTotalHeight(9))/2 - 100)
SetTextVisible(9, 0)

CreateText(10, "Press 1 for local multiplayer")
SetTextSize(10, 40)
SetTextPosition(10, (GetVirtualWidth() - GetTextTotalWidth(10))/2, (GetVirtualHeight() - GetTextTotalHeight(9))/2)
SetTextVisible(10, 0)

CreateText(11, "Press 2 for singleplayer")
SetTextSize(11, 40)
SetTextPosition(11, (GetVirtualWidth() - GetTextTotalWidth(11))/2, (GetVirtualHeight() - GetTextTotalHeight(11))/2 + 40)
SetTextVisible(11, 0)

//--------------------------
//Two player game mode----------

CreateText(4, "Controls")
SetTextSize(4, 100)
SetTextPosition(4, (GetVirtualWidth() - GetTextTotalWidth(4))/2, 100)
SetTextVisible(4,0)

CreateText(5, " Use W/S keys to move Player 1 and" + chr(10) + "the Up/Down arrows to move Player 2")
SetTextSize(5, 60)
SetTextPosition(5, (GetVirtualWidth() - GetTextTotalWidth(5))/2, (GetVirtualHeight() - GetTextTotalHeight(5))/2)
SetTextVisible(5, 0)

CreateText(6, "Press SPACE to continue...")
SetTextSize(6, 60)
SetTextPosition(6,(GetVirtualWidth() - GetTextTotalWidth(6))/2, (GetVirtualHeight() - GetTextTotalHeight(6))/2 + 300)
SetTextVisible(6, 0)

CreateText(12, "First player to five points wins")
SetTextSize(12, 60)
SetTextPosition(12,(GetVirtualWidth() - GetTextTotalWidth(12))/2, (GetVirtualHeight() - GetTextTotalHeight(12))/2 + 100)
SetTextVisible(12, 0)

//1 player game mode------
CreateText(13, "Use the W/S arrows to move")
SetTextSize(13, 60)
SetTextPosition(13, (GetVirtualWidth() - GetTextTotalWidth(13))/2, (GetVirtualHeight() - GetTextTotalHeight(13))/2 - 50)
SetTextVisible(13, 0)

CreateText(17, "The longer you survive, the harder it gets")
SetTextSize(17, 60)
SetTextPosition(17, (GetVirtualWidth() - GetTextTotalWidth(17))/2, (GetVirtualHeight() - GetTextTotalHeight(17))/2)
SetTextVisible(17, 0)

CreateText(19, "Game Over")
SetTextSize(19, 60)
SetTextPosition(19, (GetVirtualWidth() - GetTextTotalWidth(19))/2, (GetVirtualHeight() - GetTextTotalHeight(19))/2)
SetTextVisible(19, 0)

CreateText(20, "Your final time was: " + Str(timeSur))
SetTextSize(20, 60)
SetTextPosition(20, (GetVirtualWidth() - GetTextTotalWidth(20))/2, (GetVirtualHeight() - GetTextTotalHeight(20))/2 + 100)
SetTextVisible(20, 0)

//Score Keeping
CreateText(7, Str(score1))
SetTextSize(7, 100)
SetTextVisible(7, 0)

CreateText(8, Str(score2))
SetTextSize(8, 100)
SetTextVisible(8, 0)

//1 Player time survived against Bot
CreateText(18, "Lives: " + Str(Lives))
SetTextSize(18,  100)
SetTextVisible(18, 0)
SetTextPosition(18, GetVirtualWidth() - GetTextTotalWidth(18), 0)

//End Screen for multiplayer
CreateText(14, "Player 1 is the winner!")
SetTextSize(14, 100)
SetTextPosition(14, GetVirtualWidth()/2 - GetTextTotalWidth(14)/2, 100)
SetTextVisible(14, 0)

CreateText(15, "Player 2 is the winner!")
SetTextSize(15, 100)
SetTextPosition(15, GetVirtualWidth()/2 - GetTextTotalWidth(15)/2, 100)
SetTextVisible(15, 0)

CreateText(16, "Press ENTER to play again or ESC to quit")
SetTextSize(16, 50)
SetTextPosition(16, GetVirtualWidth()/2 - GetTextTotalWidth(16)/2, GetVirtualHeight() - GetTextTotalHeight(16) - 200)
SetTextVisible(16, 0)


//----Variables-----
start = 0
cntrls = 0
startB = 0
timeSt = 0


padOneDir = 1
padTwoDir = 1
padSPD = 10
botPadSPD = 6  

ballDirX = 1
ballDirY = 1
ballSPD = 0

score1 = 0
score2 = 0

timeSur = 0
Lives = 10

do
    
//----Start Screen----
	if start = 0
		if GetRawKeyPressed(13) = 1 //Enter
			SetTextVisible(1, 0)
			SetTextVisible(2, 0)
			SetTextVisible(3, 0)
			
			
			//Game Mode Selection Screen
			SetTextVisible(9, 1)
			SetTextVisible(10, 1)
			SetTextVisible(11, 1)
		endif
			//2P Controls Screen
		if GetRawKeyPressed(49) = 1 // '1'
				SetTextVisible(9, 0)
				SetTextVisible(10, 0)
				SetTextVisible(11, 0)
				
				SetTextVisible(4, 1)
				SetTextVisible(5, 1)
				SetTextVisible(6, 1)
				SetTextVisible(12, 1)
				cntrls = 1
		endif
			//1P Controls Screen
		if GetRawKeyPressed(50) = 1 // '2'
			SetTextVisible(9, 0)
			SetTextVisible(10, 0)
			SetTextVisible(11, 0)
			
			SetTextVisible(4, 1)
			SetTextVisible(6,1)
			SetTextVisible(13, 1)
			SetTextVisible(17, 1)
			cntrls = 2
		endif
			
		if GetRawKeyPressed(27) = 1 //Esc
			end
		endif
	endif
	//1 player start screen
	if cntrls = 2
		if GetRawKeyPressed(32) = 1 //Space
		//Clear Screen/Game Prep
			SetTextVisible(4, 0)
			SetTextVisible(6,0)
			SetTextVisible(13, 0)
			SetTextVisible(17, 0)
		//Make active sprites visible
			SetSpriteActive(6, 1) //Bot paddle
			SetSpriteVisible(6,1)
			SetSpriteVisible(1, 1)
			SetSpriteVisible(3, 1)
			start = 2
			startB = 1
			timeSt = 1
		endif
	endif
	
	//Two Player Start Screen
	if cntrls = 1
		if GetRawKeyPressed(32) = 1 //Space
			SetTextVisible(4, 0)
			SetTextVisible(5, 0)
			SetTextVisible(6, 0)
			SetTextVisible(12, 0)
			start = 1
			startB = 1
		endif
	endif	
		
// --- Start Game----
//2 players game
	if start = 1
		SetSpriteVisible(1, 1)
		SetSpriteVisible(2, 1)
		SetSpriteVisible(3, 1)
		SetTextVisible(7,1)
		SetTextVisible(8, 1)
		
		//2 player subroutines
		
		gosub playerMove // Player Controls
		gosub ballMove // Ball Movement
		gosub spriteCollide // Paddle and Ball collisions
		gosub scoreKeep
		gosub endGame
	endif
	
//1 player game 								ihgoisfoisf Should  I divide the subroutines for each game mode?
	if start = 2
		//1 player subroutines
		gosub playerMove
		gosub botMove // Bot movements
		gosub ballMove
		gosub getTime // Time survived
		gosub spriteCollide
		gosub actLife //Lives of player 1
		gosub gameOver1 
	endif
    Sync()
loop

//----Subroutines----
//Character controls
playerMove:
//Player 1
SetSpritePosition(1, 0, GetVirtualHeight()/2 - GetSpriteHeight(1)/2)

//Controls
if GetRawKeyState(87) = 1 // w key
	padOneY = padOneY - padOneDir * padSPD
	else
		if GetRawKeyState(83) = 1 // s key
			padOneY = padOneY + padOneDir * padSPD
		endif
endif
//Boundaries for player 1
if padOneY < 0
	padOneY = 0
endif
if padOneY > GetVirtualHeight() - GetSpriteHeight(1)
	padOneY = GetVirtualHeight() - GetSpriteHeight(1)
endif

SetSpritePosition(1, 0, padOneY)

//Player 2 
SetSpritePosition(2, GetVirtualWidth() - GetSpriteWidth(2), GetVirtualHeight()/2 - GetSpriteHeight(2)/2)

//Controls
if GetRawKeyState(38) = 1 //up arrow
	padTwoY = padTwoY - padTwoDir * padSPD
	else
		if GetRawKeyState(40) = 1 //down arrow
			padTwoY = padTwoY + padTwoDir * padSPD
		endif
endif

//Boundaries for player 2
if padTwoY < 0
	padTwoY = 0
endif
if padTwoY > GetVirtualHeight() - GetSpriteHeight(2)
	padTwoY = GetVirtualHeight() - GetSpriteHeight(2)
endif

SetSpritePosition(2, GetVirtualWidth() - GetSpriteWidth(2), padTwoY)
return

//Ball Movement
ballMove:
if startB = 1
	ballSPD = 10
endif
SetSpritePosition(3, (GetVirtualWidth() - GetSpriteWidth(3))/2, (GetVirtualHeight() - GetSpriteHeight(3))/2)

ballX = ballX + ballDirX * ballSPD
ballY = ballY + ballDirY * ballSPD

//Boundaries

if ballY > GetVirtualHeight() - GetSpriteHeight(3)
	ballDirY = -1
else
	if ballY < 0
		ballDirY = 1
	endif
endif

SetSpritePosition(3, ballX, ballY)

//Increased difficulties for Singleplayer mode
if start = 2
	if timeSur > 400 and ballSPD < 30
		startB = 0
		ballSPD = 15
		botPadSPD = 10
	endif
	if timeSur > 700
		ballSPD = 20
		botPadSPD = 15
	endif
	if timeSur > 900
		ballSPD = ballSPD + 1
		botPadSPD = ballSPD
	endif
endif


SetSpritePosition(3, ballX, ballY)

return

//Sprite Collisions
spriteCollide:
if GetSpriteCollision(1, 3) //Player 1 paddle collision with ball
	ballDirX = 1
endif

if GetSpriteCollision(2, 3) //Player 2 paddle collision with ball
	ballDirX = -1
endif

if GetSpriteCollision(4, 3) //Left Goal collision with ball
	score2 = score2 + 1
	ballX = (GetVirtualWidth() - GetSpriteWidth(3))/2
	ballY = (GetVirtualHeight() - GetSpriteHeight(3))/2
	SetSpritePosition(3, ballX, ballY)
	if start = 2
		Lives = Lives - 1
	endif
		
endif
if GetSpriteCollision(5, 3) //Right Goal collision with ball
	score1 = score1 + 1
	ballX = (GetVirtualWidth() - GetSpriteWidth(3))/2
	ballY = (GetVirtualHeight() - GetSpriteHeight(3))/2
	SetSpritePosition(3, ballX, ballY)
endif

if GetSpriteCollision(6, 3) //Bot collision with ball
	ballDirX = -1
endif
	

return
	
//Score Keeping and Reset
scoreKeep:
SetTextPosition(7, GetVirtualWidth()/2 - GetTextTotalWidth(7)/2 - 100, 0)
SetTextPosition(8, GetVirtualWidth()/2 - GetTextTotalWidth(8)/2 + 100, 0)
if start = 1
	SetTextString(7, Str(score1))
	SetTextString(8, Str(score2))
endif

return

//Time survived for 1 player game
getTime:
if timeSt = 1
	timeSur = timeSur + 1
	Print("Time survived: " + Str(timeSur))
endif

return

//Turn on lives for singleplayer mode 
actLife:
if timeSt = 1
	SetTextVisible(18, 1)
	SetTextPosition(18, GetVirtualWidth()/2 - GetTextTotalWidth(18)/2, 0)
	SetTextString(18, "Lives: " + Str(Lives))
endif
return

gameOver1: //the game over screen for single player mode
if Lives = 0
	timeSt = 0
	SetTextVisible(19, 1)
	SetTextVisible(20, 1)
	SetTextString(20, "Your final time was: " + Str(timeSur))
	
	//Clearing the screen
	SetSpriteVisible(1, 0)
	SetSpriteVisible(3, 0)
	SetSpriteVisible(6, 0)
	SetSpriteActive(6, 0)
	SetTextVisible(18, 0)
	DeleteText(timeSur)
	
	SetTextVisible(16, 1)
	
	if GetRawKeyState(27) = 1 //Esc
		end
	endif
	if GetRawKeyState(13) = 1 //Enter
		SetTextVisible(19, 0)
		SetTextVisible(20, 0)
		SetTextVisible(16, 0)
		
		//Reset
		Lives = 10
		ballSPD = 0
		timeSur = 0
		botPadSPD = 6 
		cntrls = 0
		startB = 0
		
		start = 0
		
		SetTextVisible(1, 1)
		SetTextVisible(2, 1)
		SetTextVisible(3, 1)
	endif
endif

return


endGame: // For 2 player game
if score1 = 5 or score2 = 5
	//Clearing Screen
	SetSpriteVisible(3, 0)
	SetTextVisible(7,0)
	SetTextVisible(8, 0)
	ballSPD = 0
	SetSpriteActive(3, 0)
	
	//End Game Screen
	if score1 = 5
		SetTextVisible(14, 1)
	endif
	if score2 = 5
		SetTextVisible(15, 1)
	endif
	
	SetTextVisible(16, 1)
	
	//Reset
	if GetRawKeyState(13) = 1 //Enter
		score1 = 0
		score2 = 0
		ballDirX = 1
		ballDirY = 1
		ballSPD = 0
		
		start = 0
		SetTextVisible(16, 0)
		
		SetTextVisible(1, 1)
		SetTextVisible(2, 1)
		SetTextVisible(3, 1)
	endif
	if GetRawKeyState(27) = 1 //Esc
		end
	endif
endif

return

//Bot movement 
botMove:
if ballY < padBotY
	padBotY = padBotY - botPadSPD
endif
if ballY > padBotY
	padBotY = padBotY + botPadSPD
endif

SetSpritePosition(6, GetVirtualWidth() - GetSpriteWidth(6), padBotY)

//Boundaries for Bot
if padBotY < 0
	padBotY = 0
endif
if padBotY > GetVirtualHeight() - GetSpriteHeight(6)
	padBotY = GetVirtualHeight() - GetSpriteHeight(6)
endif
SetSpritePosition(6, GetVirtualWidth() - GetSpriteWidth(6), padBotY)

return
