#!/bin/sh

err() { echo "$@" >&2; }

dirname=$(cd $(dirname $(realpath $0)); pwd)
targetfolder="${dirname}/downloads"
for line in $(cat ${dirname}/sites.txt); do
    err
    err "Scraping ${line}"
    err "$(echo "Scraping ${line}" | sed 's/./-/g')"
    wget -e robots=off \
        -U 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)' \
        -H -nd -nc -np -p \
        -q --show-progress \
        --recursive \
        --level=1 \
        --accept jpg \
        -R '*-*,**' \
        -P ${targetfolder} \
        ${line}
    err
    err "> Finished scraping ${line}"
done

