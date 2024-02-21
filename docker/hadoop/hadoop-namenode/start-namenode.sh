#!/bin/bash

# ${NAMENODE_DATA_DIR}에 파일이 있는 지 확인
if [ -z $(ls -A "${HDFS_NAMENODE_DATA_DIR}") ]; then
  echo "Formatting namenode name directory: ${HDFS_NAMENODE_DATA_DIR}"

  # 네임노드 디렉터리를 포맷 (초기화)
  ${HADOOP_HOME}/bin/hdfs namenode -format ${CLUSTER_NAME}
fi

if [ -z "${CLUSTER_NAME}" ]; then
    echo "Cluster name not specified"
    exit 2
fi

${HADOOP_HOME}/bin/hdfs --config ${HADOOP_CONF_DIR} namenode