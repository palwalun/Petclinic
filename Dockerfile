FROM tomcat:jre8-alpine
WORKDIR /usr/local/tomcat
COPY /target/*.war webapps/app.war
EXPOSE 8080
CMD ["catalina.sh" "run"]