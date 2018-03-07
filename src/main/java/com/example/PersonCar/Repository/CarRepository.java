package com.example.PersonCar.Repository;

import com.example.PersonCar.Entities.Car;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by anyderre on 04/03/18.
 */
@Repository
public interface CarRepository extends JpaRepository<Car, Long> {
    List<Car> findAllByEnabledIsTrue();
    Car findCarByIdAndEnabledIsTrue(long id);
    Car save(Car car);
}
