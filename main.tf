terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
    }
  }
}

provider "docker" {}

resource "docker_image" "nginx" {
  name         = "nginx:latest"
  keep_locally = false
}

resource "docker_image" "httpd" {
  name         = "httpd:latest"
  keep_locally = false
}

resource "docker_container" "nginx" {
  image = docker_image.nginx.latest
  name  = "NGINX"
  ports {
    internal = 80
    external = 8000
  }
}

resource "docker_container" "httpd" {
  image = docker_image.httpd.latest
  name  = "httpd"
  ports {
    internal = 80
    external = 8001
  }
}
