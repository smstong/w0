FROM rockylinux:9

# install packages
RUN dnf install -y vim libxslt ncurses

# add config files
COPY ./dotfiles/* /root/

# default app to run
CMD ["echo", "personal work station container"]
