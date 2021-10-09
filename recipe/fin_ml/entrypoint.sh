#!/bin/bash

# Run Jupyterlab
#sudo PYTHONPATH=/home/jupyter/notebook/neutron_binary/py_code/fastapi/ uvicorn main.app:application & \
sudo uvicorn --host 0.0.0.0 --port 9292 --app-dir /home/jupyter/notebook/neutron_binary/py_code/fastapi/ main:app --reload  & \

sudo runuser -l jupyter -c "/home/jupyter/.local/bin/jupyter lab --allow-root --port=8282 --ip=0.0.0.0 --no-browser"
