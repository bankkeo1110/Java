package com.kid.helloworld;

import java.util.Date;
import java.util.List;
import lombok.Data;
import jakarta.persistence.*;

@Entity
@Table(name = "Person")
@Data
public class Person {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int personID;

    private String firstName;
    private String lastName;
    private String email;
    @Column(columnDefinition = "DATE")
    private Date dateOfBirth;

    @OneToMany(mappedBy = "person")
    private List<Car> cars;

}   