package com.kid.helloworld;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class HelloworldApplication {

    public static void main(String[] args) {
        System.out.println("1");
        System.getProperties().put( "server.port", 8185 );  //8181 port is set here
        SpringApplication.run(HelloworldApplication.class, args);

    }
}
