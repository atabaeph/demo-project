FROM tomcat:9-jre8-alpine

RUN ["rm", "-fr", "/usr/local/tomcat/webapps/webapp.war"]

COPY ./webapp/target/webapp.war /usr/local/tomcat/webapps/

EXPOSE 8080

CMD [“catalina.sh”, “run”]
