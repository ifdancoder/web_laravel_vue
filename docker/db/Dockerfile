FROM mariadb

ARG UID
ARG GID

RUN groupmod -g $GID mysql
RUN usermod -u $UID mysql

# Устанавливаем необходимые пакеты
RUN apt-get update && apt-get install -y \
    git \
    gcc \
    make \
    libmariadb-dev-compat 

USER mysql