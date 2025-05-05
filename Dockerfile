FROM pytorch/pytorch:2.2.2-cuda12.1-cudnn8-runtime
ENV PYTHONUNBUFFERED=1

WORKDIR /opt/app

RUN apt-get update && apt-get install -y \
    build-essential \
    curl unzip \
    libsm6 libxext6 libgl1 libglib2.0-0 \
    && rm -rf /var/lib/apt/lists/*

RUN pip install notebook==6.5.7

COPY requirements.txt /opt/app
RUN pip install --no-cache-dir -r requirements.txt

CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root"]