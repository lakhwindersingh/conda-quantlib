#!/bin/bash

export MULTI_THREAD=6
export PREFIX=/opt/conda
export LD_LIBRARY_PATH=/opt/conda/lib

export CFLAGS="${CFLAGS} -I${PREFIX}/include"
export CXXFLAGS="${CFLAGS}"
export CPPFLAGS="-I${PREFIX}/include"
export LDFLAGS="${LDFLAGS} -L${PREFIX}/lib"

#./autogen.sh
#./configure --prefix=$PREFIX
#make -j ${MULTI_THREAD}

#make install
#sudo make install
#sudo ldconfig
mkdir -p ./dags ./logs ./plugins
echo "AIRFLOW_UID=$(id -u)\nAIRFLOW_GID=0" > .env

curl -LfO 'https://airflow.apache.org/docs/apache-airflow/2.1.3/docker-compose.yaml'

curl -LfO 'https://airflow.apache.org/docs/apache-airflow/2.1.3/airflow.sh'
chmod +x airflow.sh

./airflow.sh info