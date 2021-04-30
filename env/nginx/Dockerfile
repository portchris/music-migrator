FROM jwilder/nginx-proxy:v0.9.0

# Build arguments
ARG UID=${USER_ID}
ARG GID=${GROUP_ID}

# Add required packages
RUN apk update && \
    apk upgrade && \
    apk add --no-cache \
		shadow \
        ca-certificates \
        curl \
        inotify-tools \
		vim \
		tzdata \
		certbot


# Add the www user
RUN addgroup  -g ${GID} -S www && \ 
	adduser -u ${UID} -S www -G www
    

# Configure build
# ENV DEBIAN_FRONTEND noninteractive
RUN rm -f /etc/localtime || true 
RUN cp /usr/share/zoneinfo/Europe/London /etc/localtime && \
    date

# Install nginx
# RUN curl -LsS http://nginx.org/keys/nginx_signing.key | apt-key add - && \
#    echo "deb http://nginx.org/packages/mainline/debian stretch nginx" | tee -a /etc/apt/sources.list.d/nginx.list && \
#    echo "deb-src http://nginx.org/packages/mainline/debian stretch nginx" | tee -a /etc/apt/sources.list.d/nginx.list && \
#    apt-get update -o Dir::Etc::sourcelist="sources.list.d/nginx.list" -o Dir::Etc::sourceparts="-" -o APT::Get::List-Cleanup="0"

# Install main software
# RUN apt-get install -y --no-install-recommends \
#   nginx

# Default nginx homepage
ADD ./default /usr/share/nginx/html

# Add config and scripts
ADD ./webserver/ /etc/nginx
ADD ./scripts /scripts
RUN chmod +x -R /scripts

# Add environment variables
ADD ./.env /etc/nginx

# Copy localhost self-signed certificates
ADD ./certs /etc/nginx/certs

# Install Certbot (LetsEncrypt)
# RUN echo "deb http://ftp.debian.org/debian stretch-backports main" >> /etc/apt/sources.list.d/stretch-backports.list && \
#	apt-get update && \
#	apt-get install -y python-certbot-nginx -t stretch-backports

EXPOSE 80 443 8083

# Execute Nginx config using environment variables to start all services
CMD ["bash", "/scripts/start.sh"]
