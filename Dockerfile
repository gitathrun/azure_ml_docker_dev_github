# for a docker image with:
# CUDA 9.0 + cuDNN 7.x
# Anaconda 5.2 (python 3.6)
# Azure Machine Learning Service SDK
# Azure CLI 2.0.58 

FROM tftwdockerhub/cuda_cudnn_ana_base:latest

# the maintainer information
LABEL maintainer "TeleWare Data Scientist <teng.fu@teleware.com>"

# pip install azureml sdks
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        libxml++2.6-2v5 \
    && rm -rf /var/lib/apt/lists/*

RUN pip install --no-cache-dir --upgrade \
	--ignore-installed PyYAML \
	msgpack \
	azureml-sdk \
	azureml-sdk[notebooks,explain,automl,contrib] \
	azureml-dataprep \
	azureml-monitoring

# setup the work dir 
# correlate with the share-volume
WORKDIR /app

# install azure cli for az login
# dependencies
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        apt-transport-https \
        lsb-release \
        software-properties-common \
        dirmngr \
    && rm -rf /var/lib/apt/lists/*

# setup source link
# slightly different from the guide
RUN echo "deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ xenial main" | tee /etc/apt/sources.list.d/azure-cli.list

# key registry
RUN apt-key --keyring /etc/apt/trusted.gpg.d/Microsoft.gpg adv \
            --keyserver packages.microsoft.com \
            --recv-keys BC528686B50D79E339D3721CEB3E94ADBE1229CF

# update and azure-cli installation
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        azure-cli \
    && rm -rf /var/lib/apt/lists/*
