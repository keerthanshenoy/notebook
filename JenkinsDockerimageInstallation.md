<h1> Jenkin installation using Docker image </h1>

Download jenkins using command :

<b>$ docker pull jenkins/jenkins</b>

it will dowload all packages and if u want check weather jenkins dowloaded or not by using following command

<b> $ docker images </b>

- create one directory with name <b>jenkins-date</b>
- create another directory with a name <b>jenkins_home</b> within <b>jenkins-date</b>
- Lets create one docker-compose file with a name <b>docker-compose.yml</b>
 
<b>version: '3'
services:
  jenkins:
    container_name: jenkins
    image: jenkins/jenkins
    ports:
      - "8080:8080"
    volumes:
      - "$PWD/jenkins_home:/var/jenkins_home"
    networks:
      - net
networks:
  net:</b>
  
  <pre>version: &apos;3&apos;
services:
  jenkins:
    container_name: jenkins
    image: jenkins/jenkins
    ports:
      - &quot;8080:8080&quot;
    volumes:
      - &quot;$PWD/jenkins_home:/var/jenkins_home&quot;
    networks:
      - net
networks:
  net:
</pre>
