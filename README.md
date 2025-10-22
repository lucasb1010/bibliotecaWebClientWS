# ProgApProyDesarrolloWeb
REPOSITORIO DEL LABORATORIO DE PROGRAMACIÓN DE APLICACIONES PARA EL FRONTEND

Sarazola, Piriz, Bergara

https://github.com/lucasb1010/ProgApProyDesarrolloWeb

# Configurar Java
$env:JAVA_HOME = 'C:\Users\andpi\AppData\Roaming\Cursor\User\globalStorage\pleiades.java-extension-pack-jdk\java\latest'
$env:PATH = "$env:JAVA_HOME\bin;$env:PATH"
java -version


# Desplegar en Tomcat
$TOMCAT = 'C:\apache-tomcat-9.0.109'; & "$TOMCAT\bin\shutdown.bat"; Remove-Item "$TOMCAT\webapps\bibliotecaWebClientWS-1.0.0-SNAPSHOT" -Recurse -Force -ErrorAction SilentlyContinue; Copy-Item ".\target\bibliotecaWebClientWS-1.0.0-SNAPSHOT.war" "$TOMCAT\webapps" -Force; & "$TOMCAT\bin\startup.bat"