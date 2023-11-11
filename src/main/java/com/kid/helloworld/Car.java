package com.kid.helloworld;

import jakarta.persistence.*;
import lombok.Data;

@Data
@Entity
@Table(name = "car")
public class Car {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int carId;

    private String make;
    private String model;
    private String vin;
    private int year;

    @ManyToOne
    @JoinColumn(name = "personID")
    private Person person;

    

    
}

