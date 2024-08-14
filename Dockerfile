# start from base
FROM python:3.11-alpine


# install system-wide deps for python and node
RUN apk add  curl gnupg
RUN apk  add   nodejs npm

# copy our application code
ADD flask-app /opt/flask-app
WORKDIR /opt/flask-app
RUN which python3
RUN pip install --no-cache-dir -r requirements.txt
# fetch app specific deps
RUN npm install
RUN npm run build
# expose port
EXPOSE 5000

# start app
CMD [ "python3", "./app.py" ]
