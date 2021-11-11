#!/bin/bash
#SBATCH --job-name Gromacs
#SBATCH -N1 --ntasks-per-node=4
#SBATCH --cpus-per-task=4
#SBATCH --ntasks-per-socket=2
#SBATCH --time=30:00
#SBATCH --gres=gpu:4
#SBATCH --account=tra21_moldyn
#SBATCH --partition=m100_usr_prod
#SBATCH --reservation=s_tra_moldyn 

#load gromacs module
module load profile/lifesc
module load autoload gromacs/2020.3
export OMP_NUM_THREADS=1

mdrun=$(which mdrun_mpi)
cmd="$mdrun -s topol.tpr -deffnm pureMPI -ntomp 1 -v -nb gpu -pme auto -nstlist 400"
mpirun -gpu -n 4 $cmd
