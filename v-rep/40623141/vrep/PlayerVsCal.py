import vrep
import keyboard
from time import sleep
import sys, math
# child threaded script: 
# 內建使用 port 19997 若要加入其他 port, 在  serve 端程式納入
#simExtRemoteApiStart(19999)
 
vrep.simxFinish(-1)
 
clientID = vrep.simxStart('127.0.0.1', 19997, True, True, 5000, 5)
KickBallV = 45     #手把轉速設定(度/秒)
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
errorCode,BRod_handle=vrep.simxGetObjectHandle(clientID,'BRod',vrep.simx_opmode_oneshot_wait)
errorCode,BRev_handle=vrep.simxGetObjectHandle(clientID,'BRev',vrep.simx_opmode_oneshot_wait)
errorCode,BMo_handle=vrep.simxGetObjectHandle(clientID,'BMo',vrep.simx_opmode_oneshot_wait)
errorCode,RRev_handle=vrep.simxGetObjectHandle(clientID,'RRev',vrep.simx_opmode_oneshot_wait)
errorCode,RMo_handle=vrep.simxGetObjectHandle(clientID,'RMo',vrep.simx_opmode_oneshot_wait)
errorCode,RRod_handle=vrep.simxGetObjectHandle(clientID,'RRod',vrep.simx_opmode_oneshot_wait)
if errorCode == -1:
    print('Can not find left or right motor')
    sys.exit()
    
def stop():
    errorCode = vrep.simxStopSimulation(clientID,vrep.simx_opmode_oneshot_wait)
    
def start():
    errorCode = vrep.simxStartSimulation(clientID,vrep.simx_opmode_oneshot_wait)
    
def pause():
    errorCode = vrep.simxPauseSimulation(clientID,vrep.simx_opmode_oneshot_wait)

def speed(handle,vel):
    vrep.simxSetJointTargetVelocity(clientID,handle,vel,vrep.simx_opmode_oneshot_wait)

def getballposition():
    #for i in range(steps):
    errorCode,position_BR=vrep.simxGetObjectPosition(clientID,BRod_handle,-1,vrep.simx_opmode_oneshot)
    errorCode,position_S=vrep.simxGetObjectPosition(clientID,Sphere_handle,-1,vrep.simx_opmode_oneshot)
    errorCode,position_RR=vrep.simxGetObjectPosition(clientID,RRod_handle,-1,vrep.simx_opmode_oneshot)
    
    errorCode,RRev_pos=vrep.simxGetJointPosition(clientID,RRev_handle,vrep.simx_opmode_streaming)
    errorCode,BRev_pos=vrep.simxGetJointPosition(clientID,BRev_handle,vrep.simx_opmode_streaming)
    Bv =position_S[1] - position_BR[1]
    BBv =position_S[0] - position_BR[0]
    Rv =position_S[1] - position_RR[1]
    RRv =position_S[0] - position_RR[0]
    while (n == 1):
        
        errorCode,position_BR=vrep.simxGetObjectPosition(clientID,BRod_handle,-1,vrep.simx_opmode_oneshot)
        errorCode,position_RR=vrep.simxGetObjectPosition(clientID,RRod_handle,-1,vrep.simx_opmode_oneshot)
        errorCode,position_S=vrep.simxGetObjectPosition(clientID,Sphere_handle,-1,vrep.simx_opmode_oneshot)
        Rv =position_S[1]- position_RR[1]
        RRv =position_S[0] - position_RR[0]
        Bv =position_S[1]- position_BR[1]
        BRv =position_S[0] - position_BR[0]
        
        errorCode,RRev_pos=vrep.simxGetJointPosition(clientID,RRev_handle,vrep.simx_opmode_streaming)
        errorCode,BRev_pos=vrep.simxGetJointPosition(clientID,BRev_handle,vrep.simx_opmode_streaming)
        RRev_deg = (RRev_pos/math.pi)*180
        BRev_deg = (BRev_pos/math.pi)*180


        try: #紅色桿子
            if keyboard.is_pressed('o'): 
                vrep.simxSetJointTargetVelocity(clientID,RRev_handle,R_KickBallVel,vrep.simx_opmode_oneshot_wait)
            elif keyboard.is_pressed('p'):  
                vrep.simxSetJointTargetVelocity(clientID,RRev_handle,B_KickBallVel,vrep.simx_opmode_oneshot_wait)
            if keyboard.is_pressed('u'):  
                vrep.simxSetJointTargetVelocity(clientID,RMo_handle,0.1,vrep.simx_opmode_oneshot_wait)
            elif keyboard.is_pressed('i'):  
                vrep.simxSetJointTargetVelocity(clientID,RMo_handle,-0.1,vrep.simx_opmode_oneshot_wait)
            else:
                vrep.simxSetJointTargetVelocity(clientID,RMo_handle,0,vrep.simx_opmode_oneshot_wait)
        except:
            break 


        if position_S[0] <= 0 and BRev_deg <= -25: #球進入擊球區 and 桿子擊出 藍色桿子
            if position_BR[1]<=0.5: #桿子偏右邊
                speed(BMo_handle, 0.08)
                sleep(0.2)
                speed(BRev_handle, R_KickBallVel)
                sleep(0.2)
            elif position_BR[1] > 0.5: #桿子偏左邊
                speed(BMo_handle, -0.08)
                sleep(0.2)
                speed(BRev_handle, R_KickBallVel)
                sleep(0.2)
                
        elif position_S[0] <= 0  and  BRev_deg >=0:
            
            if Bv>= -0.01 and Bv <0.01:
                speed(BRev_handle, B_KickBallVel)
                
            else:
                speed(BRev_handle ,R_KickBallVel)
        elif position_S[0] > 0:
            speed(BRev_handle,R_KickBallVel)

        MMMB = Bv*2
        vrep.simxSetJointTargetVelocity(clientID,BMo_handle,MMMB,vrep.simx_opmode_oneshot_wait)


vrep.simxSetJointTargetVelocity(clientID,BRev_handle,0,vrep.simx_opmode_oneshot_wait)
vrep.simxSetJointTargetVelocity(clientID,RRev_handle,R_KickBallVel,vrep.simx_opmode_oneshot_wait)
vrep.simxSetJointTargetVelocity(clientID,RMo_handle,0,vrep.simx_opmode_oneshot_wait)

start()
getballposition()
stop()


