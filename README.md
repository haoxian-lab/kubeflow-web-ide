# Web-IDE for Kubeflow 
This repo aims at prepare the online coding experience for both Kubeflow and docker compose. 

# Quick start 

## Kubeflow 
Just use the `sharockys/pytorch-notebook` and `sharockys/vscode-py-cuda` in Kubeflow Jupyter Server to spawn a container, and everything will be ready to use. 


## Docker

### Jupyter
```bash
docker run --gpus all -it --rm -p 8888:8888 -v $(pwd):/workspace sharockys/cuda-notebook
```

```bash
git clone https://github.com/haoxian-lab/kubeflow-web-ide
cd kubeflow-web-ide/docker-compose-files/notebook
UID="$(id -u)" GID="$(id -g)" docker-compose up -d
```

### Code Server
```bash
git clone https://github.com/haoxian-lab/kubeflow-web-ide
cd kubeflow-web-ide/docker-compose-files/code-server
docker-compose up -d
```
Then add `code-server.localhost $IP_ADDRESS` to your `/etc/hosts`. Alternatively, you can set up a DNS record for it.   
Then with `https://code-server.localhost` in web browser, you will have the full functioning code server in your remote server.   
It's better to have TLS for using Jupyter Notebook in Code Server. So in the `docker-compose.yml` for code-server, a Caddy Reverse Proxy is set up with self-signed cert.   
This is convenient for boosting coding experience on a shared server where we use only have access to Docker but no sudo permission.   


# References

https://github.com/Tverous/pytorch-notebook
https://github.com/huggingface/transformers/blob/main/docker/transformers-all-latest-gpu/Dockerfile
