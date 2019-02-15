# Azure Machine Learning Service Docker Image for Development #


## Base Image ##
This is the docker image for Azure Machine Learning service development task, its baseImage is:

__FROM tftwdockerhub/cuda_cudnn_ana_base:latest__

## Additional installed packages ##

For Azure Machine Learning service and Data Prep development:

-  Azure ML core SDK: azureml-sdk
-  Azure ML data prep: azureml-dataprep
-  Azure ML extras: azureml-sdk[notebook, etc..]
> According to the document, only __notebooks, explain, automl, contrib__ are installed, because __databricks__ and __automl_databricks__ cannot be combined with other components.
 
-  Azure ML monitoring: azureml-monitoring
-  Azure CLI 2.0 for Azure credential
> It is recommended to use ```lsb_release -cs``` in the base docker images to check the version of the OS, in this case, it is __xenial__, so author set this link manually.

For more information, please check:

-  [Azure ML core/extras SDK installation guide](https://docs.microsoft.com/en-gb/python/api/overview/azure/ml/install?view=azure-ml-py)
-  [Azure ML Data Prep SDK installation guide](https://docs.microsoft.com/en-gb/python/api/overview/azure/dataprep/intro?view=azure-dataprep-py#install)
-  [Azure ML Monitoring SDK installation guide](https://docs.microsoft.com/en-gb/python/api/overview/azure/monitoring/intro?view=azureml-monitoring-py)
-  [Azure CLI installation guide](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli-apt?view=azure-cli-latest)


## Docker Registry Repo ##

-  tftwdockerhub/azure_ml_docker_dev:latest

## Usage ##

on dsvm-gpu virtual machines


```
sudo docker pull tftwdockerhub/azure_ml_docker_dev:latest
```

remember the target port is __8889__
```
sudo nvidia-docker run -it -p 8889:8888 -v \<project-dir-path\>:/app tftwdockerhub/azure_ml_docker_dev:latest
```

In local browser, remember the target port is __8889__ and the token string on CLI screen
```
http://\<vm-ipaddress-or-dns\>:8889/?token=21c5e12xxxxxx
```
