#!/bin/bash
echo "build the docker image" # menampilkan teks
docker build -t item-app:v1 . # membuat image dari Dockerfile pada current directory dan memberinya label item-app serta tag v1
sleep 2 #jeda 2 detik

echo "list images" # menampilkan teks
docker images # menampilkan daftar local image
sleep 2 #jeda 2 detik

echo "rename the image" # menampilkan teks
docker tag item-app:v1 ghcr.io/fbpr/a433-microservices:v1 # mengubah nama image
sleep 2 #jeda 2 detik

echo "login GitHub Packages" # menampilkan teks
echo "$CR_PAT" | docker login ghcr.io -u "fbpr" --password-stdin # melakukan login ke github packages dengan token
sleep 2 #jeda 2 detik

echo "push the image" # menampilkan teks
docker push ghcr.io/fbpr/a433-microservices:v1 # mengunggah hasil build image ke github packages 
