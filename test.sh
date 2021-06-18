#!/bin/bash

source version.sh

docker run -it --rm \
    --entrypoint Rscript \
    -v $(pwd)/scripts:/scripts \
    sccb2:${version} /scripts/test.R
