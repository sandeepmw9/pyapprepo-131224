# stage 1 build
FROM python:3.9 AS base
WORKDIR /app

COPY backend/ .

RUN pip install --no-cache-dir -r requirements.txt
COPY . .

# stage 2
FROM python:3.9-slim

WORKDIR /app

COPY --from=base /usr/local/lib/python3.9/site-packages/ /usr/local/lib/python3.9/site-packages/

COPY --from=base /app /app

EXPOSE 5000

CMD ["python", "app.py"]
