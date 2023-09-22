# Use a Linux distribution as the base image (e.g., Ubuntu)
FROM ubuntu:latest

# Install required dependencies
RUN apt-get update && \
    apt-get install -y curl sudo && \
    rm -rf /var/lib/apt/lists/*

# Set the working directory
WORKDIR /home/runner

# Download and configure the GitHub Actions runner
RUN mkdir actions-runner && \
    cd actions-runner && \
    curl -o actions-runner-linux-x64-2.309.0.tar.gz -L https://github.com/actions/runner/releases/download/v2.309.0/actions-runner-linux-x64-2.309.0.tar.gz && \
    tar xzf ./actions-runner-linux-x64-2.309.0.tar.gz

# Entrypoint
CMD ["./config.sh", "--url", $REPO_URL, "--token", $GITHUB_TOKEN, "--name", $RUNNER_NAME, "--work", "_work"]
