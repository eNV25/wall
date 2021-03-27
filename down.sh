#!/bin/sh

err() { echo "$@" >&2; }

dirname=$(cd $(dirname $(realpath $0)); pwd)
targetfolder="${dirname}/downloads"
for line in $(cat ${dirname}/sites.txt); do
    err
    err "Scraping ${line}"
    err "$(echo "Scraping ${line}" | sed 's/./-/g')"
    wget -e robots=off \
        -U 'Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101 Firefox/78.0' \
        -H -nd -nc -np -p \
        -q --show-progress \
        --recursive \
        --level=1 \
        --accept jpg \
        -R '*-*,*_*' \
        -P ${targetfolder} \
        ${line}
    err
    err "> Finished scraping ${line}"
done

