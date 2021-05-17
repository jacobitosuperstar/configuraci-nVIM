# COMANDOS BÁSICOS DE DOCKER PARA LA CREACIÓN DE MI AMBIENTE VIRTUAL

## Creando imágenes de contenedores

Voy a crear una imagen personalizada que va a tener todos mis accesos y claves
para la creación de un ambiente portatil de producción. En caso de cambiar de
máquina, sólo sea disparar el contenedor y listo

1. Creando un nuevo contenedor desde la línea de comando

    ```sh
    docker create --name ubuntu -p 80:80 ubuntu:latest
    ```

2. Inspeccionar las imágenes

    ```sh
    docker images
    ```

3. Inspeccionar los contenedores

    ```sh
    docker ps -a
    ```

4. Ingresando al contenedor para instalar todos mis ambientes de desarrollo

    ```sh
    docker run -it ubuntu sh
    ```

5. Dentro del contenedor instalo todo lo que considero necesario. En el caso del
   ambiente de desarrollo es bueno tener todo instalado, incluyendo las
   recomendaciones para uno no encontrarse con nada raro que puede estár
   necesitando el editor. Adicionalmente, como es para desarrollo y no para
   producción, las fallas en seguridad no importan, porque el contenedor sólo
   estaría abierto en la red local. Para los casos en el que vayamos a hacer una
   entrega a producción **SIEMPRE** se deben de usar las imágines de menor
   embergadura posible para disminuir los puertos abiertos para ataques. Siempre
   usar en lo posible, imágenes muy populares o imágenes directamente de las
   empresas o de los productos que se están utilizando.

6. Creamos una imagen del contenedor

    ```sh
    docker commit ubuntu
    ```

    *se pueden agregar cosas como autor y comentarios, pero eso lo vamos a dejar
    quieto por el momento, pq no se cómo hacer para no dañar la configuración
    del commit al hacerlo*

7. Marcando la imagen

    ```sh
    docker tag <<código de la imagen>> <<nombre del repositorio>>
    ```

    en mi caso sería

    ```sh
    docker tag <<código de la imagen>> jacobitosuperstar/image:latest
    ```

8. Haciendo el push de la imagen sería

    ```sh
    docker push jacobitosuperstar/image:latest
    ```
