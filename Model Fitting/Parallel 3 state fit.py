import numpy as np
import scipy
import matplotlib
import jupyter
from scipy.integrate import odeint
import matplotlib.pyplot as plt
from matplotlib.backends.backend_pdf import PdfPages
from mpi4py import MPI
import sys
from datetime import datetime

## PARALLELIZE ##
comm = MPI.COMM_WORLD
size = comm.Get_size()
rank = comm.Get_rank()
name = MPI.Get_processor_name()
runtime = datetime.now().time()
arr_size = 0

if rank == 0:
    ## IMPORT RAW DATA ##
    rawdata = np.transpose(np.delete(np.genfromtxt('SizeCorrectedAllOut.csv',delimiter=','),0,0))
    newdata = list(rawdata.flatten())
    ## IMPORT PARAMETERS FROM LHS  ## 
    all_parameters = (np.delete(np.genfromtxt('params3.csv', delimiter=','),0,0))
    arr_sizes = [(int)(len(all_parameters)/size)]*size
    parameters = []
    ind = 0
    for i in range(size):
        arr_sizes[i] += i<(len(all_parameters)%size)
        parameters.append(all_parameters[ind:ind+arr_sizes[i]])
        ind += arr_sizes[i]
        #print(parameters)
else:
    parameters = None

parameters = comm.scatter(parameters, root=0)
comm.Barrier()

## EXPERIMENT TIME IN INDEXED SECONDS ##
t = np.linspace(0,50395, num=10080)

## SET UP ODES ##
def func(t):
    ## INITIAL CONDITIONS ##
    z0 = [1,0,0,0,0,0]
    ## IMPORT LIGHT PATTERNS ##
    lightdata = np.transpose(np.delete(np.genfromtxt('AllLightnosmooth.csv', delimiter=','),0,0))
    arrayvalues = np.asarray([])
    end = np.zeros((len(parameters[:,0]),len(lightdata[:,0])))

   ## LOOP THROUGH INPUTS ## 
    for i in range(len(lightdata[:,0])):
        def I(t):
            tindex = t/5
            if tindex > 10079:
                tindex = 10079
            return lightdata[i][int(tindex)]
        ## LOOP THROUGH PARAMETERS ##
        for j in range(len(parameters[:,0])):
           # sys.stdout.write("I am process %d of %d at %s.\n on %s.\n "  % (rank, size,runtime, name))


            if rank == 0:
                print(str(j) + '/' + str(len(parameters[:,0])) + ' on ' + str(i) + '/' + str(len(lightdata[:,0])))

            def model(z,t):
                ## INDEX PARAMETERS FROM SPREADSHEET ##
                p1 = parameters[:,0]
                p2 = parameters[:,1]
                p3 = parameters[:,2]
                p4 = parameters[:,3]
                p5 = parameters[:,4]
                p6 = parameters[:,5]
                p7 = parameters[:,6]
                
                d1 = p1[j]
                k1 = p2[j]
                d2 = p3[j]
                k2 = p4[j]
                Kd = p5[j]
                n = p6[j]
                k3 = p7[j]
                
                
                ## EXPERIMENTAL CONSTANTS ##
                d3 = 0.000544
                k4 = 1.25
                d4 = 0.0000924
                k5 = 0.00144 

                ## INDEX ODES ##
                Pu = z[0]
                Pb = z[1]
                Pa = z[2]
                mRNA = z[3]
                mCherry1 = z[4]
                mCherry2 = z[5]
                
                ## EQUATIONS ##
                dPudt = d1*Pb - k1*I(t)**n/(Kd**n+I(t)**n)*Pu 
                dPbdt = k1*I(t)**n/(Kd**n+I(t)**n)*Pu + d2*Pa - d1*Pb - k2*Pb
                dPadt = k2*Pb - d2*Pa
                dmRNAdt = k3*Pa - d3*mRNA
                dmCherry1dt = k4*mRNA-(d4 + k5)*mCherry1
                dmCherry2dt = k5*mCherry1-d4*mCherry2
                return [dPudt,dPbdt,dPadt,dmRNAdt,dmCherry1dt,dmCherry2dt]  
            
            ## SOLVE EQUATIONS ##
            z = odeint(model,z0,t, hmax=0.1)
            mCherry2 = z[:,5]
            ## RETERN ENDPOINT DATA ##
            end[j,i] = mCherry2[-1]

    return end

model1 = np.asarray(func(t))
#gather here
model1 = comm.gather(model1,root=0)

## GATHER ##
if rank == 0:
    model1 = np.concatenate(model1)
    ydata = np.asarray(newdata)
    ## EXPORT ENDPOINTS TO SPREADSHEET ##
    np.savetxt('3model_out.csv',model1,delimiter=',')
   # print('end = ', model1)
   # print(ydata)
   ## CALCULATE R2 AND EXPORT TO SPREADSHEET ##
    with open('3model_R2.csv','w') as f:
        for j in range(len(all_parameters[:,0])):
            ssr = np.sum((ydata - model1[j])**2)
            sst = np.sum((ydata - np.mean(ydata))**2)
            R2 = 1 - ssr/sst
            f.write(str(j+1) + ',' + str(R2) + '\n')

   
