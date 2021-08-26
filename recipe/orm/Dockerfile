ARG TAG=latest
FROM ubuntu:19.10 AS base
FROM continuumio/anaconda3
RUN /opt/conda/bin/conda config --add channels conda-forge && /opt/conda/bin/conda config --set channel_priority false

USER root
ENV DEBIAN_FRONTEND noninteractive
ARG QUANTLIB_VERSION=1.22
ENV QUANTLIB_VERSION ${QUANTLIB_VERSION}
ENV BOOST=/usr/include/boost
ENV LC_NUMERIC=C
ENV LANG=en_US.UTF-8
ENV LC_ALL=en_US.UTF-8

RUN apt-get update
RUN apt-get install -y  git software-properties-common
#--no-install-recommends tzdata
RUN apt-get update

RUN apt-get install -y build-essential gcc libboost-dev libboost-all-dev python3
RUN apt-get -y install cmake protobuf-compiler

#RUN git clone –recurse-submodules https://github.com/opensourcerisk/engine.git ore
RUN rm -rf QuantLib
RUN git clone https://github.com/opensourcerisk/engine.git ore
RUN  cd ore && git submodule init && git submodule update

# RUN mkdir QuantLib/build && cmake -DBOOST_ROOT=$BOOST -DBOOST_LIBRARYDIR=$BOOST/stage/lib .. && cmake .. && make -j4 && ctest -j4
RUN cd /ore && mkdir build && cd build && cmake -DBOOST_ROOT=$BOOST -DBOOST_LIBRARYDIR=$BOOST/stage/lib .. && cmake .. && make -j4 && ctest -j4

#RUN git clone –recurse-submodules https://github.com/opensourcerisk/engine.git ore
RUN rm -rf QuantLibExt
RUN git clone https://github.com/opensourcerisk/ore-swig ore-swig
RUN  cd ore-swig && git submodule init && git submodule update

# RUN mkdir QuantLib/build && cmake -DBOOST_ROOT=$BOOST -DBOOST_LIBRARYDIR=$BOOST/stage/lib .. && cmake .. && make -j4 && ctest -j4
RUN cd /ore-swig && mkdir build && cd build && cmake -DBOOST_ROOT=$BOOST -DBOOST_LIBRARYDIR=$BOOST/stage/lib .. && cmake .. && make -j4 && ctest -j4
RUN cmake && \
-D ORE=/ore && \
-D BOOST_ROOT=$BOOST_ROOT &&\
-D BOOST_LIBRARYDIR=$BOOST/stage/lib  && \
-D PYTHON_LIBRARY=/usr/local/bin/python3 && \
-D PYTHON_INCLUDE_DIR=/usr/include/python3.8 &&\
..

RUN /opt/conda/bin/conda install -y -c conda-forge ipywidgets
RUN pip install jupyter_dashboards
RUN jupyter dashboards quick-setup –sys-prefix
RUN /opt/conda/bin/conda install -y -c conda-forge  bqplot
RUN /opt/conda/bin/conda install -y -c conda-forge  pythreejs