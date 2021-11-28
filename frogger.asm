######################################################################
# CSC258H5S Fall 2021 Assembly Final Project
# University of Toronto, St. George
## Student: Name, Student Number
## Bitmap Display Configuration:
# - Unit width in pixels: 4
# - Unit height in pixels: 4
# - Display width in pixels: 512
# - Display height in pixels: 512
# - Base Address for Display: 0x10008000 ($gp)
## Which milestone is reached in this submission?
# (See the assignment handout for descriptions of the milestones)
# - Milestone 1/2/3/4/5 (choose the one the applies)
## Which approved additional features have been implemented?
# (See the assignment handout for the list of additional features)
# 1. (fill in the feature, if any)
# 2. (fill in the feature, if any)# 3. (fill in the feature, if any)
# ... (add more if necessary)## Any additional information that the TA needs to know:
# - (write here, if any)
#######################################################################

.data
	bitmapSpace: .space 32768 # allocate space for the bitmap to prevent overriting of values
	
	# the position of the frog, represents the top left corner of the frog
	x: .half 240  
	y: .half 480
	
	# positions
	spawnPos: .word 61440
	safeZonePos: .word 36864
	
	# run game if 1
	runGame: .byte 1
	
	# sprites
	
	# spawn + safezones
	safeZone: .word 0x000000, 0x8a54f9, 0x000000, 0x5459f9, 0x8a54f9, 0x000000, 0x000000, 0x000000, 0x000000, 0x8a54f9, 0x8a54f9, 0x8a54f9, 0x8a54f9, 0x000000, 0x000000, 0x8a54f9, 0x000000, 0x8a54f9, 0x8a54f9, 0x000000, 0x8a54f9, 0x8a54f9, 0x8a54f9, 0x000000, 0x8a54f9, 0x8a54f9, 0x000000, 0x8a54f9, 0x8a54f9, 0x8a54f9, 0x000000, 0x8a54f9, 0x8a54f9, 0x000000, 0x000000, 0x000000, 0x8a54f9, 0x8a54f9, 0x000000, 0x8a54f9, 0x8a54f9, 0x5459f9, 0x9b77e7, 0x5459f9, 0xff6b6b, 0x5459f9, 0x8a54f9, 0x000000, 0x000000, 0x000000, 0x8a54f9, 0x8a54f9, 0x000000, 0x8a54f9, 0x000000, 0x8a54f9, 0x5459f9, 0x8a54f9, 0x000000, 0x8a54f9, 0x000000, 0x000000, 0x8a54f9, 0x000000, 0x000000, 0x000000, 0x000000, 0x8a54f9, 0x8a54f9, 0x000000, 0x8a54f9, 0x5459f9, 0x8a54f9, 0x000000, 0x000000, 0x8a54f9, 0x000000, 0x000000, 0x8a54f9, 0x000000, 0x8a54f9, 0x8a54f9, 0x5459f9, 0x8a54f9, 0x000000, 0x8a54f9, 0x000000, 0x8a54f9, 0x8a54f9, 0x000000, 0x000000, 0x000000, 0x8a54f9, 0x000000, 0x8a54f9, 0x000000, 0x5459f9, 0xff6b6b, 0x5459f9, 0x5459f9, 0x8a54f9, 0x000000, 0x8a54f9, 0x8a54f9, 0x8a54f9, 0x000000, 0x8a54f9, 0x8a54f9, 0x000000, 0x000000, 0x000000, 0x000000, 0x8a54f9, 0x000000, 0x8a54f9, 0x000000, 0x000000, 0x000000, 0x8a54f9, 0x5459f9, 0x8a54f9, 0x000000, 0x5459f9, 0x8a54f9, 0x8a54f9, 0x8a54f9, 0x000000, 0x000000, 0x8a54f9, 0x8a54f9, 0x5459f9, 0xff6b6b, 0x5459f9, 0x8a54f9, 0x8a54f9, 0x8a54f9, 0x8a54f9, 0x8a54f9, 0x5459f9, 0x5459f9, 0x8a54f9, 0x8a54f9, 0x5459f9, 0x8a54f9, 0x8a54f9, 0x8a54f9, 0x8a54f9, 0x8a54f9, 0x8a54f9, 0x8a54f9, 0x8a54f9, 0x8a54f9, 0x5459f9, 0x8a54f9, 0x8a54f9, 0x8a54f9, 0x5459f9, 0x8a54f9, 0x8a54f9, 0x8a54f9, 0x8a54f9, 0x8a54f9, 0x8a54f9, 0x5459f9, 0x8a54f9, 0x8a54f9, 0x8a54f9, 0x8a54f9, 0x5459f9, 0xff6b6b, 0x5459f9, 0x8a54f9, 0x5459f9, 0x8a54f9, 0x8a54f9, 0x8a54f9, 0x8a54f9, 0x8a54f9, 0x5459f9, 0x5459f9, 0x8a54f9, 0x8a54f9, 0x8a54f9, 0x5459f9, 0xff6b6b, 0x5459f9, 0x8a54f9, 0x8a54f9, 0x8a54f9, 0x5459f9, 0x8a54f9, 0x8a54f9, 0x8a54f9, 0x5459f9, 0x8a54f9, 0x8a54f9, 0x8a54f9, 0x5459f9, 0x5459f9, 0xff6b6b, 0x5459f9, 0x8a54f9, 0x8a54f9, 0x8a54f9, 0x5459f9, 0x8a54f9, 0x8a54f9, 0x8a54f9, 0x8a54f9, 0x5459f9, 0xff6b6b, 0x5459f9, 0x5459f9, 0x8a54f9, 0x8a54f9, 0x8a54f9, 0x8a54f9, 0x8a54f9, 0x8a54f9, 0x8a54f9, 0x5459f9, 0x8a54f9, 0x8a54f9, 0x8a54f9, 0x8a54f9, 0x5459f9, 0x5459f9, 0xff6b6b, 0x5459f9, 0x8a54f9, 0x8a54f9, 0x8a54f9, 0x5459f9, 0x8a54f9, 0x8a54f9, 0x8a54f9, 0x8a54f9, 0x8a54f9, 0x5459f9, 0x8a54f9, 0x8a54f9, 0x5459f9, 0x8a54f9, 0xff6b6b, 0x5459f9, 0x8a54f9, 0x5459f9, 0xff6b6b, 0x8a54f9, 0x5459f9, 0xff6b6b, 0x5459f9, 0x8a54f9, 0x8a54f9, 0x5459f9, 0x8a54f9, 0x8a54f9, 0x8a54f9, 0x8a54f9, 0x5459f9, 0x8a54f9, 0x5459f9, 0x8a54f9, 0x8a54f9, 0x8a54f9, 0x8a54f9, 0x5459f9, 0xff6b6b, 0x5459f9, 0x5459f9, 0xff6b6b, 0x5459f9, 0x8a54f9, 0x8a54f9, 0x8a54f9, 0x8a54f9, 0x5459f9, 0x8a54f9, 0x8a54f9, 0x5459f9, 0xff6b6b, 0x5459f9, 0x8a54f9, 0x5459f9, 0xff6b6b, 0x5459f9, 0x8a54f9, 0x8a54f9, 0x8a54f9, 0x8a54f9, 0x5459f9, 0xff6b6b, 0x5459f9, 0x8a54f9, 0x8a54f9, 0x8a54f9, 0x5459f9, 0x5459f9, 0x8a54f9, 0x8a54f9, 0x8a54f9, 0x8a54f9, 0x8a54f9, 0x8a54f9, 0x8a54f9, 0x5459f9, 0x8a54f9, 0x8a54f9, 0x8a54f9, 0x8a54f9, 0x8a54f9, 0x8a54f9, 0x5459f9, 0x8a54f9, 0x8a54f9, 0x8a54f9, 0x5459f9, 0xff6b6b, 0x5459f9, 0x8a54f9, 0x5459f9, 0xff6b6b, 0x5459f9, 0x8a54f9, 0x8a54f9, 0x8a54f9, 0x8a54f9, 0x5459f9, 0x8a54f9, 0x8a54f9, 0x8a54f9, 0x5459f9, 0xff6b6b, 0x5459f9, 0x8a54f9, 0x8a54f9, 0x8a54f9, 0x8a54f9, 0x5459f9, 0x8a54f9, 0x8a54f9, 0x5459f9, 0x8a54f9, 0x8a54f9, 0x8a54f9, 0x8a54f9, 0x8a54f9, 0x5459f9, 0xff6b6b, 0x5459f9, 0x8a54f9, 0x5459f9, 0x8a54f9, 0x8a54f9, 0x8a54f9, 0x5459f9, 0x8a54f9, 0x8a54f9, 0x8a54f9, 0x5459f9, 0xff6b6b, 0x5459f9, 0x8a54f9, 0x8a54f9, 0x5459f9, 0x5459f9, 0xff6b6b, 0x5459f9, 0x8a54f9, 0x8a54f9, 0x5459f9, 0x5459f9, 0x8a54f9, 0x8a54f9, 0x8a54f9, 0x5459f9, 0x8a54f9, 0x8a54f9, 0x5459f9, 0x8a54f9, 0x8a54f9, 0x5459f9, 0xff6b6b, 0x5459f9, 0x8a54f9, 0x8a54f9, 0x8a54f9, 0x8a54f9, 0x5459f9, 0xff6b6b, 0x5459f9, 0x8a54f9, 0x8a54f9, 0x8a54f9, 0x5459f9, 0x5459f9, 0x8a54f9, 0x8a54f9, 0x5459f9, 0x8a54f9, 0x8a54f9, 0x5459f9, 0x8a54f9, 0x5459f9, 0xff6b6b, 0x5459f9, 0x8a54f9, 0x8a54f9, 0x5459f9, 0x8a54f9, 0x8a54f9, 0x8a54f9, 0x5459f9, 0x9b77e7, 0x5459f9, 0x8a54f9, 0x8a54f9, 0x8a54f9, 0x8a54f9, 0x5459f9, 0x8a54f9, 0x8a54f9, 0x8a54f9, 0x8a54f9, 0x5459f9, 0x8a54f9, 0x8a54f9, 0x8a54f9, 0x8a54f9, 0x5459f9, 0x8a54f9, 0x8a54f9, 0x5459f9, 0xff6b6b, 0x5459f9, 0x8a54f9, 0x8a54f9, 0x8a54f9, 0x5459f9, 0x8a54f9, 0x8a54f9, 0x8a54f9, 0x5459f9, 0x8a54f9, 0x8a54f9, 0x5459f9, 0x8a54f9, 0x8a54f9, 0x8a54f9, 0x5459f9, 0x8a54f9, 0x8a54f9, 0x5459f9, 0x8a54f9, 0x8a54f9, 0x8a54f9, 0x5459f9, 0x8a54f9, 0x8a54f9, 0x8a54f9, 0x5459f9, 0x8a54f9, 0x8a54f9, 0x8a54f9, 0x5459f9, 0x8a54f9, 0x8a54f9, 0x8a54f9, 0x5459f9, 0xff6b6b, 0x5459f9, 0x8a54f9, 0x5459f9, 0x8a54f9, 0x8a54f9, 0x8a54f9, 0x5459f9, 0x8a54f9, 0x5459f9, 0xff6b6b, 0x5459f9, 0x8a54f9, 0x8a54f9, 0x8a54f9, 0x5459f9, 0x8a54f9, 0x8a54f9, 0x5459f9, 0x5459f9, 0x8a54f9, 0x8a54f9, 0x5459f9, 0x8a54f9, 0x8a54f9, 0x5459f9, 0x8a54f9, 0x8a54f9, 0x5459f9, 0xff6b6b, 0x5459f9, 0x8a54f9, 0x8a54f9, 0x8a54f9, 0x8a54f9, 0x8a54f9, 0x5459f9, 0x8a54f9, 0x8a54f9, 0x8a54f9, 0x5459f9, 0x5459f9, 0x8a54f9, 0x8a54f9, 0x8a54f9, 0x8a54f9, 0x8a54f9, 0x8a54f9, 0x5459f9, 0x8a54f9, 0x8a54f9, 0x8a54f9, 0x5459f9, 0xff6b6b, 0x5459f9, 0x8a54f9, 0x5459f9, 0xff6b6b, 0x5459f9, 0x5459f9, 0xff6b6b, 0x5459f9, 0x8a54f9, 0x5459f9, 0x5459f9, 0x8a54f9, 0x8a54f9, 0x5459f9, 0x8a54f9, 0x8a54f9, 0x8a54f9, 0x8a54f9, 0x5459f9, 0xff6b6b, 0x5459f9, 0x8a54f9, 0x8a54f9, 0x8a54f9, 0x5459f9, 0x8a54f9, 0x8a54f9, 0x8a54f9, 0x5459f9, 0xff6b6b, 0x5459f9, 0x8a54f9, 0x8a54f9, 0x5459f9, 0xff6b6b, 0x5459f9, 0x8a54f9, 0x5459f9, 0x5459f9, 0x8a54f9, 0x8a54f9, 0x8a54f9, 0x5459f9, 0xff6b6b, 0x5459f9, 0x8a54f9, 0x5459f9, 0xff6b6b, 0x5459f9, 0x5459f9, 0x8a54f9, 0x5459f9, 0x8a54f9, 0x8a54f9, 0x5459f9, 0x8a54f9, 0x5459f9, 0xff6b6b, 0x5459f9, 0x5459f9, 0x5459f9, 0xff6b6b, 0x5459f9, 0x8a54f9, 0x8a54f9, 0x8a54f9, 0x8a54f9, 0x8a54f9, 0x5459f9, 0xff6b6b, 0x5459f9, 0x8a54f9, 0x8a54f9, 0x8a54f9, 0x5459f9, 0x8a54f9, 0x5459f9, 0xff6b6b, 0x5459f9, 0x8a54f9, 0x5459f9, 0xff6b6b, 0x5459f9, 0x8a54f9, 0x5459f9, 0x8a54f9, 0x8a54f9, 0x8a54f9, 0x5459f9, 0xff6b6b, 0x5459f9, 0x5459f9, 0x5459f9, 0x8a54f9, 0x8a54f9, 0x5459f9, 0xff6b6b, 0x5459f9, 0x8a54f9, 0x8a54f9, 0x8a54f9, 0x8a54f9, 0x8a54f9, 0x5459f9, 0x8a54f9, 0x8a54f9, 0x8a54f9, 0x8a54f9, 0x8a54f9, 0x5459f9, 0xff6b6b, 0x5459f9, 0x8a54f9, 0x5459f9, 0xff6b6b, 0x5459f9, 0x8a54f9, 0x8a54f9, 0x8a54f9, 0x8a54f9, 0x5459f9, 0x8a54f9, 0x8a54f9, 0x8a54f9, 0x8a54f9, 0x5459f9, 0x8a54f9, 0x5459f9, 0x8a54f9, 0x8a54f9, 0x8a54f9, 0x5459f9, 0x5459f9, 0x8a54f9, 0x5459f9, 0x8a54f9, 0x8a54f9, 0x8a54f9, 0x8a54f9, 0x5459f9, 0x5459f9, 0xff6b6b, 0x5459f9, 0x8a54f9, 0x8a54f9, 0x8a54f9, 0x8a54f9, 0x5459f9, 0x8a54f9, 0x8a54f9, 0x8a54f9, 0x5459f9, 0xff6b6b, 0x5459f9, 0x8a54f9, 0x8a54f9, 0x8a54f9, 0x5459f9, 0xff6b6b, 0x5459f9, 0x8a54f9, 0x8a54f9, 0x5459f9, 0x8a54f9, 0x8a54f9, 0x8a54f9, 0x8a54f9, 0x8a54f9, 0x8a54f9, 0x8a54f9, 0x8a54f9, 0x5459f9, 0x8a54f9, 0x8a54f9, 0x8a54f9, 0x5459f9, 0x5459f9, 0xff6b6b, 0x5459f9, 0xff6b6b, 0x5459f9, 0x8a54f9, 0x8a54f9, 0x8a54f9, 0x8a54f9, 0x5459f9, 0x5459f9, 0x8a54f9, 0x8a54f9, 0x5459f9, 0x8a54f9, 0x8a54f9, 0x8a54f9, 0x5459f9, 0x8a54f9, 0x8a54f9, 0x8a54f9, 0x5459f9, 0x5459f9, 0x8a54f9, 0x8a54f9, 0x8a54f9, 0x8a54f9, 0x8a54f9, 0x8a54f9, 0x5459f9, 0x8a54f9, 0x8a54f9, 0x8a54f9, 0x5459f9, 0x8a54f9, 0x8a54f9, 0x8a54f9, 0x5459f9, 0x8a54f9, 0x8a54f9, 0x8a54f9, 0x5459f9, 0x8a54f9, 0x5459f9, 0xff6b6b, 0x5459f9, 0x8a54f9, 0x8a54f9, 0x5459f9, 0x8a54f9, 0x8a54f9, 0x5459f9, 0x8a54f9, 0x8a54f9, 0x8a54f9, 0x8a54f9, 0x8a54f9, 0x8a54f9, 0x8a54f9, 0x5459f9, 0x8a54f9, 0x8a54f9, 0x5459f9, 0x5459f9, 0x8a54f9, 0x8a54f9, 0x5459f9, 0x8a54f9, 0x8a54f9, 0x8a54f9, 0x8a54f9, 0x5459f9, 0xff6b6b, 0x5459f9, 0x5459f9, 0x8a54f9, 0x5459f9, 0xff6b6b, 0x5459f9, 0x8a54f9, 0x8a54f9, 0x8a54f9, 0x5459f9, 0xff6b6b, 0x5459f9, 0x8a54f9, 0x5459f9, 0x8a54f9, 0x8a54f9, 0x8a54f9, 0x5459f9, 0xff6b6b, 0x5459f9, 0x5459f9, 0x8a54f9, 0x8a54f9, 0x8a54f9, 0x8a54f9, 0x5459f9, 0xff6b6b, 0x5459f9, 0x8a54f9, 0x8a54f9, 0x8a54f9, 0x5459f9, 0x8a54f9, 0x8a54f9, 0x8a54f9, 0x8a54f9, 0x8a54f9, 0x5459f9, 0x8a54f9, 0x8a54f9, 0x8a54f9, 0x8a54f9, 0x8a54f9, 0x5459f9, 0x8a54f9, 0x8a54f9, 0x8a54f9, 0x8a54f9, 0x5459f9, 0x8a54f9, 0x8a54f9, 0x8a54f9, 0x5459f9, 0x8a54f9, 0x8a54f9, 0x8a54f9, 0x5459f9, 0x8a54f9, 0x5459f9, 0x8a54f9, 0x8a54f9, 0x8a54f9, 0x8a54f9, 0x8a54f9, 0x5459f9, 0xff6b6b, 0x5459f9, 0x8a54f9, 0x8a54f9, 0x8a54f9, 0x8a54f9, 0x5459f9, 0xff6b6b, 0x5459f9, 0x8a54f9, 0x8a54f9, 0x5459f9, 0xff6b6b, 0x5459f9, 0x5459f9, 0x8a54f9, 0x8a54f9, 0x8a54f9, 0x8a54f9, 0x8a54f9, 0x8a54f9, 0x5459f9, 0x8a54f9, 0x8a54f9, 0x8a54f9, 0x8a54f9, 0x5459f9, 0xff6b6b, 0x5459f9, 0x8a54f9, 0x8a54f9, 0x8a54f9, 0x8a54f9, 0x8a54f9, 0x5459f9, 0x8a54f9, 0x8a54f9, 0x8a54f9, 0x8a54f9, 0x8a54f9, 0x5459f9, 0xff6b6b, 0x8a54f9, 0x5459f9, 0x8a54f9, 0x8a54f9, 0x8a54f9, 0x5459f9, 0x8a54f9, 0xff6b6b, 0x5459f9, 0x5459f9, 0x8a54f9, 0xff6b6b, 0x5459f9, 0x8a54f9, 0x8a54f9, 0x5459f9, 0x8a54f9, 0x000000, 0x000000, 0x8a54f9, 0x5459f9, 0x8a54f9, 0x000000, 0x000000, 0x8a54f9, 0x5459f9, 0x8a54f9, 0x000000, 0x8a54f9, 0x000000, 0x8a54f9, 0x5459f9, 0x8a54f9, 0x000000, 0x8a54f9, 0x000000, 0x000000, 0x000000, 0x8a54f9, 0x5459f9, 0x8a54f9, 0x000000, 0x8a54f9, 0x000000, 0x8a54f9, 0x8a54f9, 0x000000, 0x5459f9, 0x8a54f9, 0x000000, 0x000000, 0x000000, 0x8a54f9, 0x8a54f9, 0x000000, 0x8a54f9, 0x8a54f9, 0x000000, 0x5459f9, 0x8a54f9, 0x8a54f9, 0x000000, 0x8a54f9, 0x5459f9, 0xff6b6b, 0x000000, 0x000000, 0x000000, 0x5459f9, 0xff6b6b, 0x5459f9, 0x000000, 0x5459f9, 0xff6b6b, 0x5459f9, 0x8a54f9, 0x8a54f9, 0x000000, 0x8a54f9, 0x000000, 0x000000, 0x8a54f9, 0x000000, 0x8a54f9, 0x8a54f9, 0x000000, 0x5459f9, 0x8a54f9, 0x000000, 0x000000, 0x8a54f9, 0x000000, 0x8a54f9, 0x5459f9, 0x8a54f9, 0x8a54f9, 0x000000, 0x8a54f9, 0x5459f9, 0x8a54f9, 0x000000, 0x8a54f9, 0x000000, 0x000000, 0x8a54f9, 0x8a54f9, 0x5459f9, 0xff6b6b, 0x5459f9, 0x8a54f9, 0x000000, 0x000000, 0x8a54f9, 0x5459f9, 0x8a54f9, 0x8a54f9, 0x000000, 0x8a54f9, 0x8a54f9, 0x000000, 0x000000, 0x000000, 0x8a54f9, 0x000000, 0x8a54f9, 0x000000, 0x5459f9, 0x5459f9, 0x8a54f9, 0x8a54f9, 0x000000, 0x000000, 0x000000, 0x000000, 0x8a54f9, 0x5459f9, 0x8a54f9, 0x000000, 0x8a54f9, 0x5459f9, 0x000000, 0x8a54f9, 0x000000, 0x000000, 0x000000
	
	#goal region
	goalRegion: .word 0x002d81, 0x00ff39, 0x00ff39, 0x002d81, 0x00ff39, 0x00ff39, 0x00ff39, 0xff5a00, 0x00ff39, 0x00ff39, 0x00ff39, 0x002d81, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x002d81, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x002d81, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0xff5a00, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x002d81, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x002d81, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0xff5a00, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x002d81, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x002d81, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x002d81, 0x00ff39, 0x00ff39, 0x00ff39, 0xff5a00, 0x00ff39, 0x00ff39, 0x00ff39, 0x002d81, 0x00ff39, 0x00ff39, 0x002d81, 0x00ff39, 0xff5a00, 0xff5a00, 0x002d81, 0x00ff39, 0x002d81, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0xff5a00, 0x00ff39, 0x00ff39, 0x002d81, 0x00ff39, 0x00ff39, 0xff5a00, 0xff5a00, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0xff5a00, 0xff5a00, 0x00ff39, 0xff5a00, 0x00ff39, 0x00ff39, 0x002d81, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0xff5a00, 0xff5a00, 0x00ff39, 0x00ff39, 0x00ff39, 0x002d81, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0xff5a00, 0xff5a00, 0xff5a00, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0xff5a00, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0xff5a00, 0x00ff39, 0x002d81, 0x00ff39, 0x00ff39, 0xff5a00, 0xff5a00, 0x00ff39, 0x00ff39, 0x002d81, 0x00ff39, 0xff5a00, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0xff5a00, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0xff5a00, 0xff5a00, 0xff5a00, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x002d81, 0x00ff39, 0x00ff39, 0x00ff39, 0xff5a00, 0xff5a00, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x002d81, 0x00ff39, 0x00ff39, 0xff5a00, 0x00ff39, 0xff5a00, 0xff5a00, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0xff5a00, 0xff5a00, 0x00ff39, 0x00ff39, 0x002d81, 0x00ff39, 0x00ff39, 0xff5a00, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x002d81, 0x00ff39, 0x002d81, 0xff5a00, 0xff5a00, 0x00ff39, 0x002d81, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0xff5a00, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0xff5a00, 0x00ff39, 0x00ff39, 0x00ff39, 0x002d81, 0x00ff39, 0x002d81, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0xff5a00, 0xff5a00, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0xff5a00, 0xff5a00, 0x00ff39, 0x00ff39, 0x002d81, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0xff5a00, 0x00ff39, 0x00ff39, 0x002d81, 0x00ff39, 0x00ff39, 0x00ff39, 0xff5a00, 0x002d81, 0xff5a00, 0x00ff39, 0x00ff39, 0x002d81, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x002d81, 0x00ff39, 0x00ff39, 0xff5a00, 0x002d81, 0xff5a00, 0x00ff39, 0x00ff39, 0x00ff39, 0x002d81, 0x00ff39, 0x00ff39, 0xff5a00, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x002d81, 0x00ff39, 0x00ff39, 0xff5a00, 0xff5a00, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0xff5a00, 0xff5a00, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x002d81, 0x00ff39, 0x002d81, 0x00ff39, 0x00ff39, 0x00ff39, 0xff5a00, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0xff5a00, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x002d81, 0x00ff39, 0x00ff39, 0x00ff39, 0x002d81, 0x00ff39, 0x00ff39, 0xff5a00, 0xff5a00, 0x00ff39, 0x00ff39, 0x00ff39, 0xff5a00, 0xff5a00, 0xff5a00, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0xff5a00, 0xff5a00, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x002d81, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x002d81, 0x00ff39, 0xff5a00, 0xff5a00, 0x002d81, 0x00ff39, 0x00ff39, 0xff5a00, 0x00ff39, 0x002d81, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x002d81, 0x00ff39, 0xff5a00, 0x00ff39, 0x00ff39, 0x002d81, 0xff5a00, 0xff5a00, 0x00ff39, 0x002d81, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x002d81, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0xff5a00, 0xff5a00, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0xff5a00, 0xff5a00, 0xff5a00, 0x00ff39, 0x00ff39, 0x00ff39, 0xff5a00, 0xff5a00, 0x00ff39, 0x00ff39, 0x002d81, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0xff5a00, 0x00ff39, 0x00ff39, 0xff5a00, 0xff5a00, 0x00ff39, 0x00ff39, 0x002d81, 0x00ff39, 0x00ff39, 0x002d81, 0x00ff39, 0x00ff39, 0x002d81, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x002d81, 0x00ff39, 0x00ff39, 0xff5a00, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x002d81, 0x00ff39, 0x00ff39, 0x002d81, 0x00ff39, 0x002d81, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0xff5a00, 0x00ff39, 0x00ff39, 0xff5a00, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0xff5a00, 0xff5a00, 0x00ff39, 0x00ff39, 0x00ff39, 0x002d81, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0xff5a00, 0xff5a00, 0xff5a00, 0xff5a00, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x002d81, 0x00ff39, 0x00ff39, 0x00ff39, 0xff5a00, 0xff5a00, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0xff5a00, 0x00ff39, 0x00ff39, 0xff5a00, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x002d81, 0x00ff39, 0x002d81, 0x00ff39, 0x00ff39, 0x002d81, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0xff5a00, 0x00ff39, 0x00ff39, 0x002d81, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x002d81, 0x00ff39, 0x00ff39, 0x002d81, 0x00ff39, 0x00ff39, 0x002d81, 0x00ff39, 0x00ff39, 0xff5a00, 0xff5a00, 0x00ff39, 0x00ff39, 0xff5a00, 0x00ff39, 0x002d81, 0x00ff39, 0x002d81, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0xff5a00, 0xff5a00, 0xff5a00, 0x00ff39, 0xff5a00, 0x00ff39, 0xff5a00, 0xff5a00, 0xff5a00, 0x00ff39, 0xff5a00, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0xff5a00, 0xff5a00, 0xff5a00, 0xff5a00, 0x00ff39, 0x00ff39, 0xff5a00, 0xff5a00, 0x002d81, 0x002d81, 0x00ff39, 0xff5a00, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0xff5a00, 0xff5a00, 0xff5a00, 0x00ff39, 0xff5a00, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0xff5a00, 0x00ff39, 0x00ff39, 0xff5a00, 0xff5a00, 0x00ff39, 0x002d81, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0xff5a00, 0x00ff39, 0xff5a00, 0xff5a00, 0x00ff39, 0x002d81, 0x002d81, 0x00ff39, 0xff5a00, 0xff5a00, 0x00ff39, 0xff5a00, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x002d81, 0x00ff39, 0xff5a00, 0xff5a00, 0x00ff39, 0x00ff39, 0xff5a00, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0xff5a00, 0x00ff39, 0xff5a00, 0xff5a00, 0xff5a00, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0xff5a00, 0x00ff39, 0x002d81, 0x002d81, 0xff5a00, 0xff5a00, 0x00ff39, 0x00ff39, 0xff5a00, 0xff5a00, 0xff5a00, 0xff5a00, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0xff5a00, 0x00ff39, 0xff5a00, 0xff5a00, 0xff5a00, 0x00ff39, 0xff5a00, 0x00ff39, 0xff5a00, 0xff5a00, 0xff5a00, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x002d81, 0x00ff39, 0x002d81, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0xff5a00, 0x002d81, 0x002d81, 0x002d81, 0xff5a00, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0xff5a00, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x002d81, 0x00ff39, 0x002d81, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0xff5a00, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0xff5a00, 0xff5a00, 0xff5a00, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0xff5a00, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0xff5a00, 0x00ff39, 0xff5a00, 0x00ff39, 0xff5a00, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0xff5a00, 0x00ff39, 0xff5a00, 0x00ff39, 0xff5a00, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0xff5a00, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0xff5a00, 0xff5a00, 0xff5a00, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0xff5a00, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x002d81, 0x00ff39, 0x002d81, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0xff5a00, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0xff5a00, 0x002d81, 0x002d81, 0x002d81, 0xff5a00, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0xff5a00, 0xff5a00, 0x002d81, 0x00ff39, 0x002d81, 0x00ff39, 0xff5a00, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0xff5a00, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0xff5a00, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0xff5a00, 0x00ff39, 0x00ff39, 0x002d81, 0x002d81, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x002d81, 0x00ff39, 0x00ff39, 0x00ff39, 0xff5a00, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0xff5a00, 0x00ff39, 0x00ff39, 0x00ff39, 0x002d81, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x002d81, 0x002d81, 0x00ff39, 0x00ff39, 0xff5a00, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0xff5a00, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0xff5a00, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0xff5a00, 0x00ff39, 0x002d81, 0x00ff39, 0x002d81, 0xff5a00, 0xff5a00, 0x00ff39, 0x00ff39, 0x00ff39, 0xff5a00, 0xff5a00, 0x00ff39, 0xff5a00, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x00ff39, 0x00ff39, 0x002d81, 0x00ff39, 0x00ff39, 0xff5a00, 0x00ff39, 0x00ff39, 0x002d81, 0x00ff39, 0x00ff39, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x00ff39, 0xff5a00, 0x00ff39, 0x00ff39, 0xff5a00, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0xff5a00, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0xff5a00, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0xff5a00, 0x00ff39, 0x00ff39, 0xff5a00, 0x00ff39, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x00ff39, 0x00ff39, 0x002d81, 0x00ff39, 0x00ff39, 0xff5a00, 0x00ff39, 0x00ff39, 0x002d81, 0x00ff39, 0x00ff39, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0xff5a00, 0x00ff39, 0xff5a00, 0xff5a00, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0xff5a00, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0xff5a00, 0x00ff39, 0x00ff39, 0xff5a00, 0x00ff39, 0x00ff39, 0x00ff39, 0xff5a00, 0xff5a00, 0x00ff39, 0x00ff39, 0x00ff39, 0xff5a00, 0xff5a00, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0xff5a00, 0x002d81, 0xff5a00, 0x00ff39, 0x00ff39, 0x00ff39, 0xff5a00, 0xff5a00, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0xff5a00, 0xff5a00, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0xff5a00, 0xff5a00, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0xff5a00, 0xff5a00, 0x00ff39, 0x00ff39, 0x00ff39, 0xff5a00, 0x002d81, 0xff5a00, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0xff5a00, 0xff5a00, 0x00ff39, 0x00ff39, 0x00ff39, 0xff5a00, 0xff5a00, 0x00ff39, 0x00ff39, 0x00ff39, 0xff5a00, 0x00ff39, 0x00ff39, 0xff5a00, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0xff5a00, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x002d81, 0x00ff39, 0x002d81, 0xff5a00, 0x00ff39, 0x00ff39, 0xff5a00, 0xff5a00, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0xff5a00, 0xff5a00, 0x00ff39, 0x002d81, 0x00ff39, 0x00ff39, 0x002d81, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0xff5a00, 0x00ff39, 0x00ff39, 0x00ff39, 0x002d81, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0xff5a00, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0xff5a00, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x002d81, 0x00ff39, 0x00ff39, 0x00ff39, 0xff5a00, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x002d81, 0x00ff39, 0x00ff39, 0x002d81, 0x00ff39, 0xff5a00, 0xff5a00, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0xff5a00, 0xff5a00, 0x00ff39, 0x00ff39, 0xff5a00, 0x002d81, 0x00ff39, 0x002d81, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0xff5a00, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x002d81, 0x002d81, 0x00ff39, 0x00ff39, 0xff5a00, 0x00ff39, 0x002d81, 0x00ff39, 0xff5a00, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0xff5a00, 0x00ff39, 0x00ff39, 0x00ff39, 0xff5a00, 0x002d81, 0x00ff39, 0x00ff39, 0xff5a00, 0x00ff39, 0x00ff39, 0xff5a00, 0x00ff39, 0x00ff39, 0x00ff39, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x00ff39, 0x00ff39, 0x00ff39, 0xff5a00, 0x00ff39, 0x00ff39, 0xff5a00, 0x00ff39, 0x00ff39, 0x002d81, 0xff5a00, 0x00ff39, 0x00ff39, 0x00ff39, 0xff5a00, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0xff5a00, 0x00ff39, 0x002d81, 0x00ff39, 0xff5a00, 0x00ff39, 0x00ff39, 0x002d81, 0x002d81, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0xff5a00, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x002d81, 0x00ff39, 0x00ff39, 0xff5a00, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x00ff39, 0xff5a00, 0x00ff39, 0xff5a00, 0xff5a00, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0xff5a00, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0xff5a00, 0x00ff39, 0x00ff39, 0x00ff39, 0xff5a00, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0xff5a00, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0xff5a00, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0xff5a00, 0x00ff39, 0x00ff39, 0x00ff39, 0xff5a00, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0xff5a00, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0xff5a00, 0xff5a00, 0x00ff39, 0xff5a00, 0x00ff39, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0xff5a00, 0x00ff39, 0x00ff39, 0x002d81, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x002d81, 0x00ff39, 0xff5a00, 0x00ff39, 0x00ff39, 0xff5a00, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0xff5a00, 0xff5a00, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x002d81, 0x00ff39, 0x002d81, 0x00ff39, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0xff5a00, 0x00ff39, 0x00ff39, 0x002d81, 0x00ff39, 0x00ff39, 0x00ff39, 0xff5a00, 0xff5a00, 0x00ff39, 0x00ff39, 0x002d81, 0x00ff39, 0x00ff39, 0xff5a00, 0xff5a00, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0xff5a00, 0xff5a00, 0x00ff39, 0x00ff39, 0x002d81, 0x00ff39, 0x00ff39, 0xff5a00, 0xff5a00, 0x00ff39, 0x00ff39, 0x00ff39, 0x002d81, 0x00ff39, 0x00ff39, 0xff5a00, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x00ff39, 0x002d81, 0x00ff39, 0x002d81, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0xff5a00, 0xff5a00, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0xff5a00, 0x00ff39, 0x00ff39, 0xff5a00, 0x00ff39, 0x002d81, 0x00ff39, 0x00ff39, 0x002d81, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0xff5a00, 0x002d81, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x002d81, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0xff5a00, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0xff5a00, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0xff5a00, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0xff5a00, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0xff5a00, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0xff5a00, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x002d81, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x002d81, 0xff5a00, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x00ff39, 0x002d81, 0xff5a00, 0xff5a00, 0xff5a00, 0x00ff39, 0xff5a00, 0x00ff39, 0xff5a00, 0xff5a00, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0xff5a00, 0xff5a00, 0xff5a00, 0x00ff39, 0xff5a00, 0x00ff39, 0xff5a00, 0x00ff39, 0xff5a00, 0x00ff39, 0xff5a00, 0xff5a00, 0xff5a00, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0xff5a00, 0xff5a00, 0x00ff39, 0x00ff39, 0x00ff39, 0xff5a00, 0xff5a00, 0x00ff39, 0xff5a00, 0xff5a00, 0x00ff39, 0xff5a00, 0xff5a00, 0xff5a00, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0xff5a00, 0xff5a00, 0xff5a00, 0x00ff39, 0xff5a00, 0xff5a00, 0x00ff39, 0xff5a00, 0xff5a00, 0x00ff39, 0x00ff39, 0x00ff39, 0xff5a00, 0xff5a00, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0xff5a00, 0xff5a00, 0xff5a00, 0x00ff39, 0xff5a00, 0x00ff39, 0xff5a00, 0x00ff39, 0xff5a00, 0x00ff39, 0xff5a00, 0xff5a00, 0xff5a00, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0x002d81, 0xff5a00, 0xff5a00, 0x00ff39, 0xff5a00, 0x00ff39, 0xff5a00, 0xff5a00, 0xff5a00
	
	# Frog
	frogUp: .word 0x000000, 0x0fff00, 0x000000, 0x000000, 0x000000, 0x000000, 0x0fff00, 0x000000, 0x0fff00, 0x0fff00, 0x000000, 0xf0ff00, 0xf0ff00, 0x000000, 0x0fff00, 0x0fff00, 0x000000, 0x0fff00, 0xc300ff, 0xf0ff00, 0xf0ff00, 0xc300ff, 0x0fff00, 0x000000, 0x000000, 0x0fff00, 0x0fff00, 0x0fff00, 0xf0ff00, 0x0fff00, 0x0fff00, 0x000000, 0x000000, 0x000000, 0x0fff00, 0xf0ff00, 0xf0ff00, 0x0fff00, 0x000000, 0x000000, 0x000000, 0x0fff00, 0x0fff00, 0xf0ff00, 0xf0ff00, 0x0fff00, 0x0fff00, 0x000000, 0x0fff00, 0x0fff00, 0x000000, 0x0fff00, 0x0fff00, 0x000000, 0x0fff00, 0x0fff00, 0x000000, 0x0fff00, 0x000000, 0x000000, 0x000000, 0x000000, 0x0fff00, 0x000000
	frogLeft: .word 0x000000, 0x0fff00, 0x000000, 0x000000, 0x000000, 0x000000, 0x0fff00, 0x000000, 0x0fff00, 0x0fff00, 0x0fff00, 0x0fff00, 0x000000, 0x0fff00, 0x0fff00, 0x0fff00, 0x000000, 0x000000, 0xc300ff, 0x0fff00, 0x0fff00, 0x0fff00, 0x000000, 0x000000, 0x000000, 0xf0ff00, 0xf0ff00, 0xf0ff00, 0xf0ff00, 0xf0ff00, 0x0fff00, 0x000000, 0x000000, 0xf0ff00, 0xf0ff00, 0x0fff00, 0xf0ff00, 0xf0ff00, 0x0fff00, 0x000000, 0x000000, 0x000000, 0xc300ff, 0x0fff00, 0x0fff00, 0x0fff00, 0x000000, 0x000000, 0x0fff00, 0x0fff00, 0x0fff00, 0x0fff00, 0x000000, 0x0fff00, 0x0fff00, 0x0fff00, 0x000000, 0x0fff00, 0x000000, 0x000000, 0x000000, 0x000000, 0x0fff00, 0x000000
	frogRight: .word 0x000000, 0x0fff00, 0x000000, 0x000000, 0x000000, 0x000000, 0x0fff00, 0x000000, 0x0fff00, 0x0fff00, 0x0fff00, 0x000000, 0x0fff00, 0x0fff00, 0x0fff00, 0x0fff00, 0x000000, 0x000000, 0x0fff00, 0x0fff00, 0x0fff00, 0xc300ff, 0x000000, 0x000000, 0x000000, 0x0fff00, 0xf0ff00, 0xf0ff00, 0x0fff00, 0xf0ff00, 0xf0ff00, 0x000000, 0x000000, 0x0fff00, 0xf0ff00, 0xf0ff00, 0xf0ff00, 0xf0ff00, 0xf0ff00, 0x000000, 0x000000, 0x000000, 0x0fff00, 0x0fff00, 0x0fff00, 0xc300ff, 0x000000, 0x000000, 0x0fff00, 0x0fff00, 0x0fff00, 0x000000, 0x0fff00, 0x0fff00, 0x0fff00, 0x0fff00, 0x000000, 0x0fff00, 0x000000, 0x000000, 0x000000, 0x000000, 0x0fff00, 0x000000
	frogDown: .word 0x000000, 0x0fff00, 0x000000, 0x000000, 0x000000, 0x000000, 0x0fff00, 0x000000, 0x0fff00, 0x0fff00, 0x000000, 0x0fff00, 0x0fff00, 0x000000, 0x0fff00, 0x0fff00, 0x000000, 0x0fff00, 0x0fff00, 0xf0ff00, 0xf0ff00, 0x0fff00, 0x0fff00, 0x000000, 0x000000, 0x000000, 0x0fff00, 0xf0ff00, 0xf0ff00, 0x0fff00, 0x000000, 0x000000, 0x000000, 0x0fff00, 0x0fff00, 0xf0ff00, 0x0fff00, 0x0fff00, 0x0fff00, 0x000000, 0x000000, 0x0fff00, 0xc300ff, 0xf0ff00, 0xf0ff00, 0xc300ff, 0x0fff00, 0x000000, 0x0fff00, 0x0fff00, 0x000000, 0xf0ff00, 0xf0ff00, 0x000000, 0x0fff00, 0x0fff00, 0x000000, 0x0fff00, 0x000000, 0x000000, 0x000000, 0x000000, 0x0fff00, 0x000000
	
	
	# colours
	black: .word 0x000000
	waterBlue: .word 0x002d81
	white: .word 0xffffff
	
