FROM marketplace.gcr.io/google/ubuntu1804

RUN apt-get update && apt-get install -y \
    python3.8 \
    python3-pip \
    default-jre \
    wget \
    zip

RUN apt-get install -y apt-transport-https ca-certificates curl software-properties-common && \
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add - && \
    add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable" && \
    apt-get update && \
    apt-get install -y docker-ce

RUN pip3 install pytest==5.3.5
RUN pip3 install pytest-wdl[yaml]
RUN cd /usr/local && \
    wget https://github.com/broadinstitute/cromwell/releases/download/53.1/cromwell-53.1.jar

COPY pytest_wdl_config.json /root/.pytest_wdl_config.json
