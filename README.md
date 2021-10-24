# Docker image with Ns-3 and jupyter/datascience-notebook

Example entry in .ssh/config to be able to open notebooks remotely. We do it with port forwarding as specified in the last line.

```
Host cnam
    HostName IP_ADDR
    User NAME
    Port PORT
    KexAlgorithms +diffie-hellman-group1-sha1
    LocalForward 8888 127.0.0.1:8888
```
[Install docker](https://docs.docker.com/get-docker/) in the remote machine.

Pull the image

```
docker pull nondetalle/ns3-notebook
```

Start the container in the remote machine.

```
docker run -ti -v $(pwd):/home/jovyan/work -e JUPYTER_ENABLE_LAB=yes -e NB_UID=$UID -e GRANT_SUDO=yes -u root --network host nondetalle/ns3-notebook
```

From the jupiter terminal or by running `docker exec -ti nondetalle/ns3-notebook start.sh`:

* Clone your ns3 project in contrib folder.

```
cd ns-3-dev/contrib && \
git clone REPO
```
* Run `waff configure [OPTIONS] && waff` to build the project.

To stop the container.

```
docker stop CONTAINER
```

To restart the container.

```
docker start -a CONTAINER
```