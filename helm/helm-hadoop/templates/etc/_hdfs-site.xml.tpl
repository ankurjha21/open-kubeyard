<?xml version="1.0" encoding="UTF-8"?>
<?xml-stylesheet type="text/xsl" href="configuration.xsl"?>
<!--
  Licensed under the Apache License, Version 2.0 (the "License");
  you may not use this file except in compliance with the License.
  You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

  Unless required by applicable law or agreed to in writing, software
  distributed under the License is distributed on an "AS IS" BASIS,
  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  See the License for the specific language governing permissions and
  limitations under the License. See accompanying LICENSE file.
-->

<!-- Put site-specific property overrides in this file. -->

<configuration>
  	<property>
      <name>dfs.replication</name>
      <value>1</value>
    </property>
    <property>
      <name>dfs.namenode.rpc-address</name>
      <value>{{ template "hdfs-namenode-fqdn" . }}:{{ default 9000 .Values.hdfs.namenode.ports.ipc }}</value>
    </property>
    <property>
      <name>dfs.namenode.datanode.registration.ip-hostname-check</name>
      <value>false</value>
    </property>
    <property>
      <name>dfs.namenode.name.dir</name>
      <value>file:///data/dfs/nn</value>
    </property>
    <property>
      <name>dfs.datanode.data.dir</name>
      <value>file:///data/dfs/dn</value>
    </property>
</configuration>
