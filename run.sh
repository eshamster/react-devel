#!/bin/bash

set -eux

. ${1:-setenv}

work_dir="$(pwd)/work"
if [ ! -d "${work_dir}"]; then
  mkdir ${work_dir}
fi

name="eshamster/react-devel"
docker build -t "${name}":latest .
docker run --rm -v "${work_dir}":/root/work -p ${PORT}:3000 -it "${name}":latest /bin/ash
