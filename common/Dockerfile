FROM silex/emacs:28.2-alpine

RUN apk add --no-cache npm git && \
    npm add -g typescript && \
    npm add -g standardx

ARG emacs_home=/root/.emacs.d
ARG dotfiles_dir=/root/react-devel/common/dotfiles/others/react-devel

RUN mkdir -p ${emacs_home}/site-lisp/

COPY ./ /root/react-devel

RUN ln -s ${dotfiles_dir}/init.el ${emacs_home}/ && \
    ln -s ${dotfiles_dir}/react-devel.el ${emacs_home}/site-lisp/
RUN emacs --batch --load ${emacs_home}/init.el

# Remove authentication in GitHub Actions
RUN (cd /root/react-devel && git config --local --unset http.https://github.com/.extraheader || true) && \
    (cd /root/react-devel && git submodule foreach "git config --local --unset http.https://github.com/.extraheader || true")

USER root
RUN echo "export PS1='[<react-devel> \w]$ '" >> /root/.profile
WORKDIR /root
