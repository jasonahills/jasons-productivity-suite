#!/usr/bin/env bash

# https://stackoverflow.com/questions/59895/how-to-get-the-source-directory-of-a-bash-script-from-within-the-script-itself
SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  DIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
SCRIPT_DIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )"

# Warn if essential variables are not set.
if [[ -z "$JPS_JOURNAL_DIR" ]]; then echo "You should probably set JPS_JOURNAL_DIR environment variable."; fi
if [[ -z "$JPS_TIL_DIR" ]]; then echo "You should probably set JPS_TIL_DIR environment variable."; fi

export PATH=${PATH}:"${SCRIPT_DIR}"/bin

if [[ x${JPS_ENABLE_TIL} == "xtrue" ]]
then 
  ${SCRIPT_DIR}/src/random-file.sh '*.md' ${JPS_TIL_DIR} | xargs cat # TODO: use a better pretty printer for the markdown
fi