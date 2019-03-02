FROM launcher.gcr.io/google/debian9:latest

# Build arguments
ARG UID=${USER_ID}
ARG GID=${GROUP_ID}

# Configure build
ENV DEBIAN_FRONTEND noninteractive
RUN rm /etc/localtime && \
    ln -s /usr/share/zoneinfo/Europe/London /etc/localtime && \
    dpkg-reconfigure -f noninteractive tzdata

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
		procps \
		cron

# Add scripts
ADD ./scripts /scripts
RUN chmod +x -R /scripts

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

EXPOSE 3000

# Run supervisor to start all services
# CMD ["/bin/bash", "/scripts/start.sh"]