FROM rockylinux:9

# install packages
RUN dnf install -y vim \
		libxslt \
		ncurses \
		procps-ng \
		iproute \
		openssh-clients \
		bind-utils \
		openldap-clients \
		nmap-ncat \
		iputils \
        net-tools \
		postgresql

# add config files
COPY ./dotfiles/* /root/

# default app to run
ENTRYPOINT ["bash", "-c"]
CMD ["echo", "personal work station container"]
