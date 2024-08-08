# Docker Dev Container Example

This repository provides an example setup for developing a simple Streamlit application using a Docker Container.

## Prerequisites
- Docker installed on your machine
- Visual Studio Code with the Remote Containers extension installed

## Usage

### 1) Starting and Stopping the Dev Container

```sh
docker-compose up
docker-compose down
```

Start the container in detached mode (runs in the background):
```sh
docker-compose up -d
```

Re-build the image if you have made changes to the Dockerfile or dependencies:
```sh
docker-compose up --build
```


### 2) Attaching VS Code to the Running Container

To attach Visual Studio Code to the running container:
1) Open the Command Palette (Ctrl+Shift+P or Cmd+Shift+P on macOS).
2) Select Dev Containers: Attach to Running Container....
3) Choose the appropriate container from the list.

## Accessing the Streamlit App

Once the container is running, you can access your Streamlit app in your browser at http://localhost:8501.

## Additional Information

### Dockerfile

* **FROM python:3.11-slim** - This line specifies the base image to use, which is `python:3.11-slim`. This image is lightweight and includes Python 3.11.
* **WORKDIR /code** - Sets the working directory inside the container to `/code`. This is where the application code will be placed.
* **COPY requirements.txt .** - Copies `requirements.txt` from your local directory into the container's `/code` directory.
* **RUN pip install --no-cache-dir -r requirements.txt** - Installs the Python dependencies listed in `requirements.txt` into the container without caching to minimize image size.
* **ENTRYPOINT \["/bin/bash", "-l", "-c"\]** - Sets the default executable for the container. This configuration allows you to run commands in a login shell mode.
* **CMD \["streamlit run ./src/app.py"\]** - Specifies the default command to run when the container starts. In this case, it runs a Streamlit application located at `./src/app.py`.

### docker-compose.yml

* **version: "3"** - Specifies the version of Docker Compose file format being used
* **services** - Defines the services that make up your application
* **app** - The name of your service
* **build: ./** - Specifies the build context. In this case, it builds the Dockerfile located in the current directory (`./`)
* **container\_name: python-server** - Sets the container name to `python-server`
* **ports: 127.0.0.1:8501:8501** - Maps port `8501` on your local machine to port `8501` inside the container. This allows you to access the Streamlit app running inside the container at `http://localhost:8501`
* **volumes: ./:/code** - Mounts the current directory (`./`) as a volume inside the container at `/code`. This allows changes made on your local machine to be reflected immediately inside the container
* **restart: unless-stopped** - Specifies the restart policy for the container. It ensures that the container restarts automatically unless it is explicitly stopped