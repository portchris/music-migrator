FROM launcher.gcr.io/google/debian9:latest

# Build arguments
ARG UID=${USER_ID}
ARG GID=${GROUP_ID}

# Add the www user
RUN groupadd -g ${GID} www && \
    useradd -u ${UID} -g ${GID} -s /bin/bash www

# Add required packages
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y --no-install-recommends \
    apt-transport-https \
    ca-certificates \
    curl \
    git \
    gnupg2 \
    inotify-tools \
    iproute2 \
    lsb-release \
    mysql-client \
    patch \
    ssh-client \
    ssmtp \
    unzip \
    wget \
    vim \
    tzdata \
    procps \
    cron \ 
    build-essential \
    zlib1g-dev \ 
    libncurses5-dev \ 
    libgdbm-dev \ 
    libnss3-dev \ 
    libssl-dev \ 
    libreadline-dev \
    libffi-dev

# Configure build
ENV DEBIAN_FRONTEND noninteractive
RUN rm -f /etc/localtime || true
RUN ln -s /usr/share/zoneinfo/Europe/London /etc/localtime && \
    dpkg-reconfigure -f noninteractive tzdata

# Install Python v3.8
RUN curl -O https://www.python.org/ftp/python/3.8.2/Python-3.8.2.tar.xz && \
    tar -xf Python-3.8.2.tar.xz && \
    cd Python-3.8.2 && \
    ./configure --enable-optimizations && \
    # Make for 2 cores (portchris server)
    make -j 2 && \ 
    make altinstall && \
    python3.8 --version && \
    apt update -y && \
    apt install -y python3-pip && \
    update-alternatives --install /usr/bin/pip pip /usr/bin/pip3 1


# Set Python environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# set work directory
ARG WEBROOT=/home/www/music-migrator/src
WORKDIR $WEBROOT

# Install dependencies
RUN pip install --upgrade pip
ADD ./requirements.txt $WEBROOT/api/requirements.txt
RUN pip install -r $WEBROOT/api/requirements.txt

# Copy Python project
# COPY . /home/www/music-migrator/src/api/

# Install NPM & Node.Js
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    nodejs

# Config
ADD ./config/ssmtp /etc/ssmtp
ADD ./config/index-before.js /home/www/index-before.js

# Setup and add default CRON tasks
# ADD ./config/cron /etc/cron.d
# RUN chmod 0644 -R /etc/cron.d/

# Runtime scripts
ADD ./scripts/start.sh /usr/local/bin/
RUN chmod +x -R /usr/local/bin/start.sh

# Initial build of virtualenv and dependencies
RUN virtualenv $WEBROOT/api/music_migrator_env

# Run start-up scripts
# NOTE: must place scripts in '/usr/local/bin' and append CMD with '; sleep infinity' to stop container shutting down 
CMD /usr/local/bin/start.sh ; sleep infinity

EXPOSE 3000 8000