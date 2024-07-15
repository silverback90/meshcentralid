FROM ubuntu:24.10
ARG DEBIAN_FRONTEND="noninteractive"
ARG TZ="America/Toronto"
#ENTRYPOINT ["bash"]
RUN apt update && apt upgrade -y && useradd meshCO --create-home --shell /bin/bash && echo 'meshCO:M3sh1n@rounD' | chpasswd && apt install nodejs npm gnupg curl libcap2-bin -y  && cd /home/meshCO/ && npm install meshcentral 
WORKDIR /home/meshCO/
VOLUME /home/meshCO/meshcentral-data/
EXPOSE 443
EXPOSE 80
CMD setcap 'cap_net_bind_service=+ep' /usr/bin/node && node ./node_modules/meshcentral 

#COMMANDS USED 



#user heredoc for run commandds, less steps the better, do ports and others later in build
#apt update && apt upgrade -y && useradd meshCO --create-home --shell /bin/bash && echo 'meshCO:M3sh1n@rounD' | chpasswd && apt install nodejs npm gnupg curl -y &&  curl -fsSL https://www.mongodb.org/static/pgp/server-7.0.asc | gpg -o /usr/share/keyrings/mongodb-server-7.0.gpg   --dearmor && echo "deb [ arch=amd64,arm64 signed-by=/usr/share/keyrings/mongodb-server-7.0.gpg ] https://repo.mongodb.org/apt/ubuntu jammy/mongodb-org/7.0 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-7.0.list && apt update && apt install -y mongodb-org 

#alternate installations as per the meshcentral install guide, now that we are using ubuntu 22.04 instead of 24 -- not working , mongodb needs to be Community Edition, not in apt
#apt update && apt upgrade -y && useradd meshCO --create-home --shell /bin/bash && echo 'meshCO:M3sh1n@rounD' | chpasswd && add-apt-repository universe && apt update && apt install nodejs npm mongodb -y

#new line , with mongo removed
# apt update && apt upgrade -y && useradd meshCO --create-home --shell /bin/bash && echo 'meshCO:M3sh1n@rounD' | chpasswd && apt install nodejs npm gnupg curl -y  && cd /home/meshCO/ && npm install meshcentral && node ./node_modules/meshcentral 



#

