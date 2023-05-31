FROM openjdk:17
COPY /target/app.war /usr/local/lib/app.war
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "/usr/local/lib/app.war"]