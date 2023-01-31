FROM python:3.9

WORKDIR /usr/src/app

COPY requirements.txt ./
RUN pip install --upgrade pip
RUN pip install -r requirements.txt
RUN pip install gunicorn

COPY . .

EXPOSE 8000

# CMD ["./manage.py","runserver","8080"]
CMD ["gunicorn", "pragmatic.wsgi", "--bind", "0.0.0.0:8000"]
