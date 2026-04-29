#!/bin/bash
python main.py \
    --run_id 1 \
    --model_name sg_net \
    --device cuda \
    --batch_size 8 \
    --lr 1e-3 \
    --ckpt_load_iter 0 \
    --max_iter 29960 \
    --ckpt_dir ckpts \
    --dt 0.5 \
    --obs_len 4 \
    --pred_len 12 \
    --dataset_dir /home/ffranco/datasets/nuScenes \
    --dataset_name nuScenes \
    --scale 1.0 \
    --heatmap_size 192 \
    --num_goal 3 \
    --pretrained_lg_path ckpts/nuScenes_lg_cvae_wD_10_lr_0.0001_fb_3.0_anneal_e_10_fcomb_2_run_1/iter_38948_lg_cvae.pt
