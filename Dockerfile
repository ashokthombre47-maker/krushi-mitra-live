FROM tomcat:9.0-jdk17-openjdk-slim

# Clean default webapps and prepare for clean deployment
RUN rm -rf /usr/local/tomcat/webapps/* && \
    cp -av /usr/local/tomcat/webapps.dist/* /usr/local/tomcat/webapps/ || true

# Deploy your project as the ROOT application
# Ensure AplaKrushiMitr.war is in the same folder as this Dockerfile
COPY AplaKrushiMitr.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080

CMD ["catalina.sh", "run"]