package com.example.PersonCar.Controller;

import com.example.PersonCar.Entities.Car;
import com.example.PersonCar.Repository.CarRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.util.UriComponentsBuilder;

import javax.validation.Valid;
import java.util.List;

/**
 * Created by anyderre on 04/03/18.
 */
@RestController
@RequestMapping("/api")
public class CarController {
    @Autowired
     private CarRepository carRepository;
    @PostMapping("/car/")
    @ResponseStatus(HttpStatus.CREATED)
    public ResponseEntity<Car> saveCar(@Valid @RequestBody Car car, UriComponentsBuilder componentsBuilder){
        carRepository.save(car);
        HttpHeaders headers = new HttpHeaders();
        headers.setLocation(componentsBuilder.path("/car/id").buildAndExpand(car.getId()).toUri());
        return new ResponseEntity<>(headers, HttpStatus.OK);
    }

    @RequestMapping(value = "/car/{id}", method = RequestMethod.DELETE)
    public ResponseEntity<Car> deleteCar(@PathVariable (value="id")long id){
        Car car = carRepository.findCarByIdAndEnabledIsTrue(id);

        if (car==null){
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
        car.setEnabled(false);
        carRepository.save(car);
       return new ResponseEntity<>(HttpStatus.NO_CONTENT);
    }

    @GetMapping("/car/")
    public ResponseEntity <List<Car>> getList(){
        List<Car> cars = carRepository.findAllByEnabledIsTrue();
        if (cars.isEmpty())
            return new ResponseEntity<>(HttpStatus.NO_CONTENT);
        return new ResponseEntity<>(cars, HttpStatus.OK);
    }

    @GetMapping("/car/{id}")
    public ResponseEntity<Car> findCar(@PathVariable(value = "id")long  id){
        Car car =carRepository.findCarByIdAndEnabledIsTrue(id);
        if(car==null)
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        return new ResponseEntity<>(car, HttpStatus.OK);
    }

    @PutMapping("/car/{id}")
    public ResponseEntity<Car> updateCar(@Valid @RequestBody Car car, @PathVariable(value = "id")long id){
        Car currentCar = carRepository.findCarByIdAndEnabledIsTrue(id);
        if(currentCar==null)
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        currentCar.setColor(car.getColor());
        currentCar.setImage(car.getImage());
        currentCar.setMarca(car.getMarca());
        carRepository.save(currentCar);
        return new ResponseEntity<>(car, HttpStatus.OK);
    }
}
