FROM ubuntu:18.04

WORKDIR /usr/src/app
RUN chmod 777 /usr/src/app

RUN apt-get -qq update && \
    apt-get -qq install -y python3 python3-pip

COPY requirements.txt .
RUN apt-get clean && apt-get update && apt-get install -y locales
RUN pip3 install --no-cache-dir -r requirements.txt
COPY . .

CMD ["bash","start.sh"]
