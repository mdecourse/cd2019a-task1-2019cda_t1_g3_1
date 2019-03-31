import vrep
from time import sleep
import sys, math
# child threaded script: 
# 內建使用 port 19997 若要加入其他 port, 在  serve 端程式納入
#simExtRemoteApiStart(19999)
 
vrep.simxFinish(-1)
 
clientID = vrep.simxStart('127.0.0.1', 19997, True, True, 5000, 5)
KickBallV = 20      #手把轉速設定(度/秒)
Move_Minus =-0.1          #手把水平移速(m/s)
Move_Plus =0.1
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
    errorCode,positionB=vrep.simxGetJointPosition(clientID,BRev_handle, vrep.simx_opmode_blocking)
    PB = float(int(positionB*100000))
    errorCode,position=vrep.simxGetObjectPosition(clientID,Sphere_handle,-1,vrep.simx_opmode_blocking)
    P = float(int(position[1]*100000))

    while (PB != P):
        while(P > PB):
            errorCode,position_P=vrep.simxGetJointPosition(clientID,BRev_handle, vrep.simx_opmode_blocking)
           # PB = float(int(position_P*100000))
            PB =position_P#+0.147
            errorCode,position_D=vrep.simxGetObjectPosition(clientID,Sphere_handle,-1,vrep.simx_opmode_blocking)
            #P = float(int(position_D[1]*100000))
            P =position_D[1]
            vrep.simxSetJointTargetVelocity(clientID,BMo_handle,Move_Plus,vrep.simx_opmode_oneshot_wait)
           
            print('w=',P,PB)
            if (P >PB):
                continue
        #if position[1] > 0.65:
         #   stop()
        else:
            errorCode,position_PP=vrep.simxGetJointPosition(clientID,BRev_handle, vrep.simx_opmode_blocking)
            #PB = float(int(position_PP*10000))
            PB =position_PP
            errorCode,position_DD=vrep.simxGetObjectPosition(clientID,Sphere_handle,-1,vrep.simx_opmode_blocking)
            #P = float(int(position_DD[1]*10000))
            P =position_DD[1]
            vrep.simxSetJointTargetVelocity(clientID,BMo_handle,Move_Minus,vrep.simx_opmode_oneshot_wait)
            print('e=',P,PB)
            if (P <PB):
                continue
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





