<h1>OS requirements</h1>

<p>To install Docker Engine - Community, you need the 64-bit version of one of these Ubuntu versions:

Disco 19.04
Cosmic 18.10
Bionic 18.04 (LTS)
Xenial 16.04 (LTS)
Docker Engine - Community is supported on x86_64 (or amd64), armhf, arm64, s390x (IBM Z), and ppc64le (IBM Power) architectures.</p>





Uninstall old versions
Older versions of Docker were called docker, docker.io , or docker-engine. If these are installed, uninstall them:



$ sudo apt-get remove docker docker-engine docker.io containerd runc



It’s OK if apt-get reports that none of these packages are installed.

The contents of /var/lib/docker/, including images, containers, volumes, and networks, are preserved. The Docker Engine - Community package is now called docker-ce.






Supported storage drivers
Docker Engine - Community on Ubuntu supports overlay2, aufs and btrfs storage drivers.

Note: In Docker Engine - Enterprise, btrfs is only supported on SLES. See the documentation on btrfs for more details.

For new installations on version 4 and higher of the Linux kernel, overlay2 is supported and preferred over aufs. Docker Engine - Community uses the overlay2 storage driver by default. If you need to use aufs instead, you need to configure it manually. See aufs






Install Docker Engine - Community
You can install Docker Engine - Community in different ways, depending on your needs:

Most users set up Docker’s repositories and install from them, for ease of installation and upgrade tasks. This is the recommended approach.

Some users download the DEB package and install it manually and manage upgrades completely manually. This is useful in situations such as installing Docker on air-gapped systems with no access to the internet.

In testing and development environments, some users choose to use automated convenience scripts to install Docker.




Install using the repository
Before you install Docker Engine - Community for the first time on a new host machine, you need to set up the Docker repository. Afterward, you can install and update Docker from the repository.





SET UP THE REPOSITORY
Update the apt package index:

$ sudo apt-get update
Install packages to allow apt to use a repository over HTTPS:

$ sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common



Add Docker’s official GPG key:

$ curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -




Verify that you now have the key with the fingerprint 9DC8 5822 9FC7 DD38 854A E2D8 8D81 803C 0EBF CD88, by searching for the last 8 characters of the fingerprint.

$ sudo apt-key fingerprint 0EBFCD88
    
pub   rsa4096 2017-02-22 [SCEA]
      9DC8 5822 9FC7 DD38 854A  E2D8 8D81 803C 0EBF CD88
uid           [ unknown] Docker Release (CE deb) <docker@docker.com>
sub   rsa4096 2017-02-22 [S]
Use the following command to set up the stable repository. To add the nightly or test repository, add the word nightly or test (or both) after the word stable in the commands below. Learn about nightly and test channels.

Note: The lsb_release -cs sub-command below returns the name of your Ubuntu distribution, such as xenial. Sometimes, in a distribution like Linux Mint, you might need to change $(lsb_release -cs) to your parent Ubuntu distribution. For example, if you are using Linux Mint Tessa, you could use bionic. Docker does not offer any guarantees on untested and unsupported Ubuntu distributions.

x86_64 / amd64
armhf
arm64
ppc64le (IBM Power)
s390x (IBM Z)
$ sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
INSTALL DOCKER ENGINE - COMMUNITY
Update the apt package index.

$ sudo apt-get update
Install the latest version of Docker Engine - Community and containerd, or go to the next step to install a specific version:

$ sudo apt-get install docker-ce docker-ce-cli containerd.io
Got multiple Docker repositories?

If you have multiple Docker repositories enabled, installing or updating without specifying a version in the apt-get install or apt-get update command always installs the highest possible version, which may not be appropriate for your stability needs.

To install a specific version of Docker Engine - Community, list the available versions in the repo, then select and install:

a. List the versions available in your repo:

$ apt-cache madison docker-ce

  docker-ce | 5:18.09.1~3-0~ubuntu-xenial | https://download.docker.com/linux/ubuntu  xenial/stable amd64 Packages
  docker-ce | 5:18.09.0~3-0~ubuntu-xenial | https://download.docker.com/linux/ubuntu  xenial/stable amd64 Packages
  docker-ce | 18.06.1~ce~3-0~ubuntu       | https://download.docker.com/linux/ubuntu  xenial/stable amd64 Packages
  docker-ce | 18.06.0~ce~3-0~ubuntu       | https://download.docker.com/linux/ubuntu  xenial/stable amd64 Packages
  ...
b. Install a specific version using the version string from the second column, for example, 5:18.09.1~3-0~ubuntu-xenial.

