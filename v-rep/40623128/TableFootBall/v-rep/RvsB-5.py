import vrep
from time import sleep
import sys, math
# child threaded script: 
# 內建使用 port 19997 若要加入其他 port, 在  serve 端程式納入
#simExtRemoteApiStart(19999)
 
vrep.simxFinish(-1)
 
clientID = vrep.simxStart('127.0.0.1', 19997, True, True, 5000, 5)
KickBallV = 0      #手把轉速設定(度/秒)
Move_Minus =-0.1          #手把水平移速(m/s)
Move_Plus =0.1
n=1
R_KickBallVel = (math.pi/180)*KickBallV
B_KickBallVel = -(math.pi/180)*KickBallV
if clientID!= -1:
    print("Connected to remote server")
else:
    print('Connection not successful')
    sys.exit('Could not connect')
 
errorCode,Sphere_handle=vrep.simxGetObjectHandle(clientID,'Sphere',vrep.simx_opmode_oneshot_wait)
errorCode,BRev_handle=vrep.simxGetObjectHandle(clientID,'BRev',vrep.simx_opmode_oneshot_wait)
errorCode,BMo_handle=vrep.simxGetObjectHandle(clientID,'BMo',vrep.simx_opmode_oneshot_wait)
errorCode,RRev_handle=vrep.simxGetObjectHandle(clientID,'RRev',vrep.simx_opmode_oneshot_wait)
errorCode,RMo_handle=vrep.simxGetObjectHandle(clientID,'RMo',vrep.simx_opmode_oneshot_wait)

if errorCode == -1:
    print('Can not find left or right motor')
    sys.exit()
    
def stop():
    errorCode = vrep.simxStopSimulation(clientID,vrep.simx_opmode_oneshot_wait)
    
def start():
    errorCode = vrep.simxStartSimulation(clientID,vrep.simx_opmode_oneshot_wait)
    
def pause():
    errorCode = vrep.simxPauseSimulation(clientID,vrep.simx_opmode_oneshot_wait)

def getballposition():
    #for i in range(steps):
    errorCode,position_P=vrep.simxGetJointPosition(clientID,BRev_handle, vrep.simx_opmode_oneshot)
    errorCode,position_D=vrep.simxGetObjectPosition(clientID,Sphere_handle,-1,vrep.simx_opmode_oneshot)
    vv =position_D[1] - position_P
    while (n == 1):
        if vv<=0:
            errorCode,position_P=vrep.simxGetJointPosition(clientID,BRev_handle, vrep.simx_opmode_oneshot)
            errorCode,position_D=vrep.simxGetObjectPosition(clientID,Sphere_handle,-1,vrep.simx_opmode_oneshot)
            vv =position_D[1]- position_P
        elif vv>0:
            errorCode,position_P=vrep.simxGetJointPosition(clientID,BRev_handle, vrep.simx_opmode_oneshot)
            errorCode,position_D=vrep.simxGetObjectPosition(clientID,Sphere_handle,-1,vrep.simx_opmode_oneshot)
            vv =position_D[1] - position_P
        vrep.simxSetJointTargetVelocity(clientID,BMo_handle,vv,vrep.simx_opmode_oneshot_wait)
        print(position_D[1])
        print(position_P[0])
        print(vv)
vrep.simxSetJointTargetVelocity(clientID,BRev_handle,0,vrep.simx_opmode_oneshot_wait)
vrep.simxSetJointTargetVelocity(clientID,RRev_handle,R_KickBallVel,vrep.simx_opmode_oneshot_wait)
vrep.simxSetJointTargetVelocity(clientID,RMo_handle,0,vrep.simx_opmode_oneshot_wait)
positionB=vrep.simxGetJointPosition(clientID,BRev_handle, vrep.simx_opmode_blocking)

start()
getballposition()
sleep(1)
stop()


#vrep.simxSetJointTargetVelocity(clientID,BRev_handle,B_KickBallVel,vrep.simx_opmode_oneshot_wait)
#vrep.simxSetJointTargetVelocity(clientID,BMo_handle,Move,vrep.simx_opmode_oneshot_wait)

#vrep.simxSetJointTargetVelocity(clientID,RRev_handle,R_KickBallVel,vrep.simx_opmode_oneshot_wait)
#vrep.simxSetJointTargetVelocity(clientID,RMo_handle,Move,vrep.simx_opmode_oneshot_wait)





