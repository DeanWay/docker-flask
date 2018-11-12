#!/bin/bash
set -e

gunicorn -b 0.0.0.0:5000 -w 4 src.wsgi:app