$ sudo apt-get install docker-ce=<VERSION_STRING> docker-ce-cli=<VERSION_STRING> containerd.io
Verify that Docker Engine - Community is installed correctly by running the hello-world image.

$ sudo docker run hello-world
This command downloads a test image and runs it in a container. When the container runs, it prints an informational message and exits.

Docker Engine - Community is installed and running. The docker group is created but no users are added to it. You need to use sudo to run Docker commands. Continue to Linux postinstall to allow non-privileged users to run Docker commands and for other optional configuration steps.

UPGRADE DOCKER ENGINE - COMMUNITY
To upgrade Docker Engine - Community, first run sudo apt-get update, then follow the installation instructions, choosing the new version you want to install.

Install from a package
If you cannot use Docker’s repository to install Docker Engine - Community, you can download the .deb file for your release and install it manually. You need to download a new file each time you want to upgrade Docker.

Go to https://download.docker.com/linux/ubuntu/dists/, choose your Ubuntu version, browse to pool/stable/, choose amd64, armhf, arm64, ppc64el, or s390x, and download the .deb file for the Docker Engine - Community version you want to install.

Note: To install a nightly package, change the word stable in the URL to nightly. Learn about nightly and test channels.

Install Docker Engine - Community, changing the path below to the path where you downloaded the Docker package.

$ sudo dpkg -i /path/to/package.deb
The Docker daemon starts automatically.

Verify that Docker Engine - Community is installed correctly by running the hello-world image.

$ sudo docker run hello-world
This command downloads a test image and runs it in a container. When the container runs, it prints an informational message and exits.

Docker Engine - Community is installed and running. The docker group is created but no users are added to it. You need to use sudo to run Docker commands. Continue to Post-installation steps for Linux to allow non-privileged users to run Docker commands and for other optional configuration steps.

UPGRADE DOCKER ENGINE - COMMUNITY
To upgrade Docker Engine - Community, download the newer package file and repeat the installation procedure, pointing to the new file.

Install using the convenience script
Docker provides convenience scripts at get.docker.com and test.docker.com for installing edge and testing versions of Docker Engine - Community into development environments quickly and non-interactively. The source code for the scripts is in the docker-install repository. Using these scripts is not recommended for production environments, and you should understand the potential risks before you use them:

The scripts require root or sudo privileges to run. Therefore, you should carefully examine and audit the scripts before running them.
The scripts attempt to detect your Linux distribution and version and configure your package management system for you. In addition, the scripts do not allow you to customize any installation parameters. This may lead to an unsupported configuration, either from Docker’s point of view or from your own organization’s guidelines and standards.
The scripts install all dependencies and recommendations of the package manager without asking for confirmation. This may install a large number of packages, depending on the current configuration of your host machine.
The script does not provide options to specify which version of Docker to install, and installs the latest version that is released in the “edge” channel.
Do not use the convenience script if Docker has already been installed on the host machine using another mechanism.
This example uses the script at get.docker.com to install the latest release of Docker Engine - Community on Linux. To install the latest testing version, use test.docker.com instead. In each of the commands below, replace each occurrence of get with test.

Warning:

Always examine scripts downloaded from the internet before running them locally.

$ curl -fsSL https://get.docker.com -o get-docker.sh
$ sudo sh get-docker.sh

<output truncated>
If you would like to use Docker as a non-root user, you should now consider adding your user to the “docker” group with something like:

  sudo usermod -aG docker your-user
Remember to log out and back in for this to take effect!

Warning:

Adding a user to the “docker” group grants them the ability to run containers which can be used to obtain root privileges on the Docker host. Refer to Docker Daemon Attack Surface for more information.

Docker Engine - Community is installed. It starts automatically on DEB-based distributions. On RPM-based distributions, you need to start it manually using the appropriate systemctl or service command. As the message indicates, non-root users can’t run Docker commands by default.

UPGRADE DOCKER AFTER USING THE CONVENIENCE SCRIPT
If you installed Docker using the convenience script, you should upgrade Docker using your package manager directly. There is no advantage to re-running the convenience script, and it can cause issues if it attempts to re-add repositories which have already been added to the host machine.

Uninstall Docker Engine - Community
Uninstall the Docker Engine - Community package:

$ sudo apt-get purge docker-ce
Images, containers, volumes, or customized configuration files on your host are not automatically removed. To delete all images, containers, and volumes:

$ sudo rm -rf /var/lib/docker
You must delete any edited configuration files manually.

Next steps
Continue to Post-installation steps for Linux

Continue with the User Guide.

requirements, apt, installation, ubuntu, install, uninstall, upgrade, update
