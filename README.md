# Django application + Firebase + Cloud RUN

## Overview

Demo project to run Django application in Google Cloud Platform(GCP).


## Structure

- Firebase Hosting rewrite any source to Cloud Run container
- Static contents(`/static`) response directly by Firebase Hosting


## Request flow

- Browser access to `Firebase Hosting`
- If path start with `/static` and resource is exists, Fb response directly it
    - Therese resources are deployed by `firebase deploy` and `manage.py collectstatic`
- Any requests are passed Cloud Run.
    - In container, running Django application.
    - For `/static` requests, response 404 (application does not collect static contents)

## Usage commands

```
$ poetry install
$ poetry build
$ docker build -t gcr.io/YOUR-PROJECT/YOUR-IMAGE-NAME
$ docker push gcr.io/YOUR-PROJECT/YOUR-IMAGE-NAME
$ yarn
$ poetry run ./manage.py collectstatic
$ yarn firebase deploy
```

## References

- https://firebase.google.com/docs/hosting/cloud-run?hl=ja#direct_requests_to_container
