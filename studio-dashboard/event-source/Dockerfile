FROM python:3

WORKDIR /usr/src/app

RUN git clone https://github.com/Radio-Eastern-FM/Event-Source-Service.git .

RUN pip install --no-cache-dir -r requirements.txt

CMD [ "/bin/sleep", "5h" ]
# CMD [ "python", "/usr/src/app/__main__.py" ]
