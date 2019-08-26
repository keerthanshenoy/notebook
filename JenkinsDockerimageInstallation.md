<h1> Jenkin installation using Docker image </h1>

Download jenkins using command :

<b>$ docker pull jenkins/jenkins</b>

it will dowload all packages and if u want check weather jenkins dowloaded or not by using following command

<b> $ docker images </b>

- create one directory with name <b>jenkins-date</b>
- create another directory with a name <b>jenkins_home</b> within <b>jenkins-date</b>
- Lets create one docker-compose file with a name <b>docker-compose.yml</b>
 
<b>
  <pre>version: &apos;3&apos;
services:
  jenkins:
    container_name: jenkins
    image: jenkins/jenkins         //name of the image
    ports:
      - &quot;8080:8080&quot;      //maping
    volumes:
      - &quot;$PWD/jenkins_home:/var/jenkins_home&quot;   //to keep data in /var/jenkins_home
    networks:
      - net
networks:
  net:
</pre>
</b>


- provide permission for user to use directory <b>jenkins_home</b>
    - for that we need to know uid of the user
    - use command <b> $ id </b> to get UID of the user
    - provide permission using following command
      <b> $ sudo chown 1000:1000 jenkins_home -R </b>
        - where 1000 is UID 
        - -R recurssive
 
 
 - run the docker compose file to run jenkin server using command
     - <b> $ docker-compose up -d </b>
     
     
     
  - go to browser and using your system ip address follwed by 8080
    -192.168.43.171:8080
    
  - then it will ask password
     for that use command
     
    <b> $docker logs -f jenkins</b>
    
   - you can find hexa code over there and copy and ppaste n browser
   - install using suggested pugins
   - enter username and password
   
   jenkins ready to use now............................
   
  
        
      
  

