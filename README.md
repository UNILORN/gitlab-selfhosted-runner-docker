# GitLab Self-Hosted Runner Docker

Docker configuration for setting up a self-hosted GitLab CI/CD runner.

## Overview

This repository contains Docker configurations to easily deploy and manage self-hosted GitLab CI/CD runners. Self-hosted runners allow you to run your CI/CD jobs on your own infrastructure, giving you more control over the environment and potentially reducing costs.

## Prerequisites

- Docker and Docker Compose installed
- A GitLab account/instance
- Runner registration token from your GitLab project or group

## Quick Start

1. Clone this repository:
   ```
   git clone https://github.com/unilorn/gitlab-selfhosted-runner-docker.git
   cd gitlab-selfhosted-runner-docker
   ```

2. Copy the example environment file:
   ```
   cp .env.example .env
   ```

3. Edit the `.env` file and add your GitLab runner registration token and other configuration options.

4. Start the runner:
   ```
   docker-compose up -d
   ```

## Configuration Options

The following environment variables can be configured in the `.env` file:

| Variable | Description | Default |
|----------|-------------|---------|
| `GITLAB_URL` | GitLab instance URL | `https://gitlab.com` |
| `RUNNER_TOKEN` | Registration token | (required) |
| `RUNNER_DESCRIPTION` | Description of the runner | `docker-runner` |
| `RUNNER_TAGS` | Comma-separated list of tags | `docker,self-hosted` |
| `CONCURRENT_JOBS` | Number of jobs to run concurrently | `1` |

## Runner Types

This repository supports multiple types of runners:

- **Basic Docker Runner**: Simple Docker-in-Docker configuration
- **Kubernetes Runner**: For deploying to Kubernetes clusters
- **Shell Runner**: For running commands directly on the host

Check the specific subdirectories for more specialized configurations.

## Maintenance

### Updating the Runner

To update the GitLab runner to the latest version:

```
docker-compose pull
docker-compose down
docker-compose up -d
```

### Logs

View runner logs:

```
docker-compose logs -f
```

## Troubleshooting

- **Runner not connecting**: Verify your registration token and GitLab URL
- **Jobs failing**: Check runner logs for specific errors
- **Runner offline**: Ensure Docker is running and the container is active

## License

MIT

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## References

Special thanks to the following resources that helped with this project:

- [GitLabセルフホストランナー Docker構成例](https://note.shiftinc.jp/n/n199fd81ce315) - Reference for Docker configuration