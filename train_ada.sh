#!/bin/bash
#SBATCH -A coreqode
#SBATCH -n 20
#SBATCH --gres=gpu:1
#SBATCH --partition=long
#SBATCH --nodelist=gnode82
#SBATCH --mem-per-cpu=2G
#SBATCH --time=4-00:00:00
#SBATCH --output=train_no_peel.txt


echo "+++++++++++++++++++++++++++++++++++"
echo "Date: " `date`
echo "GPU IDs: " $CUDA_VISIBLE_DEVICES
echo "Experiment name: "$1
echo "Allocated: " $NODE
echo "+++++++++++++++++++++++++++++++++++"

module load cuda/10.2

python -m apps.train_shape --dataroot /ssd_scratch/cvit/coreqode/training_data/ --random_flip --random_scale --random_trans --num_thread 0 --num_peel 1 --name peel1
