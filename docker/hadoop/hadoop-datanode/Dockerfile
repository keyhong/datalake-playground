FROM hadoop-base:latest

ENV HDFS_DATANODE_DATA_DIR=/data/hadoop/dfs/data

RUN mkdir -p ${HDFS_DATANODE_DATA_DIR}

COPY ./docker/hadoop/hadoop-datanode/start-datanode.sh /start-datanode.sh

EXPOSE 9864

CMD [ "/start-datanode.sh" ]