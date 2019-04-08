import vrep
from time import sleep
import sys, math
# child threaded script: 
# 內建使用 port 19997 若要加入其他 port, 在  serve 端程式納入
#simExtRemoteApiStart(19999)
 
vrep.simxFinish(-1)
 
clientID = vrep.simxStart('127.0.0.1', 19997, True, True, 5000, 5)
KickBallV = 20      #手把轉速設定(度/秒)
Move =0.01          #手把水平移速(m/s)
KickBallVel = -(math.pi/180)*KickBallV
 
if clientID!= -1:
    print("Connected to remote server")
else:
    print('Connection not successful')
    sys.exit('Could not connect')
 
#errorCode,Revolute_joint_handle=vrep.simxGetObjectHandle(clientID,'Prismatic_joint',vrep.simx_opmode_oneshot_wait)
errorCode,Sphere1_handle=vrep.simxGetObjectHandle(clientID,'Sphere1',vrep.simx_opmode_oneshot_wait)
errorCode,RJ1_handle=vrep.simxGetObjectHandle(clientID,'RJ1',vrep.simx_opmode_oneshot_wait)
errorCode,MJ1_handle=vrep.simxGetObjectHandle(clientID,'MJ1',vrep.simx_opmode_oneshot_wait)
#errorCode= vrep.simxStartSimulation(clientID,vrep.simx_opmode_oneshot)
#errorCode=vrep.simxSetJointTargetVelocity(clientID,'RJ1',90,number vrep.simx_opmode_oneshot_wait)
if errorCode == -1:
    print('Can not find left or right motor')
    sys.exit()
    
def stop():
    errorCode = vrep.simxStopSimulation(clientID,vrep.simx_opmode_oneshot_wait)
    
def start():
    errorCode = vrep.simxStartSimulation(clientID,vrep.simx_opmode_oneshot_wait)
    
def pause():
    errorCode = vrep.simxPauseSimulation(clientID,vrep.simx_opmode_oneshot_wait)
    
def getballposition(steps):
    for i in range(steps):
        sleep(0.1)
        pause()
        errorCode,position=vrep.simxGetObjectPosition(clientID,Sphere1_handle,-1,vrep.simx_opmode_blocking)
        print(position)
        start()
        
vrep.simxSetJointTargetVelocity(clientID,RJ1_handle,KickBallVel,vrep.simx_opmode_oneshot_wait)
vrep.simxSetJointTargetVelocity(clientID,MJ1_handle,Move,vrep.simx_opmode_oneshot_wait)
start()
sleep(1)

getballposition(10)

vrep.simxSetJointTargetVelocity(clientID,MJ1_handle,-0.1,vrep.simx_opmode_oneshot_wait)
sleep(1)
stop()


