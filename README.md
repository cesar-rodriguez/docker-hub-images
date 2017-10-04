# Docker terraform providers
### Usage
This repository automatically builds containers for [`terraform`](https://terraform.io) including common providers.

##### terraform Docker Container

This container will copy the current stable version of the terraform binary into the container, and set it for use as the default entrypoint.

You can use it as follows:
```shell
docker run -i -t cesar-rodriguez/terraform <command>
```

For example:
Initialize the plugins (You will only need to do this once)

```shell
docker run -i -t -v $(pwd):/app/ -w /app/ cesar-rodriguez/terraform init
```


```shell
docker run -i -t -v $(pwd):/app/ -w /app/ cesar-rodriguez/terraform plan
```
