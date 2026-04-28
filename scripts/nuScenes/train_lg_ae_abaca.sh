#!/bin/bash
#OAR -q p2
#OAR -p cluster='musa'
#OAR -l host=1/gpu=1,walltime=10:00:00
#OAR -O /home/ffranco/logs/lg_ae_%jobid%.out
#OAR -E /home/ffranco/logs/lg_ae_%jobid%.err

set -e

cd /home/ffranco/code/musevae-experiments

module load conda/23.5.0
conda activate trajdiff

python main.py \
    --run_id 1 \
    --model_name lg_ae \
    --device cuda \
    --batch_size 8 \
    --lr 1e-4 \
    --ckpt_load_iter 0 \
    --max_iter 38948 \
    --ckpt_dir ckpts \
    --dt 0.5 \
    --obs_len 4 \
    --pred_len 12 \
    --dataset_dir /home/ffranco/datasets/nuScenes \
    --dataset_name nuScenes \
    --scale 1.0 \
    --heatmap_size 192 \
    --anneal_epoch 10 \
    --w_dim 10 \
    --fb 3.0
