package com.example.PersonCar.Entities;

import lombok.Data;

import javax.persistence.*;
import java.io.Serializable;
import java.util.List;

/**
 * Created by anyderre on 04/03/18.
 */
@Data
@Entity
public class Person implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;
    private String name;
    private int edad;
    @ManyToOne(targetEntity = PersonCar.class)
    private List<PersonCar> personCars;
    private boolean enabled = true;
}
