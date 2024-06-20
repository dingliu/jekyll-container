FROM docker.io/fedora:latest

RUN dnf update -y && \
    dnf install -y \
        ruby \
        ruby-devel \
        openssl-devel \
        redhat-rpm-config \
        gcc-c++ \
        @development-tools && \
    dnf clean all

RUN mkdir -p /app && \
    groupadd --gid=1000 jekyll && \
    useradd --uid=1000 -g jekyll -m jekyll && \
    chown -R jekyll:jekyll /app

USER jekyll
WORKDIR /app

# Display Ruby version and bundler version
RUN ruby --version && bundle --version && gem install bundler jekyll

# Command to run when the container starts
CMD ["/bin/bash"]
