# Project Overview: Ping-Pong Spring Boot REST API

The **Ping-Pong Project** is a Spring Boot-based application designed to demonstrate the implementation of distributed systems using microservices architecture. The project comprises two independently deployable microservices that work in tandem to simulate a back-and-forth communication pattern.

### Microservices Overview

1. **Ping Service**  
   This microservice is responsible for initiating the "Ping" action. It accepts HTTP requests from clients and sends calls to the **Pong Service**, receiving and processing the responses.

2. **Pong Service**  
   The **Pong Service** complements the **Ping Service** by handling incoming requests from it and responding with an appropriate message. This demonstrates seamless inter-service communication within the system.

Each microservice is modular, allowing for independent scalability, testing, and deployment. This separation of concerns showcases the benefits of the microservices architecture in terms of resilience, modular development, and ease of future extension.

---

# Getting Started

### Technology Stack
The following technologies are used in this project:

- **Java 21**: Latest features and enhancements of Java for high performance and reliability.
- **Spring Boot**: Provides the foundation for microservices development, offering simplicity in building and deploying services.
- **Spring Web**: Enables the development of RESTful APIs for inter-service and client communication.
- **Lombok**: Reduces boilerplate code, allowing concise and readable code for models and services.
- **Spring Boot DevTools**: Facilitates agile development through hot-reloading and other developer-friendly features.

---

### Running the Application

1. **Pre-requisites**:  
   Ensure you have the following installed:
    - **JDK 21**
    - **Apache Maven** (for dependency management and application building)

2. **Building and Running Each Service**:  
   Each service operates independently:
    - Navigate to the respective service's directory: `ping` or `pong`.
    - Run the following command:
      ```bash
      mvn spring-boot:run
      ```

   You can also run with specific profiles if implemented:
   ```bash
   mvn spring-boot:run -Dspring-boot.run.arguments="--spring.profiles.active=<profile>"
   ```

3. **Endpoints**:
    - **Ping Service**: Initiates the interaction (e.g., `http://localhost:8080/ping`).
    - **Pong Service**: Responds to the ping request (e.g., `http://localhost:8081/pong`).

---

### Key Features

- **Microservices Architecture**: Demonstrates how to build distributed systems with fine-grained services for specific functionality.
- **RESTful API Communication**: Follows REST standards to ensure simplicity and compatibility.
- **Independent Deployment**: Each service operates independently, showcasing flexibility for scaling and maintenance.

---

# Reference Documentation

For further reference, please consider the following sections:

* [Official Apache Maven documentation](https://maven.apache.org/guides/index.html)
* [Spring Boot Maven Plugin Reference Guide](https://docs.spring.io/spring-boot/3.4.1/maven-plugin)
* [Create an OCI image](https://docs.spring.io/spring-boot/3.4.1/maven-plugin/build-image.html)
* [Spring Web](https://docs.spring.io/spring-boot/3.4.1/reference/web/servlet.html)
* [Spring Boot DevTools](https://docs.spring.io/spring-boot/3.4.1/reference/using/devtools.html)
* [Validation](https://docs.spring.io/spring-boot/3.4.1/reference/io/validation.html)

---

# Guides

The following guides illustrate how to use some features concretely:

* [Building a RESTful Web Service](https://spring.io/guides/gs/rest-service/)
* [Serving Web Content with Spring MVC](https://spring.io/guides/gs/serving-web-content/)
* [Building REST services with Spring](https://spring.io/guides/tutorials/rest/)
* [Validation](https://spring.io/guides/gs/validating-form-input/)

---

# Notes on Maven Parent Management

Due to Maven's design, elements are inherited from the parent POM to the project POM. While most of the inheritance is fine, it also inherits unwanted elements like `<license>` and `<developers>` from the parent. To prevent this, the project POM contains empty overrides for these elements.  
If you manually switch to a different parent and actually want the inheritance, you need to remove those overrides.

---

Enjoy developing and testing the Ping-Pong Project!