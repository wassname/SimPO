


sft:
    ACCELERATE_LOG_LEVEL=info accelerate launch --config_file accelerate_configs/deepspeed_zero3.yaml scripts/run_simpo.py training_configs/llama-3-2-1b-base-sft.yaml


install:
    # install mambaforge
    wget bash https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-Linux-x86_64.sh
    bash Miniforge3-Linux-x86_64.sh -b -p /workspace/miniforge3
    /workspace/miniforge3/bin/conda init zsh
    source /root/.zshrc

    # git clone https://github.com/princeton-nlp/SimPO.git

    # make env
    conda create -n handbook python=3.10
    conda activate handbook
    # install torch
    mamba install pytorch torchvision torchaudio pytorch-cuda=12.4 -c pytorch -c nvidia

    # install alignment handbook
    git clone https://github.com/huggingface/alignment-handbook.git
    cd ./alignment-handbook/
    python -m pip install .
    python -m pip install flash-attn --no-build-isolation
    cd ..
