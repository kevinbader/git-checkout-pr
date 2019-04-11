#!/usr/bin/env bash -e

pr_id="$1"
if [[ -z "$pr_id" ]]; then
    echo "Usage: $0 <Pull Request ID>"
    exit 1
fi

origin_url="$(git config --get remote.origin.url)"
if [[ -z "$origin_url" ]]; then
    echo "Please make sure you're in a Git working copy and there is a remote called \"origin\"."
    exit 1
fi

repo="$(basename "$origin_url" .git)"
orga="$(basename "$(dirname "$origin_url")")"
pr_url="https://api.github.com/repos/${orga}/${repo}/pulls/${pr_id}"

pr="$(curl -s "$pr_url")"

clone_url="$(jq -r '.head.repo.clone_url' <<<"$pr")"
ref="$(jq -r '.head.ref' <<<"$pr")"

git fetch "$clone_url" "$ref"
git checkout FETCH_HEAD

