######################################################################
# CSC258H5S Fall 2021 Assembly Final Project
# University of Toronto, St. George
## Student: Name, Student Number
## Bitmap Display Configuration:
# - Unit width in pixels: 8
# - Unit height in pixels: 8
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
.text
	lw $t0, displayAddress # $t0 stores the base address for display
	li $t1, 0xff0000 # $t1 stores the red colour code
	li $t2, 0x00ff00 # $t2 stores the green colour code
	li $t3, 0x0000ff # $t3 stores the blue colour code
	sw $t1, 0($t0) # paint the first (top-left) unit red.
	sw $t2, 4($t0) # paint the second unit on the first row green. Why$t0+4?
	sw $t3, 128($t0) # paint the first unit on the second row blue. Why +128?
	
Exit:
	li $v0, 10 # terminate the program gracefully
	syscall
