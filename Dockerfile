# Base Alpine Linux based image with OpenJDK JRE only
FROM openjdk:8-jre-alpine
# copy application WAR (with libraries inside)
COPY target/*.war /app.war
# specify default command
CMD ["/usr/bin/java", "-jar", "/app.war"]