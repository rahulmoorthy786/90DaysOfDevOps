#!/bin/bash

set -euo pipefail


#echo "undefined variable -u"
#echo "$undefined_var"

#echo "Failed command set -e"
# mkdir ../script


echo "piped command set -o pipefail"
cat error.log | grep "WARN"
