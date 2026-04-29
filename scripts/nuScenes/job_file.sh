#!/bin/bash
#OAR -q abaca
#OAR -l host=1/gpu=1,walltime=20:00:00
#OAR -p gpu_mem >= 20000 AND gpu_compute_capability_major >= 7
#OAR -O /home/ffranco/logs/full_pipeline_%jobid%.out
#OAR -E /home/ffranco/logs/full_pipeline_%jobid%.err

set -ex

cd /home/ffranco/code/musevae-experiments

module load conda/23.5.0
conda activate trajdiff39

echo "===== 1. LG_AE ====="
bash scripts/nuScenes/train_lg_ae_abaca.sh

echo "===== 2. LG_CVAE ====="
bash scripts/nuScenes/train_lg_cvae_abaca.sh

echo "===== 3. SG_NET ====="
bash scripts/nuScenes/train_sg_net_abaca.sh

echo "===== 4. MICRO ====="
bash scripts/nuScenes/train_micro_abaca.sh

echo "===== finished ====="
