#!/bin/sh
alias reload!='exec "$SHELL" -l'
alias art='php artisan'
alias wh='wormhole'
alias ip='curl ifconfig.co'

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
