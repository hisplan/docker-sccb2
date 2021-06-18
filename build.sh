#!/bin/bash

source version.sh

docker build --tag sccb2:${version} .
