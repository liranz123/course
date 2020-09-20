FROM openjdk:8-jre-alpine
COPY --from=build /home/app/target/war_name.war app.war
COPY target/*.war /app.war
CMD ["/usr/bin/java", "-jar", "/app.war"]