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
	displayAddress:	.word 0x10008000
	
	# the position of the frog, represents the top left corner of the frog
	x: .half 240  
	y: .half 480
	
	# run game if 1
	runGame: .byte 1
	
	# colours
	black: .word 0x000000
	waterBlue: .word 0x0022ff
	lightBlue: .word 0x52b7ff
	red: .word 0xff0000
	lightBrown: .word 0x754a35
	darkBrown: .word 0x423027
	frogGreen: .word 0x06cf60
	frogYellow: .word 0xf6ff00
	carPink: .word 0xff4de4
	safeZoneColor: .word 0x7530a1
	
	
.text	
MainGameLoop:
	lb $t0, runGame
	bne $t0, 1, Exit
	
	jal DrawSpawn
	jal DrawFrog
	jal Sleep

# $t1 the position to start drawing from
# $t2 the position to stop drawing each row from 
DrawFrog:
	lw $t0, displayAddress # $t0 stores the base address for display
	lh $t5, x
	lh $t6, y
	mul $t6, $t6, 128  # multiply y with 128 to get the number of rows in pixels
	add $t5, $t5, $t6 # add $t5 and $t6 together to get the position in total pixels (rows + shift right)
	add $t1, $zero, 0  # clear the $t1 register
	add $t1, $t0, $t5 # the place to start drawing from
	
	addi $t2, $zero, 0  #clear #$t2
	addi $t2, $t1, 4096  # set $t2 as the end position
	addi $t1, $t1, -512 
	
	lw $t5, frogGreen  # store the color green in $t5
FrogColumns:
	addi $t1, $t1, 512  # increment the starting position to the next row
	beq $t1, $t2, StopDrawingFrog
	addi $t3, $zero, 0  # clear $t3
	addi $t4, $zero, 0  # clear $t4
	add $t3, $t3, $t1  # set $t3 = $t1
	addi $t4, $t3, 32  # set $t4 pixels away from $t2
FrogRows:
	# $t3 is the current position of the pixel
	# $t4 is the desired end position of the pixel
	beq $t3, $t4 FrogColumns  # if we reached end of row go to next column
	sw $t5, 0($t3)  # paint the pixel at $t2
	addi $t3, $t3, 4  # increment $t2 to the next pixel
	j FrogRows
StopDrawingFrog:
	jr $ra
	
	
DrawSpawn:
	lw $t0, displayAddress # $t0 stores the base address for display
	addi $t1, $t0, 61440  # define start location at (512, 504)
	addi $t2, $t0, 65536 # define end location at (512, 512)
	lw $t3, safeZoneColor
DrawSpawnLoop: 
	beq $t1, $t2, StopSpawnLoop # if end pixel is reached, stop drawing
	sw $t3, 0($t1)	# draw the pixel on the screen
	addi $t1, $t1, 4 #increment the position counter to the next pixel
	j DrawSpawnLoop
StopSpawnLoop:
	jr $ra

Sleep:
	li $v0, 32
	li $a0, 16
	syscall
				
Exit:
	li $v0, 10 # terminate the program gracefully
	syscall
