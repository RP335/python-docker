# Use Ubuntu as the base image
FROM ubuntu:latest

# Install required dependencies
RUN apt-get update && \
    apt-get install -y \
    curl \
    git \
    jq \
    sudo \
    && rm -rf /var/lib/apt/lists/*

# Create a non-root user (replace 'runner' with your desired username)
RUN useradd -m runner && \
    echo "runner ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/runner && \
    chmod 0440 /etc/sudoers.d/runner

# Switch to the non-root user
USER runner

# Set the working directory
WORKDIR /home/runner

# Download and configure the GitHub Actions runner
RUN mkdir actions-runner && \
    cd actions-runner && \
    curl -O -L https://github.com/actions/runner/releases/download/v2.309.0/actions-runner-linux-x64-2.309.0.tar.gz && \
    tar xzf ./actions-runner-linux-x64-2.309.0.tar.gz

# Entrypoint (adjust the registration token and repository URL)
CMD ["./config.sh", "--url", "$REPO_URL", "--token", "$GITHUB_TOKEN", "--name", "$RUNNER_NAME", "--work", "_work"]
