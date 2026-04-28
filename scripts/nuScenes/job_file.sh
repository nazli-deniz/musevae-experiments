#!/bin/bash
#OAR -q abaca
#OAR -l host=1/gpu=1,walltime=20:00:00
#OAR -p 'gpu-20GB AND gpu_compute_capability_major>=7'
#OAR -O /home/ffranco/logs/full_pipeline_%jobid%.out
#OAR -E /home/ffranco/logs/full_pipeline_%jobid%.err

set -e

cd /home/ffranco/code/musevae-experiments
mkdir -p /home/ffranco/logs ckpts

module load conda/23.5.0
source $(conda info --base)/etc/profile.d/conda.sh
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