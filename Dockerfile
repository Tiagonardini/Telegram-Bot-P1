FROM alpine:latest

WORKDIR /app

# 1. Instalamos Python y TODA la maquinaria de compilación pesada
RUN apk add --no-cache \
    python3 \
    py3-pip \
    python3-dev \
    build-base \
    postgresql-dev \
    libffi-dev \
    openssl-dev \
    rust \
    cargo

# 2. Creamos un entorno virtual y lo activamos (obligatorio en Alpine moderno)
RUN python3 -m venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"



COPY ./requirements.txt requirements.txt
RUN pip3 install -r requirements.txt
COPY . .
COPY ./bot/telegram_bot.py /app/telegram_bot.py
COPY ./main.py /app/main.py
CMD ["python3", "main.py"]

