# Tomcat १० वापरत आहोत (Servlet ६.० आणि JSP ३.१ साठी)
FROM tomcat:10.1-jdk17-openjdk-slim

# जुने default apps काढून टाका
RUN rm -rf /usr/local/tomcat/webapps/*

# तुझी .war फाईल Tomcat च्या webapps फोल्डरमध्ये कॉपी करा
# लक्षात ठेव: तुझ्या फाईलचे नाव 'AplaKrushiMitr.war' असेल तर खाली तेच वापरा
COPY AplaKrushiMitra.war /usr/local/tomcat/webapps/ROOT.war

# Port ८०८० ओपन करा
EXPOSE 8080

# Tomcat सुरू करा
CMD ["catalina.sh", "run"]