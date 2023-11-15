# Bobs-dev-container - bdc-jammy-rti

## Overwiew
This repository contains a Docker-based development and deployment environment intended to be configured for
personal or project-specific needs. It's designed to offer a consistent development environment that can be
easily shared, replicated, and reconfigured across different setups.

## Specifications:
* **Base OS**: Ubuntu 22.04 Jammy
* **ROS**: not included
* **Special features**: RTI developer tools

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

For this branch of the docker IDE container to build correctly, you need to get the following files:, and put them in a subfolder of this repo named rti/ :
* rti_connext_dds-6.1.2-pro-host-x64Linux.run (Download from RTI)
* rti_license.dat (ditto again)

Optionally, you can also include:
* any number of RTI target packages (such as rti_connext_dds-6.1.2-pro-target-x64Linux4gcc7.3.0.rtipkg)
* connextdds-py.zip (this is a backup of an old verion of the RTI Python API library)

You'll need an RTI license to get rti_license.dat (I hope that's obvious). Download all the RTI files from https://support.rti.com/s/downloads. The docker build will install any rtipkg files in the rti/ directory.

If you include connextdds-py.zip, you can set that up by opening the shell, and typing:\
`ma@bdc-jammy-rti:~$` **`setup_py_dds.sh`**</span>\
Then go get some coffee, it takes a while. And if you ever reset the container, you have to do it over again.

Once you've set up the DDS Python API as above, you can run the dds emulater if you've included the repo it's in. Run it like this:

`ma@bdc-jammy-rti:~$` **`cd /workspace/source/src/dds-emulator/test/pyGui/`** \
`ma@bdc-jammy-rti:/workspace/source/src/dds-emulator/test/pyGui$` **`python3 dds_emulator.py`**

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
* RTI
* probably other things TBD.

Whilst this is obviously a work in progress, it's very useable as it is now.

## Feedback
Please contact [Bob Pitha](mailto:bpitha@medacuity.com) if you have any comments, questions, or suggstions.