.text	
MainGameLoop:
	lb $t0, runGame
	bne $t0, 1, Exit	

	jal DrawWater
	jal DrawRoad
	jal DrawGoalRegion
	
	# draw safe zones (spawn and middle)
	lw $a0, spawnPos  
	jal DrawSafeZone
	lw $a0, safeZonePos  
	jal DrawSafeZone
	
	la $a0, frogUp
	jal DrawFrog
	
	j Exit


DrawFrog:
	la $t0, ($gp)  # $t0 stores the base address for display
	lh $t5, x
	lh $t6, y
	mul $t6, $t6, 128  # multiply y with 128 to get the number of rows in pixels
	add $t5, $t5, $t6 # add $t5 and $t6 together to get the position in total pixels (rows + shift right)
	add $t1, $t0, $t5 # the place to start drawing from
	addi $t2, $t1, 4096  # set $t2 as the end position
	addi $t1, $t1, -512 # decrement to get correct starting positing (because we increment at start of loop)
FrogColumns:
	addi $t1, $t1, 512  # increment the starting position to the next row
	beq $t1, $t2, StopDrawingFrog
	add $t3, $zero, $t1  # set $t3 = $t1
	addi $t4, $t3, 32  # set $t4 pixels away from $t3
FrogRows:
	# $t3 is the current position of the pixel
	# $t4 is the desired end position of the pixel
	beq $t3, $t4, FrogColumns  # if we reached end of row go to next column
	lw $t7, ($a0) # load the pixel color at this position
	beq $t7, 0, NextFrogPixel  # if the pixel is black, don't draw it
	sw $t7, 0($t3)  # otherwise paint the pixel at $t3
