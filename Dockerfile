FROM openjdk:17
EXPOSE 8089
ADD http://localhost:8081/repository/maven-releases/tn/esprit/rh/achat/1.5/achat-1.5.jar achat-1.5.jar
ENTRYPOINT ["java","-jar","achat.jar"]
