# Dockerfile for jacobitosuperstar/shell
# This is the shell that i would normally use for my projects
# with this i don't have to setup a new enviroment for each
# machine im working on.

# The only tedius thing that i wouldn't recommend doing, is having
# a public set of keys for your docker, to have the time of registering
# each new docker to github or bitbucket.

# so do it to your own risk

# From is the most important part of the document as this says that is the
# source of the container. Is required to go first.
FROM ubuntu:latest

# Is always better to find your best image, so the packages that you need to
# install are minimal. Use Docker Official Images, as they are the most secure
# of all of the images, because they are done from the company and properlly
# fetched
RUN apt-get update && \
    apt-get -y install --no-install-recomends \


EXPOSE 80
