#!/bin/bash

source version.sh

docker login
docker tag sccb2:${version} hisplan/sccb2:${version}
docker push hisplan/sccb2:${version}
