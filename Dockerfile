FROM tomcat:9.0-jdk17-openjdk-slim

# Tomcat चे डीफॉल्ट फोल्डर्स नीट करणे
RUN cp -av /usr/local/tomcat/webapps.dist/* /usr/local/tomcat/webapps/ || true
RUN rm -rf /usr/local/tomcat/webapps/*

# तुझ्या वार फाईलचे नाव नीट तपासा (AplaKrushiMitr.war)
# जर तुझी .war फाईल याच फोल्डरमध्ये असेल तरच हे चालेल
COPY AplaKrushiMitr.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080
CMD ["catalina.sh", "run"]