FROM silex/emacs:28.2-alpine

RUN apk add --no-cache npm git && \
    npm add -g typescript && \
    npm add -g standardx

ARG emacs_home=/root/.emacs.d
ARG dotfiles_base=/root/react-devel/dotfiles/others/react-devel

RUN mkdir -p ${emacs_home}/site-lisp/

COPY ./ /root/react-devel

RUN ln -s ${dotfiles_base}/init.el ${emacs_home}/ && \
    ln -s ${dotfiles_base}/react-devel.el ${emacs_home}/site-lisp/
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

RUN echo "export PS1='[<react-devel> \w]$ '" >> /root/.profile

WORKDIR /root
