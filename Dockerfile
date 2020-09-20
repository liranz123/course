FROM openjdk:8-jre-alpine
COPY web/target/*.war /app.war
CMD ["/usr/bin/java", "-jar", "/app.war"]