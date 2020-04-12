FROM silex/emacs:27.0-alpine

RUN apk add --no-cache npm git && \
    npm add -g typescript && \
    npm add -g standardx

ARG emacs_home=/root/.emacs.d

COPY init.el ${emacs_home}
RUN emacs --batch --load ${emacs_home}/init.el
COPY react-devel.el ${emacs_home}/site-lisp/
RUN emacs --batch --load ${emacs_home}/init.el

RUN echo "git config --global user.name \"\${GITHUB_USER_NAME}\"" >> /root/.profile && \
    echo "git config --global user.email \"\${GITHUB_USER_EMAIL}\"" >> /root/.profile && \
    echo "export LANG=C.UTF-8" >> /root/.profile

ARG ssh_home=/root/.ssh
RUN mkdir ${ssh_home} && \
    chmod 700 ${ssh_home}

USER root
COPY id_rsa ${ssh_home}
RUN chown root:root ${ssh_home}/* && \
    chmod 600 ${ssh_home}/*

WORKDIR /root
