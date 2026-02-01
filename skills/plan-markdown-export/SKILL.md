---
name: plan-markdown-export
description: プラン内容をMarkdownファイルとして出力し、`docs/plan/YYYY-MM-DD_<plan-name>.md`に保存する作業で使用する。計画の書き出し、命名、markdownlintの実行が必要なときに使う。
---

# Plan Markdown Export

## 手順

1. 依頼内容からプラン名を短いkebab-caseで決める（指定がある場合はそれを使う）。
2. `docs/plan/` が無ければ作成する。
3. 日付はローカルの日付を使い、`YYYY-MM-DD_<plan-name>.md` でファイルを作成する（必要なら `date +%F` で確認する）。
4. `# Plan` から始まるMarkdownで内容を書く。
5. `markdownlint-cli2 --fix <file>` を実行する。
6. 生成したファイルパスを返す。

## テンプレート

```markdown
# Plan

<1-3 sentences: what we're doing, why, and the high-level approach.>

## Scope
- In:
- Out:

## Action items
[ ] <Step 1>
[ ] <Step 2>
[ ] <Step 3>
[ ] <Step 4>
[ ] <Step 5>
[ ] <Step 6>

## Open questions
- <Question 1>
- <Question 2>
- <Question 3>
```

## 注意

- 既存ファイルがある場合は上書き前に確認する。
- ファイル名はASCIIを優先する。
