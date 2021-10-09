#!/bin/bash

# Run Jupyterlab
#cd /home/jupyter/notebook
#sudo runuser -l jupyter -c "/opt/conda/bin/jupyter lab --port=9999 --ip=0.0.0.0 --no-browser"
sudo uvicorn --reload-dir /home/jupyter/notebook/neutron_binary/py_code/fastapi/ --port 9292 main.py:app --reload  & \
sudo runuser -l jupyter -c "/home/jupyter/.local/bin/jupyter lab --allow-root --port=8282 --ip=0.0.0.0 --no-browser"
