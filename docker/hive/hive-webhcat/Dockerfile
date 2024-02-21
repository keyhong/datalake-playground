FROM hive-base:latest

ENV PYTHON_CMD=/usr/bin/python

COPY --chmod=755 ./docker/hive/hive-webhcat/startup.sh /startup.sh

EXPOSE 50111

CMD [ "/startup.sh" ]