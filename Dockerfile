FROM openjdk:17
EXPOSE 8089
ADD target/achat-1.0.jar.original achat-1.0.jar
ENTRYPOINT ["java","-jar","achat.jar"]
