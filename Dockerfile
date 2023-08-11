FROM tiangolo/uwsgi-nginx-flask:latest
RUN groupadd -r some_app && useradd --no-log-init -r -g some_app some_app
ENV MYAPP_RUN_IN_DOCKER=true
ENV REMOTE_ENDPOINT="http://304.0.133.100/important_endpoint"
RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install vim 
RUN mkdir /certs
ENV PRIVATE_KEY="-----BEGIN PRIVATE KEY-----\nidifgsdjfhskdhfHGGjhjkhKHJG\n-----END PRIVATE KEY----"
RUN echo $PRIATE_KEY > /certs/private_key
RUN git clone https://github.com/extra_software
COPY ./app /app
CMD python /app/app.py