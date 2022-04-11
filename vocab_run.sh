#!/bin/bash
#SBATCH --account=def-denilson
#SBATCH --cpus-per-task=2
#SBATCH --time=0-2:00

module load python/3.9 scipy-stack
python3 prepare_vocab.py dataset/tacred dataset/vocab --glove_dir dataset/glove
~ 
