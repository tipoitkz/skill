FROM python:3.7.12-alpine3.15

WORKDIR /srv/app/

COPY requirements.txt ./

RUN \
 update-ca-certificates && \
 apk add --no-cache postgresql-libs && \
 apk add --no-cache --virtual .build-deps gcc musl-dev postgresql-dev && \
 python3 -m pip install --trusted-host pypi.org --trusted-host pypi.python.org --trusted-host files.pythonhosted.org -r requirements.txt --no-cache-dir && \
 apk --purge del .build-deps

COPY DEVOPS-praktikum_Docker/web.py /srv/app/
COPY DEVOPS-praktikum_Docker/web.conf /srv/app/conf/

CMD [ "python", "./web.py" ]

