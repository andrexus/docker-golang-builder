FROM golang:1.15

ARG GOLANGCI_LINT_VERSION=v1.30.0

# Install build tools and linters
RUN go get -v \
  github.com/go-task/task/cmd/task \
  github.com/mjibson/esc \
  github.com/mitchellh/gox \
  github.com/tcnksm/ghr \
  github.com/mgechev/revive && \
  curl -sfL https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh | sh -s $GOLANGCI_LINT_VERSION && \
  golangci-lint --version
