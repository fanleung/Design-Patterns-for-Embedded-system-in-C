main: main.c Action.o GraspingManipulator.o RobotArmManager.o RotatingArmJoint.o slidingArmJoint.o 
	gcc -o main main.c Action.o GraspingManipulator.o RobotArmManager.o RotatingArmJoint.o slidingArmJoint.o && del *.o
Action.o: Action.c 
	gcc -c Action.c
GraspingManipulator.o: GraspingManipulator.c
	gcc -c GraspingManipulator.c
RobotArmManager.o: RobotArmManager.c
	gcc -c RobotArmManager.c
RotatingArmJoint.o: RotatingArmJoint.c
	gcc -c RotatingArmJoint.c
slidingArmJoint.o: slidingArmJoint.c 
	gcc -c slidingArmJoint.c

clean:
	del *.o



