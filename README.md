# discourse-change-email

This plugin allows changing the email address for a Discourse user without sending or requiring a confirmation email.

## installation

Install like usual.

## usage

The plugin adds a route similar to the existing route, but ending with `_confirmed`.

`/users/:username/preferences/email_confirmed`

Parameters (JSON)

`{'email' : 'new-email@example.com' }`

## example

`curl -X PUT -H 'Content-Type: application/json' -d '{"email": "new-email@example.com"}' \
  "https://forum.example.com/users/USERNAME/preferences/email_confirmed?api_username=...&api_key=...`

