# jupyterlab

## generate encrypted password for jupyter

```python
>>>from jupyter_server.auth import passwd
>>>passwd()

Enter password:
Verify password:
'sha1:XXXXxxxxXXXXxxxxXXXXxxxxXXXX'
```
https://jupyter-server.readthedocs.io/en/latest/operators/public-server.html#preparing-a-hashed-password

## How to run this container

```sh
docker run -d \
    -e JUPYTER_TOKEN='' \
    -e JUPYTER_ENABLE_LAB=yes \
    -v notebooks:/home/jovyan/notebooks \
    -p 127.0.0.1:8888:8888 \
    --name my-lab \
    --restart always \
    ghcr.io/apandey-oss/jupyterlab:latest --NotebookApp.password='<encrypted password>'
```
