FROM golang:1.12-stretch

ARG GOLANGCI_LINT_VERSION=v1.15.0

# Install build tools and linters
RUN go get -v \
  github.com/go-task/task/cmd/task \
  github.com/andrexus/git-info \
  github.com/alvaroloes/enumer \
  github.com/mjibson/esc \
  github.com/mitchellh/gox \
  github.com/tcnksm/ghr \
  github.com/mgechev/revive && \
  curl -sfL https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh | sh -s $GOLANGCI_LINT_VERSION && \
  golangci-lint --version
