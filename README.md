# GitLab Self-Hosted Runner Docker

Docker を使用したセルフホスト型 GitLab CI/CD ランナーのシンプルな構成。

## 概要

このリポジトリは、Docker を使用して GitLab セルフホストランナーを簡単にデプロイするための環境を提供します。最小限の設定で自分のインフラストラクチャ上で CI/CD ジョブを実行できます。

## 前提条件

- Docker と Docker Compose
- GitLab ランナー登録トークン

## クイックスタート

付属の Makefile がほとんどのセットアップタスクを処理します：

```bash
# Clone repository and enter directory
git clone https://github.com/unilorn/gitlab-selfhosted-runner-docker.git
cd gitlab-selfhosted-runner-docker

# Set up environment (creates .env from template)
make init

# Edit .env file with your GitLab token and preferences
# Then start the runners
make up
```

## Configuration

## 設定

`.env` ファイルでの基本設定:

| 変数 | 説明 | デフォルト |
|----------|-------------|---------|
| `GITHUB_ACCESS_TOKEN` | リポジトリスコープを持つGitHubアクセストークン | (必須) |
| `GITHUB_REPOSITORY_OWNER` | リポジトリオーナー名 | (必須) |
| `GITHUB_REPOSITORY_NAME` | リポジトリ名 | (必須) |
| `GITHUB_DOMAIN` | GitHubドメイン | `github.com` |
| `GITHUB_API_DOMAIN` | GitHub API ドメイン | `api.github.com` |

## License

MIT

## References

- [GitLabセルフホストランナー Docker構成例](https://note.shiftinc.jp/n/n199fd81ce315)