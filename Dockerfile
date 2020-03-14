FROM jupyter/datascience-notebook:python-3.7.6
WORKDIR work
COPY requirements.txt .
RUN pip install -r requirements.txt
COPY . .
RUN python -m setup.py install
USER root
RUN chmod -R 777 *