NextFrogPixel:
	addi $t3, $t3, 4  # increment $t2 to the next pixel position
	addi $a0, $a0, 4  # increment $a0 to next pixel color
	j FrogRows
StopDrawingFrog:
	jr $ra
	
	
DrawSafeZone:
	la $t0, ($gp) # $t0 stores the base address for display
	add $t1, $t0, $a0  # define start location at (512, 504)
	addi $t2, $t1, 4096 # define end location at (512, 512)
	la $t3, safeZone  # store the address of the sprite colors in $t3
DrawSafeZoneLoop: 
	beq $t1, $t2, StopSafeZoneLoop # if end pixel is reached, stop drawing
	lw $t4, ($t3)  # load the color from the sprite into $t4
	sw $t4, ($t1)	# draw the pixel on the screen
	addi $t1, $t1, 4 #increment the position counter to the next pixel
	addi $t3, $t3, 4
	j DrawSafeZoneLoop
StopSafeZoneLoop:
	jr $ra


DrawRoad:
	la $t0, ($gp) # $t0 stores the base address for display
	lw $t5, safeZonePos  # load the start of the safe zone
	add $t1, $t0, $t5  # set $t1 to the start of the safe zone of the display
	addi $t2, $t0, 65536  # set $t2 to the endpoint of the display
	lw $t3, black  # load the color black into $t3
