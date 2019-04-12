# gcopr

Quickly checkout a pull request for the current repository.

## Features

- Fetches commits without adding local branches or remotes.
- Supports forks.

## Setup

1. Install [jq](https://stedolan.github.io/jq/)

1. Clone this repo somewhere, then link the shell script into your `PATH`.
   Assuming `~/bin` is in your `PATH`, you could do this:

   ```bash
   ln -s /path/to/repo/gcopr.sh ~/bin/gcopr
   ```

## Usage

Let's say you'd like to test the changes of pull request #123:

1. Go to your working copy.
2. Run `gcopr 123`.
3. Done!
