FROM nginx:latest

ADD build
COPY build/index.html /usr/share/nginx/html/index.html
COPY build/DockerFileEx.jpg /usr/share/nginx/html/DockerFileEx.jpg

EXPOSE 80