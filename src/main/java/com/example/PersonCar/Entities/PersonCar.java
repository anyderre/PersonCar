package com.example.PersonCar.Entities;

import lombok.Data;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

/**
 * Created by anyderre on 04/03/18.
 */
@Data
@Entity
public class PersonCar implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;
    @ManyToOne(cascade = CascadeType.ALL)
    private Car car;
    @ManyToOne(cascade = CascadeType.ALL)
    private Person person;
    private Date fechaRegistro;
    private boolean enabled;
}
