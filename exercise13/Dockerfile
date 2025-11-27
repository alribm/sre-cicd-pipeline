# Imagen base ligera de Python
FROM python:3.11-slim

# Evita que Python genere archivos .pyc y buffers
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Directorio de trabajo dentro del contenedor
WORKDIR /app

# Instalar dependencias directamente
RUN pip install --no-cache-dir flask requests gunicorn

# Copiar el código de la aplicación
COPY . .

# Exponer el puerto de Flask
EXPOSE 5000

# Comando de arranque (puedes usar flask o gunicorn)
# Opción simple con Flask:
#ENV FLASK_APP=app.py
#CMD ["flask", "run", "--host=0.0.0.0", "--port=5000"]

# Opción más robusta con Gunicorn (si tu app se llama app.py y la instancia es "app"):
CMD ["gunicorn", "--bind", "0.0.0.0:5000", "app:app"]
