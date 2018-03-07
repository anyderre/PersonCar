package com.example.PersonCar.Repository;

import com.example.PersonCar.Entities.Person;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by anyderre on 04/03/18.
 */
@Repository
public interface PersonRepository extends JpaRepository<Person,Long > {
    Person findPersonByIdAndEnabledIsTrue(long id);
    List<Person> findAllByEnabledIsTrue();
    Person save (Person person);
}
