# COMANDOS DE DOCKER PARA CORRER UN CONTENEDOR CON VIM Y TMUX

Comandos comunes de docker para la creación de contenedores de desarrollo
para correr VIM en una ventana del shell y tener el terminal de TMUX en la
otra

```shell
docker pull jacobitosuperstar/shell:latest
docker run -it <<image_id>> bash
```

en caso de que el contenedor ya esté corriendo

```shell
docker exec -it <<container_name>> bash
```
