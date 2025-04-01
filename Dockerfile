FROM ubuntu:22.04

RUN apt-get update && \
    apt-get install \
    curl expect \
    -y
RUN mkdir actions-runner && cd actions-runner && \
    curl -o actions-runner-linux-x64-2.323.0.tar.gz -L https://github.com/actions/runner/releases/download/v2.323.0/actions-runner-linux-x64-2.323.0.tar.gz && \
    echo "0dbc9bf5a58620fc52cb6cc0448abcca964a8d74b5f39773b7afcad9ab691e19 actions-runner-linux-x64-2.323.0.tar.gz" | sha256sum -c - && \
    tar xzf ./actions-runner-linux-x64-2.323.0.tar.gz && \
    ./bin/installdependencies.sh

COPY exec-runner.sh /actions-runner/exec-runner.sh
RUN chmod +x /actions-runner/exec-runner.sh
WORKDIR /actions-runner

CMD ["/actions-runner/exec-runner.sh"]