#!/bin/sh
alias reload!='exec "$SHELL" -l'
alias art='php artisan'
alias wh='wormhole'
alias ip='curl icanhazip.com'
alias nah='git reset --hard && git clean -df'

function phpfix() {
    if [ -n "$1" ]
    then
        php-cs-fixer fix "$1" --config=.php_cs.dist --path-mode=intersection --diff
    else
        php-cs-fixer fix . --config=.php_cs.dist --path-mode=intersection --diff
    fi
}

function bass() {
    bcrypt-hash -c 12 $1
}

function vshare() {
    valet share --subdomain=jasperjorna-msml --region=eu
}

function db() {
    [ ! -f .env ] && { echo "No .env file found."; return; }

    if [ -f .env ]; then
        export $(grep -v '^#' .env | xargs)
    fi

    DB_URL="${DB_CONNECTION}://${DB_USERNAME}:${DB_PASSWORD}@${DB_HOST}:${DB_PORT}/${DB_DATABASE}"

    echo "Opening ${DB_DATABASE}"
    open $DB_URL
}
