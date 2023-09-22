# Use Ubuntu as the base image
FROM ubuntu:latest

# Install dependencies
RUN apt-get update && \
    apt-get install -y \
    software-properties-common \
    build-essential \
    libssl-dev \
    libffi-dev \
    python3 \
    python3-pip \
    curl \
    git \
    jq \
    iputils-ping \
    && rm -rf /var/lib/apt/lists/*

# Install GitHub Actions runner
WORKDIR /runner
RUN curl -o actions-runner-linux-x64.tar.gz -L https://github.com/actions/runner/releases/download/v2.278.0/actions-runner-linux-x64-2.278.0.tar.gz && \
    tar xzf actions-runner-linux-x64.tar.gz && \
    ./bin/installdependencies.sh

# Entrypoint
CMD ["./config.sh", "--url", $REPO_URL, "--token", $GITHUB_TOKEN, "--name", $RUNNER_NAME, "--work", "_work"]
