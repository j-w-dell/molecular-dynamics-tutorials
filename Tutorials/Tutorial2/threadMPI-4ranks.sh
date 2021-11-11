#!/bin/bash
#SBATCH --job-name Gromacs-Job
#SBATCH -N1 --ntasks-per-node=4
#SBATCH --cpus-per-task=32
#SBATCH --ntasks-per-socket=2
#SBATCH --time=30:00
#SBATCH --gres=gpu:4
#SBATCH --account=tra21_moldyn
#SBATCH --partition=m100_usr_prod
#SBATCH --reservation=s_tra_moldyn

#load gromacs module
module load profile/lifesc
module load autoload gromacs/2020.3
export OMP_NUM_THREADS=8
#export OMP_PROC_BIND=true   

#set up for GPUdirect
export GMX_GPU_DD_COMMS=true 
export GMX_GPU_PME_PP_COMMS=true
export GMX_FORCE_UPDATE_DEFAULT_GPU=true

mdrun=$(which mdrun_thread_mpi)
cmd="$mdrun -s topol.tpr -ntomp 8 -v -ntmpi 4 -nb gpu -pme gpu -npme 1 -deffnm gmx-4tmpi"
$cmd
