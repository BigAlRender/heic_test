#!/usr/bin/env bash
# exit on error
set -o errexit

if [[ -n "$RAILS_ENV" && "$RAILS_ENV" == "production" ]]; then
  if [[ ! -f "/storage/production.sqlite3" ]]; then
    ./bin/rails db:setup
  fi
fi

./bin/rails db:migrate # in the start script as we're using SQLite/a disk 🙄
./bin/rails server
