# If you prefer miniconda:
FROM python:3.6.8

LABEL Name=supermarioforthecompany Version=0.0.1

ENV JUPYTER_CONFIG_DIR="/opt/jupyterconfig"

EXPOSE 9999

WORKDIR /app
ADD . /app


RUN apt-get update && apt-get install -y apt-utils cmake zlib1g-dev tmux \
    && pip install --upgrade pip \
    && python3 -m pip install absl-py atari-py gin-config gym \
        jupyterlab opencv-python tensorflow npm \
    && jupyter serverextension enable --py jupyterlab \
    && git clone https://github.com/google/dopamine.git

CMD jupyter lab --ip=0.0.0.0 --port 9999 --no-browser --allow-root --NotebookApp.token='' --notebook-dir=/opt/notebooks
# CMD ["python3", "-m", "supermarioforthecompany"]
# docker run -p 9999:9999 -v c:/research/dopamine:/opt/notebooks supermarioforthecompany:latest
