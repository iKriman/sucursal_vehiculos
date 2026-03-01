FROM tomcat:10.1-jdk17

LABEL maintainer="admin_sucursal"

EXPOSE 8080

COPY target/vehiculosBuild.war /usr/local/tomcat/webapps/ROOT.war
