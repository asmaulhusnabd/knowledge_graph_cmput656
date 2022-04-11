#!/bin/bash
#SBATCH --account=def-denilson
#SBATCH --gres=gpu:1
#SBATCH --mem=16G
#SBATCH --time=0-05:00



module load python/3.9 scipy-stack
virtualenv --no-download ~/scratch/AGGCN/semeval/env
source ~/scratch/AGGCN/semeval/env/bin/activate
pip install torch --no-index
pip install tqdm

SAVE_ID=$1
python3 train.py --id $SAVE_ID --seed 0 --hidden_dim 300 --lr 0.7 --rnn_hidden 300 --num_epoch 100 --pooling max  --mlp_layers 1 --num_layers 2 --pooling_l2 0.002

#python3 eval.py saved_models/01 --dataset test

