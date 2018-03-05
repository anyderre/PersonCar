package com.example.PersonCar.Controller;


import com.example.PersonCar.Entities.Person;
import com.example.PersonCar.Repository.PersonRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.util.UriComponentsBuilder;

import javax.validation.Valid;
import java.util.List;

/**
 * Created by anyderre on 04/03/18.
 */
@RestController
@RequestMapping(value = "/api")
public class PersonController {
    @Autowired
    private PersonRepository personRepository;

    @PostMapping("/person/")
    public ResponseEntity<Void> savePerson(@Valid @RequestBody Person person, UriComponentsBuilder uriComponentsBuilder)
    {
       personRepository.save(person);
        HttpHeaders headers = new HttpHeaders();
        headers.setLocation(uriComponentsBuilder.path("/person/{id}").buildAndExpand(person.getId()).toUri());
        return new ResponseEntity<>(headers, HttpStatus.CREATED);
    }

    @RequestMapping(value = "/person/{id}",method = RequestMethod.DELETE)
    public ResponseEntity<Person> deletePerson(@PathVariable (value="id")long id){
        Person person = personRepository.findPersonByIdAndEnabledIsTrue(id);

        if (person==null){
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
        person.setEnabled(false);
        personRepository.save(person);
        return new ResponseEntity<>(HttpStatus.NO_CONTENT);
    }

    @GetMapping("/person/")
    public ResponseEntity<List<Person>> getList(){
        List<Person> personList = personRepository.findAllByEnabledIsTrue();
        if (personList.isEmpty())
            return new ResponseEntity<>(HttpStatus.NO_CONTENT);
        return new ResponseEntity<>(personList, HttpStatus.OK);
    }

    @GetMapping(value = "/person/{id}", produces = MediaType.APPLICATION_JSON_VALUE)
    public  ResponseEntity<Person> findPerson(@PathVariable(value = "id")long  id){
        Person person = personRepository.findPersonByIdAndEnabledIsTrue(id);
        if (person==null)
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        return new ResponseEntity<>(person, HttpStatus.OK);
    }

    @PutMapping("/person/{id}")
    public ResponseEntity<Person> updatePerson(@Valid @RequestBody Person person, @PathVariable(value = "id")long id){
        Person currentPerson = personRepository.findPersonByIdAndEnabledIsTrue(id);
        if(currentPerson==null){
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
        currentPerson.setEdad(person.getEdad());
        currentPerson.setName(person.getName());
         personRepository.save(currentPerson);
         return new ResponseEntity<>(currentPerson,HttpStatus.OK);
    }
}
