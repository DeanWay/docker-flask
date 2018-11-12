#!/bin/bash
set -e

export FLASK_APP=/app/src/app.py
export FLASK_ENV=development
flask run --host=0.0.0.0

