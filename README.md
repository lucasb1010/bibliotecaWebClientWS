# ProgApProyDesarrolloWeb
REPOSITORIO DEL LABORATORIO DE PROGRAMACIÓN DE APLICACIONES PARA EL FRONTEND

Sarazola, Piriz, Bergara

https://github.com/lucasb1010/ProgApProyDesarrolloWeb


COMANDOS PARA EJECUCTAR EL WebClientWS (tiene que estar el publish previamente andando y solo sirve para powershell)

mvn -q clean package

$TOMCAT='C:\apache-tomcat-9.0.109'; & "$TOMCAT\bin\shutdown.bat"; Remove-Item "$TOMCAT\webapps\bibliotecaWebClientWS-1.0.0-SNAPSHOT" -Recurse -Force -ErrorAction SilentlyContinue; Copy-Item ".\target\bibliotecaWebClientWS-1.0.0-SNAPSHOT.war" "$TOMCAT\webapps" -Force; & "$TOMCAT\bin\startup.bat"
