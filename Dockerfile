# --------------------------------------
FROM python:3.8-slim

ARG VERSION=0.1.0
ARG WHEEL=cloudrun_django-${VERSION}-py3-none-any.whl

RUN pip install gunicorn

COPY dist/${WHEEL} /${WHEEL}
RUN pip install /${WHEEL}

EXPOSE 8080
CMD gunicorn -b 0.0.0.0:8080 cloudrun_django.wsgi:application