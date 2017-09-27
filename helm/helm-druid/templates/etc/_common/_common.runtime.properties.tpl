#
# Licensed to Metamarkets Group Inc. (Metamarkets) under one
# or more contributor license agreements. See the NOTICE file
# distributed with this work for additional information
# regarding copyright ownership. Metamarkets licenses this file
# to you under the Apache License, Version 2.0 (the
# "License"); you may not use this file except in compliance
# with the License. You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing,
# software distributed under the License is distributed on an
# "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
# KIND, either express or implied. See the License for the
# specific language governing permissions and limitations
# under the License.
#

#
# Extensions
#

# This is not the full list of Druid extensions, but common ones that people often use. You may need to change this list
# based on your particular setup.
druid.extensions.directory=/opt/druid/extensions
druid.extensions.loadList=["druid-kafka-eight", "mysql-metadata-storage", "druid-avro-extensions", "druid-kafka-indexing-service", "druid-hdfs-storage"]

# If you have a different version of Hadoop, place your Hadoop client jar files in your hadoop-dependencies directory
# and uncomment the line below to point to your directory.
druid.extensions.hadoopDependenciesDir=/opt/druid/hadoop-dependencies

#
# Logging
#

# Log all runtime properties on startup. Disable to avoid logging properties on startup:
druid.startup.logging.logProperties=true

#
# Zookeeper
#

druid.zk.service.host=zookeeper.kubeyard
druid.zk.paths.base=/druid

#
# Metadata storage
#

# For Derby server on your Druid Coordinator (only viable in a cluster with a single Coordinator, no fail-over):
#druid.metadata.storage.type=derby
#druid.metadata.storage.connector.connectURI=jdbc:derby://foo.bar.ip:1527/var/druid/metadata.db;create=true
#druid.metadata.storage.connector.host=foo.bar.ip
#druid.metadata.storage.connector.port=1527

# For MySQL:
druid.metadata.storage.type=mysql
druid.metadata.storage.connector.connectURI=jdbc:mysql://{{ tuple (default "helm-mysql" .Values.mysql.name) . | include "fqdn" }}:{{ default "3306" .Values.mysql.port }}/druid
druid.metadata.storage.connector.user=druid
druid.metadata.storage.connector.password=druid

# For PostgreSQL (make sure to additionally include the Postgres extension):
#druid.metadata.storage.type=postgresql
#druid.metadata.storage.connector.connectURI=jdbc:postgresql://db.example.com:5432/druid
#druid.metadata.storage.connector.user=...
#druid.metadata.storage.connector.password=...

#
# Deep storage
#

# For local disk (only viable in a cluster if this is a network mount):
#druid.storage.type=local
#druid.storage.storageDirectory=/var/lib/druid/segments

# For HDFS (make sure to include the HDFS extension and that your Hadoop config files in the cp):
druid.storage.type=hdfs
druid.storage.storageDirectory=hdfs://{{ tuple "hdfs-namenode" . | include "fqdn" }}:{{ default "9000" .Values.hadoop.ports.namenode }}/druid/segments

# For S3:
#druid.storage.type=s3
#druid.storage.bucket=your-bucket
#druid.storage.baseKey=druid/segments
#druid.s3.accessKey=...
#druid.s3.secretKey=...

#
# Indexing service logs
#

# For local disk (only viable in a cluster if this is a network mount):
#druid.indexer.logs.type=file
#druid.indexer.logs.directory=/var/lib/druid/indexing-logs

# For HDFS (make sure to include the HDFS extension and that your Hadoop config files in the cp):
druid.indexer.logs.type=hdfs
druid.indexer.logs.directory=hdfs://{{ tuple "hdfs-namenode" . | include "fqdn" }}:{{ default "9000" .Values.hadoop.ports.namenode }}/druid/indexing-logs

# For S3:
#druid.indexer.logs.type=s3
#druid.indexer.logs.s3Bucket=your-bucket
#druid.indexer.logs.s3Prefix=druid/indexing-logs

#
# Service discovery
#

druid.selectors.indexing.serviceName=druid/overlord
druid.selectors.coordinator.serviceName=druid/coordinator

#
# Monitoring
#

druid.monitoring.monitors=["com.metamx.metrics.JvmMonitor"]
druid.emitter=logging
druid.emitter.logging.logLevel=info