DrawRoadLoop: 
	beq $t1, $t2, ExitDrawRoadLoop  # if we draw every pixel up to and including the last one exit the loop
	sw $t3, ($t1)  # draw the pixel at the location $t1
	addi $t1, $t1, 4  # increment $t1 to the next pixel
	j DrawRoadLoop  # restart the loop
ExitDrawRoadLoop:
	jr $ra 

	
DrawWater:
	la $t0, ($gp) # $t0 stores the base address for display and the starting pixel i.e the top left corner
	lw $t5, safeZonePos  # load the start of the safe zone
	add $t2, $t0, $t5    # set $t2 to the endpoint of the display
	lw $t3, waterBlue  # load the color black into $t3
DrawWaterLoop:
	beq $t0, $t2, ExitDrawWaterLoop  # if we draw every pixel up to and including the last one exit the loop
	sw $t3, ($t0)  # draw the pixel at the location $t1
	addi $t0, $t0, 4  # increment $t1 to the next pixel
	j DrawWaterLoop  # restart the loop
ExitDrawWaterLoop:
	jr $ra 
	
DrawGoalRegion:
	la $t0, ($gp)
	addi $t1, $t0, 8192  # assign the start position
	addi $t2, $t1, 8192  # end position which is $128x16 pixels away from start position
	la $t3, goalRegion  # load the goal region sprite
DrawGoalRegionLoop:
	beq $t1, $t2, ExitDrawGoalRegionLoop
	lw $t4, ($t3)  # load the color of the pixel
	sw $t4, ($t1)  # draw the pixel at location $t1
	addi $t1, $t1, 4  # increment the location of the pixel by 1
	addi $t3, $t3, 4  # increment the color pointer by 1
	j DrawGoalRegionLoop
ExitDrawGoalRegionLoop:
	jr $ra
	
Sleep:
	li $v0, 32
	li $a0, 1000
	syscall
	jr $ra
				
Exit:
	li $v0, 10 # terminate the program gracefully
	syscall
