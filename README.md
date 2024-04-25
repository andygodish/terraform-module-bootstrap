# terraform-module-bootstrap

A way to quickly bootstrap a new Terraform module that fits the standards I use at work.

### Quickstart

#### Build the Image

Depending on your cloud provider, cd into that directory and build the image:

```
cd azure

docker build -t terraform .
```

#### Creating a Module

```
mkdir new-module && cd new-module
```

Run the docker container making sure to mount your new directory to the `/copy` *(see entrypoint.sh)* directory of the container:

```
docker run -it -v $PWD:/copy terraform
```

##### entrypoint.sh

Then entrypoint of the container copies the module templates to the `/copy` directory, and the bind mount copies the files to your machine.

**Note** the files written to your PWD are set to an owner:group of 1000:1000. To change this, you'll need to build the image locally and provide the corresponding build args: 

```
docker build --build-arg UID=$(id -u) --build-arg GID=$(id -g)
```

#### Terraform files

Pretty standard stuff. The main benefit lies in the naming convention of resources. There was quite a bit of repeated variable sets that needed to be copied and pasted into new Azure modules needed throughout my company. 

### Pre-Commit Terraform

- [Git Repo](https://github.com/antonbabenko/pre-commit-terraform)

A collection of git hooks for Terraform to be used with pre-commit framework.

Relevant files:

- .pre-commit-config.yaml
- tf-validate-fix.txt

#### TLDR

The following docker container execution (note the volume mount to the root of your module) will run a series of checks as defined by the `.pre-commit-config.yaml`, also found in the root of the terraform module. 

Before running, make sure you have made your first git commit. The linter makes a check against the .tf files found in the previous commit. 

```
TAG=latest

docker run -e "USERID=$(id -u):$(id -g)" -v $(pwd):/lint -w /lint ghcr.io/antonbabenko/pre-commit-terraform:$TAG run -a
```

Part of these checks will modify this README file between these lines found below:
```
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

    # Prior documentation between these lines will be overridden

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
```