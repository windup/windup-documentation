The [Migration Toolkit for Applications (MTA)](https://access.redhat.com/documentation/en-us/migration_toolkit_for_applications), formerly called the [Red Hat Application Migration Toolkit (RHAMT)](https://access.redhat.com/documentation/en-us/red_hat_application_migration_toolkit/), is a migration rules engine.

The MTA 5.0 [cloud-readiness rules](https://github.com/windup/windup-rulesets/tree/master/rules-reviewed/openshift) assess the suitability of your application for containerization by applying the principles of the [Twelve Factor App methodology](https://12factor.net/).

This article describes issues in applications that are detected by the cloud-readiness rules and how to remedy them.[^1]

[^1]: Source: Andy Krohg, [Cloud Readiness Target for Red Hat Application Migration Toolkit 4.3.1](https://gist.github.com/andykrohg/18dfa167f01c529b8a2f23a729091302).

## Mandatory issues to review for cloud-readiness

The following issues must be reviewed and, if necessary, remedied for successful migration to a cloud environment.

### Embedded cache libraries

**Potential problems**

* If an application has an embedded cache library, state information might not be not persisted to a backing service.

**Recommendations**

* Use a cache backing service.

### Java Remote Method Invocation (RMI) service

**Potential problems**

* Java RMI is a tightly coupled service. Tight coupling is not suitable in a cloud environment.

**Recommendations**

* Use Java EE standard or loosely coupled protocols for backing service interactions, for example:

  * Message-based communication (JMS) for asynchronous use cases

  * HTTP-based protocol or API (JAX-RS and JAX-WS) for synchronous use cases

  When used with load-balancing, both options ensure scalability and high availability.

### Java native libraries (JNI, JNA)

**Potential problems**

* Java native libraries might not run in a cloud/container environment.

**Recommendations**

* Review the purpose of the native library in your application.
* Check whether the native library is compatible with a cloud environment.
* Reuse or embed the native library or application in a cloud environment, for example, in a JBoss module.
* Replace, remove, or rewrite the native library or application using a cloud-compatible equivalent.

**References**

* [How to load native libraries and access them via JNI in EAP](https://access.redhat.com/solutions/229443)
* [Is it supported to compile the JNI code as 32-bit shared libraries and use it in 64-bit compiled Java code?](https://access.redhat.com/solutions/1444643)

### Local storage

**Potential problems**

* An application running inside a container could lose access to a file in local storage.

**Recommendations**

The following recommendations depend on the function of the file in local storage.

* Logging: Log to standard output and use a centralized log collector to analyze the logs.
* Caching: Use a cache backing service.
* Configuration: Store configuration settings in environment variables so that they can be updated without code changes.
* Data storage: Use a database backing service for relational data or use a persistent data storage system.
* Temporary data storage: Use the file system of a running container as a brief, single-transaction cache.

**References**

* Logging:
  * [Twelve-Factor App: Logs](https://12factor.net/logs)
  * [OpenShift Container Platform: Understanding cluster logging](https://docs.openshift.com/container-platform/4.5/logging/cluster-logging.html)
* Backing services: [Twelve-Factor App: Backing services](https://12factor.net/backing-services)
* Configuration:
  * [Twelve-Factor App: Config](https://12factor.net/config)
  * [OpenShift Container Platform: Input secrets and ConfigMaps](https://docs.openshift.com/container-platform/4.5/builds/creating-build-inputs.html#builds-input-secrets-configmaps_creating-build-inputs)
* Storage: [OpenShift Container Platform: Understanding persistent storage](https://docs.openshift.com/container-platform/4.5/storage/understanding-persistent-storage.html)

### Logging

**Potential problems**

* If the application writes logs to a file system, local log files may be lost if an instance terminates or restarts.
* If the application writes logs with `SocketHandler`, an alternative method is required. Socket communication is not suitable for a cloud environment because it requires fixed communication with a target host.

**Recommendations**

* Use a centralized log management system.
* Log to standard output and allow the cloud platform to manage the logging.
* Use shared storage for log files.

**References**

* [Twelve-Factor App: Logs](https://12factor.net/logs)
* [OpenShift Container Platform: Understanding cluster logging](https://docs.openshift.com/container-platform/4.5/logging/cluster-logging.html)

### HTTP session replication

**Potential problems**

* Session replication ensures that client sessions are not disrupted by node failure. Each node in the cluster shares information about ongoing sessions and can take over sessions if another node disappears. In a cloud environment, however, data in the memory of a running container can be wiped out by a restart.

**Recommendations**

* Review the session replication usage and ensure that it is configured properly.
* Disable HTTP session clustering and accept its implications.
* Re-architect the application so that sessions are stored in a cache backing service or a remote data grid. This approach has the following benefits:

  * The application is more scaleable and elastic.
  * The application can survive EAP node failures because a JVM failure does not cause session data loss.
  * Session data can be shared by multiple applications.

**References**

* [JBoss EAP: Clustering in Web Applications](https://access.redhat.com/documentation/en-us/red_hat_jboss_enterprise_application_platform/7.3/html/development_guide/clustering_in_web_applications)
* [Twelve-Factor App: Processes](https://12factor.net/processes)
* [Getting Started with JBoss EAP for OpenShift Container Platform:  Clustering](https://access.redhat.com/documentation/en-us/red_hat_jboss_enterprise_application_platform/7.3/html-single/getting_started_with_jboss_eap_for_openshift_container_platform/index#reference_clustering)
* [Twelve-Factor App: Backing services](https://12factor.net/backing-services)
* [Running Data Grid on OpenShift](https://access.redhat.com/documentation/en-us/red_hat_data_grid/8.0/html-single/running_data_grid_on_openshift/index)
* [JBoss EAP:  Externalize HTTP Sessions to Red Hat Data Grid](https://access.redhat.com/documentation/en-us/red_hat_jboss_enterprise_application_platform/7.3/html-single/configuration_guide/index#jdg_externalize_http_sessions)

## Optional issues to review for cloud-readiness

The following issues are optional for a successful migration to a cloud environment.

### Java API for XML-based RPC (JAX-RPC)

**Potential problems**

JAX-RPC is a tightly coupled API. Tight coupling is not suitable in a cloud environment.

**Recommendations**

* Use a loosely coupled HTTP protocol or API such as JAX-WS or REST.
* Use message-based communication (JMS) for asynchronous use cases.

In combination with load balancing, these options ensure scalability and high availability.

**References**

* [Is JAX-RPC supported in EAP 6?](https://access.redhat.com/solutions/153433)
* [Should I use JAX-RPC in EAP 6?](https://access.redhat.com/solutions/364354)

### JavaMail API

**Potential problems**

* The configuration parameters of SMTP services for outbound mail may contain environment-specific values, for example, static IP addresses, host names, properties, credentials, or certificates.

**Recommendations**

* In a cloud environment, mail systems are considered backing services and must be treated like attached resources.
* Ensure that the configuration of the underlying outbound mail connection is not environment-specific.
* In OpenShift Container Platform, configuration parameters can be stored as environment variables or in a ConfigMap.

**References**

* [Twelve-Factor App: Backing services](https://12factor.net/backing-services)
* [Twelve-Factor App: Config](https://12factor.net/config)
* [OpenShift Container Platform: Input secrets and ConfigMaps](https://docs.openshift.com/container-platform/4.5/builds/creating-build-inputs.html#builds-input-secrets-configmaps_creating-build-inputs)

### HTTP session data storage

**Potential problems**

* In a cloud environment, a restart can wipe out HTTP session data in the memory of a running container.

**Recommendations**

* Store HTTP session data in a cache backing service or a remote data grid. This approach has the following benefits:

  * The application is more scaleable and elastic.
  * The application can survive EAP node failures because a JVM failure does not cause session data loss.
  * Session data can be shared by multiple applications.

**References**

* [Twelve-Factor App: Processes](https://12factor.net/processes)
* [Twelve-Factor App: Backing services](https://12factor.net/backing-services)
* [JBoss EAP:  Externalize HTTP Sessions to Red Hat Data Grid](https://access.redhat.com/documentation/en-us/red_hat_jboss_enterprise_application_platform/7.3/html-single/configuration_guide/index#jdg_externalize_http_sessions)
* [Running Data Grid on OpenShift](https://access.redhat.com/documentation/en-us/red_hat_data_grid/8.0/html-single/running_data_grid_on_openshift/index)

### Socket communication

**Potential problems**

* Socket communication is not suitable for a cloud environment because it requires fixed communication with a target host.

**Recommendations**

* Use Java EE standard or loosely coupled protocols, such as JMS, JAX-RS, or JAX-WS, for backing service interactions.

**References**

* [Twelve-Factor App: Backing services](https://12factor.net/backing-services)
