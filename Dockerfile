FROM silex/emacs:27.0-alpine

RUN apk add --no-cache npm git && \
    npm add -g typescript && \
    npm add -g standardx

ARG emacs_home=/root/.emacs.d

COPY init.el ${emacs_home}
RUN emacs --batch --load ${emacs_home}/init.el
COPY react-devel.el ${emacs_home}/site-lisp/
RUN emacs --batch --load ${emacs_home}/init.el

WORKDIR /root
