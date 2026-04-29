#!/bin/bash
set -ex

cd /home/ffranco/code/musevae-experiments

echo "ENV=$CONDA_DEFAULT_ENV"
which python
python --version
nvidia-smi
ls -lh /home/ffranco/datasets/nuScenes

python -u main.py \
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
