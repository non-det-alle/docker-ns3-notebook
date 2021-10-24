Example entry in .ssh/config to be able to open notebooks remotely. We do it with port forwarding as specified in the last line.

```
Host cnam
    HostName IP_ADDR
    User NAME
    Port PORT
    KexAlgorithms +diffie-hellman-group1-sha1
    LocalForward 8888 127.0.0.1:8888
```
Install docker in the remote machine.

To build the image (shouldn't be needed)

```
docker build -t ns3-notebook DOCKERFILE_REPO
```

Clone your ns3 project in contrib folder.

```
cd ns-3-dev/contrib && \
git clone REPO
```

To start the container in the remote machine.

```
docker run -ti -v $(pwd):/home/jovyan/work \
-e JUPYTER_ENABLE_LAB=yes -e NB_UID=$UID \
-u root --network host nondetalle/ns3-notebook
```

To stop the container.

```
docker stop CONTAINER
```

To restart the container.

```
docker start -a CONTAINER
```