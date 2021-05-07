import numpy as np
import scipy
import matplotlib
import jupyter
from scipy.integrate import odeint
#%matplotlib inline
import matplotlib.pyplot as plt
from matplotlib.backends.backend_pdf import PdfPages
from mpi4py import MPI
import sys
from datetime import datetime
import sklearn
from sklearn.model_selection import StratifiedKFold
import pandas as pd
import warnings
warnings.simplefilter(action='ignore', category=FutureWarning)

## Stratified Kfold Validation Setup
rn = pd.read_csv('Outputclass.csv')
skf = StratifiedKFold(n_splits=4, shuffle=True, random_state=100)
target = rn.loc[:,'class']

trainendpts = []
testendpts = []

fold_no = 1
for train_index, test_index in skf.split(rn, target):
     train = rn.loc[train_index,:]
     traincols = (np.take(rn['output'],train_index))
     trendpts = np.asarray(traincols)
     trainendpts.append(trendpts)
     fold_no += 1

##


comm = MPI.COMM_WORLD
size = comm.Get_size()
rank = comm.Get_rank()
name = MPI.Get_processor_name()
runtime = datetime.now().time()
arr_size = 0

if rank == 0:
    #rawdata = np.transpose(np.delete(np.genfromtxt('SizeCorrectedAllOut.csv',delimiter=','),0,0))
    rawdata = trainendpts[1]
    newdata = list(rawdata.flatten())
    all_parameters = (np.delete(np.genfromtxt('params42.csv', delimiter=','),0,0))
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

t = np.linspace(0,50395, num=10080)

def func(t):
    z0 = [1,0,0,0,0,0,0] 
    trainlight = []
    fold_no = 1
    for train_index, test_index in skf.split(rn, target):
        train = rn.loc[train_index,:]
        traincols = (np.take(rn['cond'],train_index))
        lightdata = np.transpose(np.delete(np.genfromtxt('AllLightnosmooth.csv', delimiter=','),0,0))
        trlight = np.array(lightdata[[traincols]])
        trainlight.append(trlight)
        fold_no += 1
    lightdata = trainlight[1]
    arrayvalues = np.asarray([])
    end = np.zeros((len(parameters[:,0]),len(lightdata[:,0])))

   
    for i in range(len(lightdata[:,0])):
        def I(t):
            tindex = t/5
            if tindex > 10079:
                tindex = 10079
            return lightdata[i][int(tindex)]

        for j in range(len(parameters[:,0])):
           # sys.stdout.write("I am process %d of %d at %s.\n on %s.\n "  % (rank, size,runtime, name))


            if rank == 0:
                print(str(j) + '/' + str(len(parameters[:,0])) + ' on ' + str(i) + '/' + str(len(lightdata[:,0])))

            def model(z,t):
                p1 = parameters[:,0]
                p2 = parameters[:,1]
                p3 = parameters[:,2]
                p4 = parameters[:,3]
                p5 = parameters[:,4]
                p6 = parameters[:,5]
                p7 = parameters[:,6]
                p8 = parameters[:,7]
                p9 = parameters[:,8]
               # p10 = parameters[:,0]
               # p11 = parameters[:,1]
               # p12 = parameters[:,2]
               # p13 = parameters[:,3]
                
                #d4 = p1[j]
                #d5 = p2[j]
                d1 = p1[j]
                k1 = p2[j]
                d2 = p3[j]
                k2 = p4[j]
                Kd = p5[j]
                n = p6[j]
                k3 = p7[j]
                d3 = p8[j]
                k4 = p9[j]
                #d4 = p10[j]

                #d1 = 0.017885
                #k1 = 0.047588
                #d2 = 2.046781
                #k2 = 0.004567
                #Kd = 60.8035
                #n = 3.000821
                #k3 = 0.244866
                #d3 = 0.014443
                #k4 = 0.000122
               
                d4 = 0.000544
                k5 = 1.25
                d5 = 0.0000924
                k6 = 0.00144 


                Pu = z[0]
                Pb = z[1]
                Pi = z[2]
                Pa = z[3]
                mRNA = z[4]
                mCherry1 = z[5]
                mCherry2 = z[6]
 

                dPudt = d1*Pb - k1*I(t)**n/(Kd**n+I(t)**n)*Pu 
                dPbdt = k1*I(t)**n/(Kd**n+I(t)**n)*Pu + d2*Pi - d1*Pb - k2*Pb
                dPidt = k2*Pb + d3*Pa - d2*Pi - k3*Pi
                dPadt = k3*Pi - d3*Pa
                dmRNAdt = k4*Pa - d4*mRNA
                dmCherry1dt = k5*mRNA-(d5+k6)*mCherry1
                dmCherry2dt = k6*mCherry1-d5*mCherry2
                return [dPudt,dPbdt,dPidt,dPadt,dmRNAdt,dmCherry1dt,dmCherry2dt]  

            z = odeint(model,z0,t)
            mCherry2 = z[:,6]
            end[j,i] = mCherry2[-1]

    return end

model1 = np.asarray(func(t))
#gather here
model1 = comm.gather(model1,root=0)

if rank == 0:
    model1 = np.concatenate(model1)
    ydata = np.asarray(newdata)
    np.savetxt('4model_out_fold2.csv',model1,delimiter=',')
   # print('end = ', model1)
   # print(ydata)
    with open('4model_R2_fold2.csv','w') as f:
        for j in range(len(all_parameters[:,0])):
            ssr = np.sum((ydata - model1[j])**2)
            sst = np.sum((ydata - np.mean(ydata))**2)
            R2 = 1 - ssr/sst
            f.write(str(j+1) + ',' + str(R2) + '\n')

   
