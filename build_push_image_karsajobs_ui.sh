#!/bin/bash
echo "build the docker image" # menampilkan teks
docker build -t ghcr.io/fbpr/karsajobs-ui:latest . # membuat image dari Dockerfile pada current directory dan memberinya label karsajobs-ui serta tag latest
sleep 2 #jeda 2 detik

echo "login GitHub Packages" # menampilkan teks
echo "$CR_PAT" | docker login ghcr.io -u "fbpr" --password-stdin # melakukan login ke github packages dengan token
sleep 2 #jeda 2 detik

echo "push the image" # menampilkan teks
docker push ghcr.io/fbpr/karsajobs-ui:latest # mengunggah hasil build image ke github packages 