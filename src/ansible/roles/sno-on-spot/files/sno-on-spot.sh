#!/bin/bash
set -o pipefail

cd ${WORK_DIR}

# hack for quoting
export PULL_SECRET=$(cat ${PULL_SECRET})
# SSH_KEY may be a path to the public key or the key itself - installer needs the key
if [[ -f "${SSH_KEY}" ]]; then export SSH_KEY=$(cat "${SSH_KEY}"); fi

# We explicitly do not want spot instance in this case
export SKIP_SPOT=skip

echo "💥 Working directory is: $WORK_DIR" | tee -a output.log
curl -Ls https://raw.githubusercontent.com/eformat/sno-for-100/main/sno-for-100.sh | bash -s -- -d 2>&1 | tee -a output.log
