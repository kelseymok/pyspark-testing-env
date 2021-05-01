FROM python:3.7

# Install OpenJDK 8
RUN apt update
RUN apt-get install -y software-properties-common
RUN wget -qO - https://adoptopenjdk.jfrog.io/adoptopenjdk/api/gpg/key/public | apt-key add -
RUN add-apt-repository -y https://adoptopenjdk.jfrog.io/adoptopenjdk/deb/
RUN apt-get update
RUN apt-get install -y adoptopenjdk-8-hotspot

# Install libraries
RUN python -m pip install pip==21.0.1
COPY requirements.txt .
RUN pip install -r requirements.txt