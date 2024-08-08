FROM python:3.11-slim

WORKDIR /code

COPY requirements.txt ./

RUN pip install --no-cache-dir -r requirements.txt

ENTRYPOINT ["/bin/bash", "-l", "-c"]

CMD ["streamlit run ./src/app.py"]