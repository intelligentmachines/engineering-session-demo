# base image
FROM python:3
# creating the /code directory where our application code should be
RUN mkdir /code
# setting /code directory as our work directory
WORKDIR /code

# copying our depdency in /code folder. 
# We can use . in here because we have set our workdir earlier
COPY requirements.txt .
# installing the requirements
RUN pip install -r requirements.txt

# letting other devs know that we have some service running on port 5000
EXPOSE 5000
# letting other devs know that we have a variable named APP_NAME
ENV APP_NAME="Default Value"
#COPY all the files in /code folder except the files in .dockerignore
# first . means our application folder
# second . means the /code folder in image
COPY . .
# Command to initiate when image is run on docker.
CMD [ "python", "app.py" ]
