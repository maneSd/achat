FROM openjdk:17
EXPOSE 8089
COPY target/achat-1.0.jar achat.jar
ENTRYPOINT ["java","-jar","achat.jar"]
