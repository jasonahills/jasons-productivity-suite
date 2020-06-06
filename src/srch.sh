#!/usr/bin/env bash

# A command line wrapper for rg making it easy to search for documents with a bunch of words close together.

# srch -n 4 stuff thing more

PATTERN=""
N=5
WHITESPACE="\s*"
WORD="[\p{Latin}\p{Punctuation}]+" # TODO: make sure we can handle punctuation, Hungarian letters, numbers, etc.

while [[ $# -gt 0 ]]
do
case "${1}" in
  -h|--help)
    echo "usage: srch [-n NUM_WORDS_APART] [-dry-run] [WORD ... ] -- [RG_OPTIONS]"
    ;;

  -n|--num_words)
    N="${2}"
    shift
    ;;

  --dry-run)
    DRYRUN="true"
    ;;

  --)
    shift
    break
    ;;
  
  *)
    if [[ $PATTERN == "" ]]; then PATTERN=${1};
    else
    # TODO: update the pattern with a positional param
    # no lookaheads in rg regex, so we do what we can
    # TODO: do this in a way that doesn't explode like this
    PATTERN="(?:(?:${PATTERN}${WHITESPACE}${WORD}{0,${N}}${WHITESPACE}${1})|(?:${1}${WHITESPACE}${WORD}{0,${N}}${WHITESPACE}${PATTERN}))"
    fi
esac
shift
done

if [[ x$DRYRUN == "xtrue" ]]; then echo rg $PATTERN $@;
else
  rg $PATTERN $@
fi