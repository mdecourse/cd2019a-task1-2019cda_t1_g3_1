        if Bv <= 0 and BBv <= 0.02:
            errorCode,position_BR=vrep.simxGetObjectPosition(clientID,BRod_handle,-1,vrep.simx_opmode_oneshot)
            errorCode,position_S=vrep.simxGetObjectPosition(clientID,Sphere_handle,-1,vrep.simx_opmode_oneshot)
            Bv =position_S[1]- position_BR[1]
            BBv =position_S[0] - position_BR[0]
            vrep.simxSetJointTargetVelocity(clientID,BRev_handle,B_KickBallVel,vrep.simx_opmode_oneshot_wait)
            
        elif Bv > 0 and BBv <= 0.02:
            errorCode,position_BR=vrep.simxGetObjectPosition(clientID,BRod_handle,-1,vrep.simx_opmode_oneshot)
            errorCode,position_S=vrep.simxGetObjectPosition(clientID,Sphere_handle,-1,vrep.simx_opmode_oneshot)
            Bv =position_S[1]- position_BR[1]
            BBv =position_S[0] - position_BR[0]
            vrep.simxSetJointTargetVelocity(clientID,BRev_handle,B_KickBallVel,vrep.simx_opmode_oneshot_wait)
            
        elif Bv <= 0 and BBv > 0.02:
            errorCode,position_BR=vrep.simxGetObjectPosition(clientID,BRod_handle,-1,vrep.simx_opmode_oneshot)
            errorCode,position_S=vrep.simxGetObjectPosition(clientID,Sphere_handle,-1,vrep.simx_opmode_oneshot)
            Bv =position_S[1]- position_BR[1]
            BBv =position_S[0] - position_BR[0]
            vrep.simxSetJointTargetVelocity(clientID,BRev_handle,0,vrep.simx_opmode_oneshot_wait)
            
        elif Bv > 0 and BBv > 0.02:
            errorCode,position_BR=vrep.simxGetObjectPosition(clientID,BRod_handle,-1,vrep.simx_opmode_oneshot)
            errorCode,position_S=vrep.simxGetObjectPosition(clientID,Sphere_handle,-1,vrep.simx_opmode_oneshot)
            Bv =position_S[1]- position_BR[1]
            BBv =position_S[0] - position_BR[0]
            vrep.simxSetJointTargetVelocity(clientID,BRev_handle,0,vrep.simx_opmode_oneshot_wait)