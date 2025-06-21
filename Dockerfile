# Use uma imagem base com Python
FROM python:3.11-slim

# Defina variáveis de ambiente
ENV PIP_NO_CACHE_DIR=1 \
    PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1

# Instale dependências do sistema
RUN apt-get update && apt-get install -y \
    curl \
    wget \
    unzip \
    git \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Instale o Ollama
RUN curl -fsSL https://ollama.com/install.sh | sh

# Crie um diretório para o app
WORKDIR /app

# Copie os arquivos do projeto
COPY . /app

# Instale dependências do Python
RUN python -m venv env && source env/bin/activate
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# Exponha a porta do Streamlit e do Ollama
EXPOSE 8501 11434

# Comando para subir Ollama em segundo plano e depois iniciar Streamlit
CMD ollama serve & \
    streamlit run app.py --server.port 8501 --server.address 0.0.0.0
