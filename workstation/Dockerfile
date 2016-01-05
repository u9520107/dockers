FROM ubuntu:latest

RUN rm /bin/sh && ln -s /bin/bash /bin/sh


RUN apt-get update && apt-get upgrade -y

#ssh
RUN apt-get install -y openssh-server

RUN mkdir /var/run/sshd
#RUN echo 'root:root' | chpasswd
#RUN sed -i 's/PermitRootLogin without-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# SSH login fix. Otherwise user is kicked off after login
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile

EXPOSE 22


#vim
RUN apt-get install -y vim git curl

RUN useradd -ms /bin/bash jack
#RUN echo 'jack:jack' | chpasswd
RUN usermod -a -G sudo jack


USER jack
WORKDIR /home/jack

#node
RUN curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.30.1/install.sh | bash \
  && source ~/.nvm/nvm.sh \
  && nvm install v5.3.0 \
  && nvm alias default v5.3.0


#ENV NODE_PATH /root/.nvm/versions/node/v5.3.0/lib/node_modules
#ENV PATH /root/.nvm/versions/node/v5.3.0/bin:$PATH

#vim settings

USER root

COPY init.sh /root/init.sh

CMD ["/root/init.sh"]
