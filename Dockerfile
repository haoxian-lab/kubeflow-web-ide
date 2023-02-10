FROM nvidia/cuda:11.7.1-runtime-ubuntu22.04
# Set bash as the default shell
ENV SHELL=/bin/bash

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

RUN pip install \
    numpy \
    torch torchvision torchaudio \
    jupyter \
    transformers 

CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--allow-root", "--no-browser"]
EXPOSE 8888
