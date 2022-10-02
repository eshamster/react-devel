FROM ghcr.io/eshamster/react-devel:latest

ARG ssh_home=/root/.ssh
RUN mkdir ${ssh_home} && \
    chmod 700 ${ssh_home}

USER root
COPY id_rsa ${ssh_home}
RUN chown root:root ${ssh_home}/* && \
    chmod 600 ${ssh_home}/*

WORKDIR /root

RUN echo 'git config --global user.name ${GITHUB_USER_NAME}' >> /root/.profile && \
    echo 'git config --global user.email ${GITHUB_USER_EMAIL}' >> /root/.profile && \
    echo 'git config --global credential.helper store' >> /root/.profile && \
    echo 'test ! -f .git-credentials && echo https://${GITHUB_USER_NAME}:${GITHUB_PAT}@github.com >> .git-credentials' >> /root/.profile
