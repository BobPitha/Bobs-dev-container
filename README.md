# RX-200 (ROS 1) container

## Overwiew
This repository contains a Docker-based development and deployment environment intended to be configured for
personal or project-specific needs. It's designed to offer a consistent development environment that can be
easily shared, replicated, and reconfigured across different setups. This container provides a basic ROS 1
Noetic environment with the Interbotix software for the Trossen RX-200 arm.

## Specifications:
* **Base OS**: Ubuntu 20.04 Focal
* **ROS**: Noetic
* **Special features**: Interbotix RX-200 software

## Intro
This development/deployment environment is one I've used for various past projects. It is a modified version
of one constructed for a robotics project at GreyOrange by Shawn Shaffert. The good ideas are his;
responsibility for any mistakes are mine.

The primary concept here is that a base image is built to be a common system framework that can serve as
the foundation for both a development and a production container. The base image should supply all necessary
dependencies for the project; the development image will add interactive tools and applications needed to
supply a development environment.

## Project Integration
To include a project:
1. Create a subfolder named `workspace/`
2. Inside `workspace/`, create symlinks to your individual project(s) (which are typically in their own repos).

The workspace folder will be mounted in the container as `/workspace`, and each symlink will also be mounted into `/workspace`.

## Usage

Most interaction is via **make**. The most important commands:

* `make dev` - (default) builds the development image.
* `make prod` - makes the production image, (if it were set up, which it currently isn't)
* `make shell` - open a shell into the development container, starting it if necessary.
* `make stop` - stops the running development container

## Customization
`Dockerfile-dev` currently contains various optional sections near the end to download and install various IDEs such as VS Code, IntelliJ IDEA, and vim. Others are possible too; I had eclipse in there at one point, and emacs. A more streamlined method for tool selection is being considered. 

If you create a file named `.bashrc_dev`, it will be appended to the .bashrc in the container, allowing for customizations.

## Dependencies
* Docker (obviously)
* make
* probably other things TBD.

Whilst this is obviously a work in progress, it's very useable as it is now.

## Feedback
Please contact [Bob Pitha](mailto:bpitha@medacuity.com) if you have any comments, questions, or suggstions.
