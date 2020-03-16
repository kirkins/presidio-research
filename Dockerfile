FROM jupyter/datascience-notebook:python-3.7.6

# Add RUN statements to install packages as the $NB_USER defined in the base images.

# Add a "USER root" statement followed by RUN statements to install system packages using apt-get,
# change file permissions, etc.

# If you do switch to root, always be sure to add a "USER $NB_USER" command at the end of the
# file to ensure the image runs as a unprivileged user by default.

USER $NB_UID

WORKDIR work

COPY requirements.txt .

RUN pip install -r requirements.txt

USER root

COPY . .

EXPOSE 8888

RUN python ./setup.py install

# Switch back to jovyan to avoid accidental container runs as root
USER $NB_UID
