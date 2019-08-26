<h1> Docker installation</h1>

<h2>OS requirements</h2>

<p>To install Docker Engine - Community, you need the 64-bit version of one of these Ubuntu versions:

Disco 19.04
Cosmic 18.10
Bionic 18.04 (LTS)
Xenial 16.04 (LTS)
Docker Engine - Community is supported on x86_64 (or amd64), armhf, arm64, s390x (IBM Z), and ppc64le (IBM Power) architectures.</p>





<h2>Uninstall old versions</h2>
Older versions of Docker were called docker, docker.io , or docker-engine. If these are installed, uninstall them:



<b>$ sudo apt-get remove docker docker-engine docker.io containerd runc</b>



<p>It’s OK if apt-get reports that none of these packages are installed.

The contents of /var/lib/docker/, including images, containers, volumes, and networks, are preserved. The Docker Engine - Community package is now called docker-ce.</p>



<p>Install using the repository
Before you install Docker Engine - Community for the first time on a new host machine, you need to set up the Docker repository. Afterward, you can install and update Docker from the repository.</p>





<h2>SET UP THE REPOSITORY</h2>
<h3>Update the apt package index:</h3>

<b>$ sudo apt-get update</b>

<h3>Install packages to allow apt to use a repository over HTTPS:</h3>

<b>$ sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common</b>



<h3> Add Docker’s official GPG key:</h3>

<b>$ curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - </b>




<h3>Verify that you now have the key with the fingerprint 9DC8 5822 9FC7 DD38 854A E2D8 8D81 803C 0EBF CD88, by searching for the last 8 characters of the fingerprint.</h3>

<b> $ sudo apt-key fingerprint 0EBFCD88 </b>
    
pub   rsa4096 2017-02-22 [SCEA]
      9DC8 5822 9FC7 DD38 854A  E2D8 8D81 803C 0EBF CD88
uid           [ unknown] Docker Release (CE deb) <docker@docker.com>
sub   rsa4096 2017-02-22 [S]
Use the following command to set up the stable repository. To add the nightly or test repository, add the word nightly or test (or both) after the word stable in the commands below. Learn about nightly and test channels.

Note: The lsb_release -cs sub-command below returns the name of your Ubuntu distribution, such as xenial. Sometimes, in a distribution like Linux Mint, you might need to change $(lsb_release -cs) to your parent Ubuntu distribution. For example, if you are using Linux Mint Tessa, you could use bionic. Docker does not offer any guarantees on untested and unsupported Ubuntu distributions.

x86_64 / amd64

<b>$ sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"</b>
   
   
INSTALL DOCKER ENGINE - COMMUNITY


<h3>Update the apt package index.</h3>

<b>$ sudo apt-get update</b>




<h3>Install the latest version of Docker Engine - Community and containerd, or go to the next step to install a specific version:</h3>

<b>$ sudo apt-get install docker-ce docker-ce-cli containerd.io</b>






If you would like to use Docker as a non-root user, you should now consider adding your user to the “docker” group with something like:

  <b> sudo usermod -aG docker your-user </b>
  
  
Remember to log out and back in for this to take effect!



Uninstall Docker Engine - Community
Uninstall the Docker Engine - Community package:

$ sudo apt-get purge docker-ce
Images, containers, volumes, or customized configuration files on your host are not automatically removed. To delete all images, containers, and volumes:

$ sudo rm -rf /var/lib/docker
You must delete any edited configuration files manually.

