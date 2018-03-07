package com.example.PersonCar.Repository;

import com.example.PersonCar.Entities.PersonCar;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * Created by anyderre on 07/03/18.
 */
@Repository
public interface PersonCarRepository extends JpaRepository<PersonCar, Long> {
    PersonCar save (PersonCar personCar);
    PersonCar findAllByPerson_IdAndEnabledIsTrue(long id);
}
