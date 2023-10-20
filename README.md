# Bobs-dev-container
A Docker-based development environment I've found useful

This is a basic environment I've used for a few projects. It incorporates ideas and approaches from various past colleagues, most notably
Shawn Shaffert at GreyOrange. 

The idea here is that a base image is built that is used as the base image for a development container, and potentially a production container as well. In the development container, the shell prompt is customized to make the shell distinctive.

To include a project, create a subfolder named workspace/, and make a symlink in there to your project(s) (which typically are in their own repos). The workspace folder will be mounted in the container as /workspace, and each symlink will also be mounted into /workspace.

Most interaction is via make. The most important commands:
* make dev - (default) makes the development container.
* make prod - makes the production container, if it were set up (which it currently isn't)
* make shell - open a shell into the development container, starting it if necessary.
* make stop - stops the running development container

Dockerfile-dev currently contains various commentable sections near the end to download and install VS Code, IntelliJ IDEA, and vim. Others are possible too; I had eclipse in there at one point, and emacs. It would be good to have a better way of choosing what tools to activate at some point, rather than editing the Dockerfile. 

If you create a file named .bashrc_dev, it will be appended to the .bashrc in the container, allowing for customizations.

Dependencies: you need Docker (obviously), make, probably other things.
This is obviously a work in progress, but it's very useable as it is now.

Talk to Bob in you have any comments, questions, or suggstions.
