FROM ubuntu:latest

# Install dependencies
RUN apt-get update && \
    apt-get install -y curl && \
    rm -rf /var/lib/apt/lists/*

# Install GitHub Actions runner
RUN mkdir actions-runner && \
    cd actions-runner && \
    curl -O -L https://github.com/actions/runner/releases/latest/download/actions-runner-linux-x64-2.283.1.tar.gz && \
    tar xzf ./actions-runner-linux-x64-2.283.1.tar.gz && \
    ./bin/installdependencies.sh && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /actions-runner/_diag && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /var/cache/apt

# Entrypoint
ENTRYPOINT ["/actions-runner/runsvc.sh"]
