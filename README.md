# Despliegue de una Aplicación con Kubernetes

**GRUPO 5:**  
- Juan Villaman  
- Cristóbal de Jesus  
- Victor Figueroa  

**Módulo 5: Arquitectura y escalabilidad**  
**Clase 4: Orquestación de contenedores con Kubernetes**  
**Ejercicio Guiado: Despliegue de una Aplicación con Kubernetes**

---

## Descripción de la actividad

Este ejercicio práctico consistió en desplegar una aplicación web contenedorizada utilizando Kubernetes. Se trabajó con objetos como Deployment, Service, ConfigMap y Secret. Además, se realizaron tareas de escalado, exposición de la aplicación y configuración segura, simulando un entorno real de producción.

---

## Reflexión: Ventajas y retos del uso de Kubernetes

Entre las principales ventajas, destacamos la **escalabilidad automática**: con un solo comando (`kubectl scale deployment`), se aumentaron las réplicas de la aplicación sin modificar manualmente la infraestructura. Esta capacidad resulta fundamental en entornos reales donde la demanda puede cambiar repentinamente.

Además, la **exposición controlada del servicio mediante NodePort** permite hacer accesible la app sin comprometer la arquitectura interna.

Otro aspecto positivo fue la gestión de configuraciones y secretos usando **ConfigMap** y **Secret**. Por ejemplo, definir variables de entorno sensibles como `PASSWORD=supersecure` fuera del código fuente permite una mayor seguridad y flexibilidad, especialmente útil cuando se despliegan múltiples entornos (desarrollo, producción).

Finalmente, destacamos la facilidad para escalar réplicas con un solo comando y la gestión segura de configuraciones sensibles. Kubernetes demuestra ser una herramienta robusta y flexible para entornos modernos.

---

## Preguntas finales

**¿Cuál es la diferencia entre un Pod y un Deployment?**  
Un Pod es la unidad mínima que ejecuta un contenedor. Un Deployment, como el usado en la tarea, administra múltiples Pods y permite actualizaciones y escalado automático de manera controlada.

**¿Por qué es útil usar un ConfigMap o un Secret?**  
Permiten separar configuraciones del código. En la actividad, usamos `ENV=production` y `PASSWORD=supersecure`, lo que facilita cambiar valores sin modificar la imagen del contenedor.

**¿Qué ventajas ofrece Kubernetes frente a ejecutar contenedores manualmente con Docker?**  
Kubernetes automatiza despliegue, escalado y recuperación de contenedores. Por ejemplo, bastó un comando para escalar de 2 a 4 réplicas sin detener la app, algo que en Docker sería manual.

**¿Qué desafíos crees que enfrentaría esta app en producción?**  
En producción, podrían surgir desafíos como balanceo de carga real, alta disponibilidad y gestión de secretos más segura. Además, se necesitaría monitoreo constante y políticas de actualización.

---

## Diagrama de arquitectura del entorno desplegado

![Diagrama de arquitectura](https://github.com/Victfigueroa/k8s-webapp/blob/main/capturas/diagrama_arquitectura.png)

El usuario accede a la aplicación web mediante una petición HTTP, que llega al **Service** (`webapp-service`) expuesto como **NodePort** en el puerto `30001`. Este service actúa como puerta de entrada, redirigiendo el tráfico hacia los **Pods** gestionados por el **Deployment** (`webapp-deployment`), los cuales contienen las réplicas de la aplicación.  
Cada Pod consume valores de configuración desde un **ConfigMap** (`ENV=production`) y un **Secret** (`PASSWORD=supersecure`), lo que permite separar la lógica de negocio de la configuración sensible y mantener buenas prácticas de seguridad y portabilidad.
