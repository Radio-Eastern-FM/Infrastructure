FROM python:3

WORKDIR /usr/src/app

ARG REPOSITORY=https://github.com/Radio-Eastern-FM/Event-Source-Service.git
ENV REPOSITORY=$REPOSITORY

ARG COMMIT
ENV COMMIT=$COMMIT

RUN git clone $REPOSITORY .
RUN git checkout $COMMIT

RUN pip install --no-cache-dir -r requirements.txt

CMD [ "python", "/usr/src/app/__main__.py" ]
