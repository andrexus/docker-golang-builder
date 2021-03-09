FROM golang:1.16

ARG GOLANGCI_LINT_VERSION=v1.38.0
ARG TASKFILE_VERSION=v3.2.2

# Install build tools and linters
RUN wget -q -O task.deb https://github.com/go-task/task/releases/download/$TASKFILE_VERSION/task_linux_amd64.deb && \
    dpkg -i task.deb && \
    rm -f task.deb && \
    go get -v \
    github.com/mitchellh/gox \
    github.com/mgechev/revive && \
    curl -sfL https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh | sh -s $GOLANGCI_LINT_VERSION && \
    golangci-lint --version

# Install 3rd party packages
RUN apt update && \
    apt install -y libvips-dev
