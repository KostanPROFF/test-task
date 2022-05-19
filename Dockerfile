FROM python:alpine

COPY . /app

WORKDIR /app

RUN pip install -r requirements.txt && apk add curl

HEALTHCHECK CMD curl --fail http://localhost:5000/ || exit 1

CMD ["python", "app.py"]
