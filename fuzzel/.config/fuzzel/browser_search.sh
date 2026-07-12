#!/bin/bash
# 
# Dolf ten Have
# 07/12/2026
#
# Opens the search term in your web browser
# 
# NOTE: Can not get live search suggestions in fuzzel since it only supports static text buffers on launch :/

BROWSER="firefox"
ENGINE="https://google.com/search?q="

QUERY=$(fuzzel -d --lines=0 --placeholder 'internet search...')
[ -z "$QUERY" ] && exit 0

$BROWSER "$ENGINE$QUERY"
