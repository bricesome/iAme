# Utiliser l'image Python 3.11.4 slim comme base
FROM python:3.11.4-slim

# Définir le répertoire de travail
WORKDIR /app

# Copier le fichier de dépendances
COPY requirements.txt .

COPY . .

# Installer les dépendances
RUN apt-get update && apt-get install -y \
    python3-dev \
    default-libmysqlclient-dev \
    build-essential \
    pkg-config \
    libmariadb-dev

RUN pip install  -r requirements.txt


# Exposer le port sur lequel l'application sera accessible
EXPOSE 8501

# Commande pour démarrer l'application Streamlit
CMD ["streamlit", "run", "lamaondex.py", "--server.port=8501", "--server.address=0.0.0.0"]
