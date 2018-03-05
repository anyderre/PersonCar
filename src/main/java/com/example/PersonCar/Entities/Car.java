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

public class Car implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;
    private String image;
    private String color;
    private String marca;
    @ManyToOne(targetEntity = PersonCar.class)
    private List<PersonCar> personCars;
    private boolean enabled = true;

}
