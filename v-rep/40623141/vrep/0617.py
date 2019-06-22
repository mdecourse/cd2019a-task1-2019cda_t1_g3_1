import vrep
import keyboard
import time
import sys, math     
# child threaded script: 
# 內建使用 port 19997 若要加入其他 port, 在  serve 端程式納入
#simExtRemoteApiStart(19999)
  
vrep.simxFinish(-1)


clientID = vrep.simxStart('127.0.0.1', 19997, True, True, 5000, 5)
KickBallV = 400     
R_KickBallVel = (math.pi/180)*KickBallV
B_KickBallVel = -(math.pi/180)*KickBallV
if clientID!= -1:
    print("Connected to remote server")
else:
    print('Connection not successful')
    sys.exit('Could not connect')
    
errorCode,Sphere_handle=vrep.simxGetObjectHandle(clientID,'Sphere',vrep.simx_opmode_oneshot_wait)
errorCode,P_handle=vrep.simxGetObjectHandle(clientID,'P',vrep.simx_opmode_oneshot_wait)
errorCode,L_handle=vrep.simxGetObjectHandle(clientID,'L',vrep.simx_opmode_oneshot_wait)
errorCode,R_handle=vrep.simxGetObjectHandle(clientID,'R',vrep.simx_opmode_oneshot_wait)


vrep.simxSetJointTargetVelocity(clientID,P_handle,0,vrep.simx_opmode_oneshot_wait)
vrep.simxSetJointTargetVelocity(clientID,L_handle,0,vrep.simx_opmode_oneshot_wait)
vrep.simxSetJointTargetVelocity(clientID,R_handle,0,vrep.simx_opmode_oneshot_wait)

def speed(handle,speed):
    errorCode = vrep.simxSetJointTargetVelocity(clientID,handle,speed,vrep.simx_opmode_oneshot_wait)

vrep.simxStartSimulation(clientID,vrep.simx_opmode_oneshot_wait)
while True:
    try:
            if keyboard.is_pressed('a'): 
                speed(L_handle,R_KickBallVel)
            else:
                speed(L_handle,B_KickBallVel)
            if keyboard.is_pressed('5'):  
                speed(P_handle,200)
            else: 
                speed(P_handle,-100)

            if keyboard.is_pressed('l'):  
                speed(R_handle,B_KickBallVel)
            else:
                speed(R_handle,R_KickBallVel)

    except:
            break
#vrep.simxSetJointTargetVelocity(clientID,R1_handle,0,vrep.simx_opmode_oneshot_wait)