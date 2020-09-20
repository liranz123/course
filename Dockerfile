FROM openjdk:8-jre-alpine
COPY /var/jenkins_home/workspace/automat-it/web/*.war /app.war
CMD ["/usr/bin/java", "-jar", "/app.war"]