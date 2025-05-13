all: 03.01_Arm_Introduction

03.01_Arm_Introduction: 03.01_Arm_Introduction.o
	gcc -o 03.01_Arm_Introduction.out 03.01_Arm_Introduction.o 

03.01_Arm_Introduction.o: 03.01_Arm_Introduction.s 
	as -o 03.01_Arm_Introduction.o 03.01_Arm_Introduction.s

clean:
	rm -rf 03.01_Arm_Introduction.out 03.01_Arm_Introduction.o