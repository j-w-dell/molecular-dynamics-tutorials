#!/bin/bash
#SBATCH --job-name Gromacs_Job
#SBATCH -N2 --ntasks-per-node=16
#SBATCH --cpus-per-task=8
#SBATCH --ntasks-per-socket=8
#SBATCH --time=1:00:00
#SBATCH --gres=gpu:4
#SBATCH --account=tra21_moldyn
#SBATCH --partition=m100_usr_prod
#SBATCH --reservation=s_tra_moldyn

module load profile/lifesc
module load autoload gromacs/2020.3
export OMP_NUM_THREADS=4

mdrun=$(which mdrun_mpi)
cmd="$mdrun -s topol.tpr -deffnm Pure-16MPIpin -ntomp 4 -v -maxh 1.0 -nb cpu -pme cpu -pin on"
mpirun -n 32 $cmd

