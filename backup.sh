#!/bin/bash
# Small script to make a backup of custom data

now=$(date +%Y-%m-%d\ %H:%M:%S)
nowFile=$(echo $now | sed -e 's/[: -]*//g')
programName=$(basename $0)
programDir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
baseName=$(echo ${programName} | sed -e 's/.sh//g')

tar zcvf backup_wordpress_${nowFile}.tar.gz wordpress mariadb
