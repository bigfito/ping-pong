# Getting Started

### Overview of the Ping Module

The `ping` module provides a simple health check mechanism to ensure that the application is running and responsive. It typically exposes an endpoint that can be used to verify the application’s status, often for monitoring purposes or as a readiness/liveness probe in deployment systems like Kubernetes.

#### Key Features
- Lightweight and efficient health check.
- Can be configured as a public or restricted endpoint based on your application’s requirements.
- Useful for readiness and liveness probes in containerized environments.

#### Usage
To test the health of the application through the `ping` module:
1. Start the application.
2. Access the `ping` endpoint, typically available at `/ping` (or a similar path that might be customized in the application configuration).
3. A successful response (e.g., `HTTP 200 OK` with a simple message like `pong`) indicates the application is up and running.

---

### Reference Documentation
For further reference, please consider the following sections:

* [Official Apache Maven documentation](https://maven.apache.org/guides/index.html)
* [Spring Boot Maven Plugin Reference Guide](https://docs.spring.io/spring-boot/3.4.1/maven-plugin)
* [Create an OCI image](https://docs.spring.io/spring-boot/3.4.1/maven-plugin/build-image.html)

---

### Maven Parent Overrides

Due to Maven's design, elements are inherited from the parent POM to the project POM.
While most of the inheritance is fine, it also inherits unwanted elements like `<license>` and `<developers>` from the parent.
To prevent this, the project POM contains empty overrides for these elements.
If you manually switch to a different parent and actually want the inheritance, you need to remove those overrides.