FROM marketplace.gcr.io/google/ubuntu1804

RUN apt-get update && apt-get install -y \
    python3.8 \
    python3-pip \
    default-jre \
    wget \
    zip

RUN pip3 install pytest==5.3.5
RUN pip3 install pytest-wdl[yaml]
RUN cd /usr/local && \
    wget https://github.com/broadinstitute/cromwell/releases/download/53.1/cromwell-53.1.jar

COPY pytest_wdl_config.json /root/.pytest_wdl_config.json
