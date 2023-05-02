# docker-cuda-Notebook

My docker cuda notebook

# Quick start


```bash
docker run --gpus all -it --rm -p 8888:8888 -v $(pwd):/workspace sharockys/cuda-notebook
```

```bash
git clone https://github.com/sharockys/docker-cuda-Notebook.git
cd docker-cuda-Notebook
UID="$(id -u)" GID="$(id -g)" docker-compose up -d
```

# References

https://github.com/Tverous/pytorch-notebook
https://github.com/huggingface/transformers/blob/main/docker/transformers-all-latest-gpu/Dockerfile
