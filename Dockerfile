# Dockerfile para aplicación Backend de Prueba Alliot
FROM ruby:2.7.0

# Actualizando dependencias del entorno
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev sqlite3

# Variables de Entorno

ARG MASTER_KEY
# ENV MASTER_KEY_ENV ${MASTER_KEY}

# Creación de directorio en el contenedor
RUN mkdir /alliot_backend
WORKDIR /alliot_backend

# Actualiza bundler
RUN gem install bundler:2.1.4

# Se copian los archivos con las gemas
COPY Gemfile /alliot_backend/Gemfile
COPY Gemfile.lock /alliot_backend/Gemfile.lock

# Copia de Llave Maestra
RUN mkdir /alliot_backend/config
RUN echo ${MASTER_KEY} >> /alliot_backend/config/master.key

# Se instalan las dependencias
RUN bundle install
# Se copian los archivos al directorio del contenedor
COPY . /alliot_backend

RUN rails db:create && rails db:migrate

# Se expone el puerto 3000
EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]
