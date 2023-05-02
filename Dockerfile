FROM nvidia/cuda:11.7.1-cudnn8-devel-ubuntu22.04
# Set bash as the default shell
ENV SHELL=/bin/bash

ARG PYTORCH='2.0.0'
# (not always a valid torch version)
ARG INTEL_TORCH_EXT='1.11.0'
# Example: `cu102`, `cu113`, etc.
ARG CUDA='cu117'

# Build with some basic utilities
RUN apt-get update && apt-get install -y \
    sudo \
    python3.10 \
    python3-pip \
    apt-utils \
    vim \
    git 

# alias python='python3'
RUN ln -s /usr/bin/python3 /usr/bin/python

RUN pip install --no-cache-dir \
    numpy \
    torch torchvision torchaudio \
    jupyter \
    transformers@git+https://github.com/huggingface/transformers.git 

RUN pip install --no-cache-dir intel_extension_for_pytorch==$INTEL_TORCH_EXT+cpu -f https://software.intel.com/ipex-whl-stable
RUN pip install --no-cache-dir git+https://github.com/huggingface/accelerate@main#egg=accelerate
# Add bitsandbytes for mixed int8 testing
RUN pip install --no-cache-dir bitsandbytes
# For bettertransformer
RUN pip install --no-cache-dir optimum

WORKDIR /workspace
CMD ["jupyter-lab", "--ip=0.0.0.0", "--port=8888", "--allow-root", "--no-browser"]
EXPOSE 8888
