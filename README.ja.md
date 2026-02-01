[![English](https://img.shields.io/badge/lang-English-blue)](README.md) [![日本語](https://img.shields.io/badge/lang-日本語-orange)](README.ja.md)

# ai-agent-config

これはCodex CLIのAGENTS.mdファイルを管理するリポジトリで、Claude Code用のCLAUDE.mdにも対応。

## 構成

- agents.xml: AGENTS.mdとCLAUDE.mdの実態。`~/.codex/AGENTS.md`または`~/.claude/CLAUDE.md`のシンボリックリンク。
- Makefile: シンボリックリンクの作成と削除を簡単に実行するためのコマンドを実装。

## 使い方

`~/.codex/AGENTS.md`のシンボリックリンクをagents.xmlに貼る。

```sh
cd ai-agent-config
make codex-link
```

シンボリックリンクを解除したい場合は下記のコマンドを実行する。

```sh
make codex-unlink
```

`~/.claude/CLAUDE.md`のシンボリックリンクをagents.xmlに貼る。

```sh
cd ai-agent-config
make claude-link
```

シンボリックリンクを解除したい場合は下記のコマンドを実行する。

```sh
make claude-unlink
```

`.codex/skills` を `~/.codex/skills` にインストールする。

```sh
make codex-skills-install
```

## AGENTS.mdの中身をxmlとして定義する理由

[GPT-5 for Coding Cheatsheet(PDF)](https://cdn.openai.com/API/docs/gpt-5-for-coding-cheatsheet.pdf)によると、XMLライクなタグでセクションを区切る書き方が推奨されているから。

上記OpenAIのチートシートで“XML-like syntax to help structure instructions”とはっきり書かれており、実例が掲載されている。

このリポジトリにあるagents.xmlの内容は、このチートシートを参考に作成した。

## 参考URL

- [GPT-5 for Coding Cheatsheet(PDF)](https://cdn.openai.com/API/docs/gpt-5-for-coding-cheatsheet.pdf)
- [GPT-5 prompting guide](https://cookbook.openai.com/examples/gpt-5/gpt-5_prompting_guide)
