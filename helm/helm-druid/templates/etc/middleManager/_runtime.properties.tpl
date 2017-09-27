druid.service=druid/middleManager
druid.port={{ default "8091" .Values.middlemanager.port }}

# Number of tasks per middleManager
druid.worker.capacity=3

# Task launch parameters
druid.indexer.runner.javaOpts=-server -Xmx2g -Duser.timezone=UTC -Dfile.encoding=UTF-8 -Djava.util.logging.manager=org.apache.logging.log4j.jul.LogManager
druid.indexer.task.baseTaskDir=/var/lib/druid/task

# HTTP server threads
druid.server.http.numThreads=25

# Processing threads and buffers
druid.processing.buffer.sizeBytes=536870912
druid.processing.numThreads=2

# Hadoop indexing
druid.indexer.task.hadoopWorkingPath=/var/lib/druid/hadoop-tmp
druid.indexer.task.defaultHadoopCoordinates=["org.apache.hadoop:hadoop-client:2.3.0"]
