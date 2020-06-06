# Jason's productivity suite

This is an idiosyncratic grab bag of productivity tools.

Just add a line like the following to your `.bashrc` file to get sweet tools like `srch`, `journal`, `til` and more.  Configure tools with environment variables.

```bash
export JPS_ENABLE_TIL=true # prints a random "Today I Learned" document when the suite is sourced.
export JPS_TIL_DIR=/path/to/til-dir
export JPS_JOURNAL_DIR=/path/to/journal-dir
source /path/to/jason-productivity-suite/source-me.sh
```

As warned, the suite is built with Jason's productivity in mind, so it's pretty opinionated, and it expects you to have some non-standard but cool utilities like [ripgrep](https://github.com/BurntSushi/ripgrep) and [fd](https://github.com/sharkdp/fd) installed.  It probably makes other unnecessary assumptions about what text editor you use and the like.  Feel free to adapt and remix this suite.

## `journal`

A script for quickly starting a new timestamped journal entry.

## `srch`

A wrapper around `rg` that looks for occurrences of words near each other.  Good for finding "that one thing I wrote that mentions 'X' and 'Y'".

## `til`

A script for quickly starting a new timestamped TIL entry.
