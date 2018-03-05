package com.example.PersonCar.Controller;

import com.example.PersonCar.Entities.Car;
import com.example.PersonCar.Repository.CarRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;

/**
 * Created by anyderre on 04/03/18.
 */
@RestController
@RequestMapping("/api/car")
public class CarController {
    @Autowired
     private CarRepository carRepository;
    @PostMapping("/save")
    @ResponseStatus(HttpStatus.CREATED)
    public Car saveCar(@Valid @RequestBody Car car){
        return carRepository.save(car);
    }

    @RequestMapping("/delete/{id}")
    public boolean deleteCar(@PathVariable (value="id")long id){
        Car car = carRepository.findCarByIdAndEnabledIsTrue(id);

        if (car==null){
            return false;
        }
        car.setEnabled(!car.isEnabled());
        return true;
    }

    @GetMapping("/list")
    public List<Car> getList(){
        return carRepository.findAllByEnabledIsTrue();
    }

    @GetMapping("/{id}")
    public Car findCar(@PathVariable(value = "id")long  id){
        return carRepository.findCarByIdAndEnabledIsTrue(id);
    }

    @PutMapping("/update")
    public Car updateCar(@Valid @RequestBody Car car){
        return carRepository.save(car);
    }
}
