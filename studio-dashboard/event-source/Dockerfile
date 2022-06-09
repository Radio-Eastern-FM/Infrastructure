FROM python:3

WORKDIR /usr/src/app

ENV REPOSITORY=https://github.com/Radio-Eastern-FM/Event-Source-Service.git

RUN export commit_id="$(git ls-remote $REPOSITORY master)"
RUN git clone $REPOSITORY .


RUN pip install --no-cache-dir -r requirements.txt

CMD [ "python", "/usr/src/app/__main__.py" ]
