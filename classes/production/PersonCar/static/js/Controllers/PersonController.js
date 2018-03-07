/**
 * Created by anyderre on 04/03/18.
 */
'use strict';

angular.module('personCarApp').controller('PersonController', ['$scope', 'PersonServices', 'CarServices', function ($scope, PersonServices,CarServices) {
    var self = this;
    self.person = {id:null, name:'', edad:null, personCars:[]}
    self.persons= [];
    self.successMessag='';
    self.errorMessage='';
    self.submit = submit;
    self.edit = edit;
    self.remove = remove;
    self.reset= reset;
    self.changedCar =changedCar;
    self.deleteCar=deleteCar;
    self.cars = [];
    self.choosenCars=[];
    self.selectedCar={id:null, image:'', marca:'',color:''};
    self.updated= false;

    fetchAllPersons();
    fetchAllCar();
    function fetchAllPersons() {
        PersonServices.fetchAllPersons()
            .then(
                function (d) {
                self.persons = d;
                    console.log(d);
            },
            function (errorResponse) {
                console.error(errorResponse);
            })
    }

    function fetchAllCar() {
        CarServices.fetchAllCar()
            .then(
                function (d) {
                    self.cars = d;
                    console.log("Reading all the cars");
                    console.log(d);
                },
                function (err) {
                    console.error(err);
                }
            )

    }
    function createPerson(person) {
        PersonServices.createPerson(person)
            .then(
                fetchAllPersons,
                function (err) {
                    self.errorMessage='Error while creating Person';
                    console.error(err);
                }
            )
    }

    function updatePerson(person, id) {
        PersonServices.updatePerson(person,id)
            .then(
                fetchAllPersons,
                function (errResponse) {
                    self.errorMessage='Error while updating Person';
                    console.error(errResponse);
                }
            )
    }

    function deletePerson(id) {
        PersonServices.deletePerson(id)
            .then  (
                fetchAllPersons,
                function (errResponse) {
                    self.errorMessage='Error while creating Person';
                    console.error(errResponse)
                }
            )
    }

    function submit() {
        if(self.person.id===null){
            console.log('Saving new User');
            for(var i=0; i<self.choosenCars.length; i++){
                self.person.personCars.push({id:null, person:null, car:self.choosenCars[i]})
            }

            createPerson(self.person);
        }else {
            console.log('Updating person wtih id: '+self.person.id);
            updatePerson(self.person, self.person.id);
        }
        reset();
    }

    function edit(id) {
        console.log('id to be edited', id);
        for(var i=0; i<self.persons.length; i++){
            if (self.persons[i].id=== id){
                self.person = angular.copy(self.persons[i]);
                self.choosenCars= self.person.personCars;
                break;
            }
        }

    }
    function remove(id) {
        console.log('Person id to be deleted ', id);
        if(self.person.id===id)
        {//clean the form if person to be deleted to be deleted is shown there
            reset();
        }
        deletePerson(id);
    }

    function reset() {
        self.person = {id:null, name:'', edad:null};
        $scope.myForm.$setPristine();//reset form
    }

    function deleteCar(id) {
        for(var i=0; i<self.choosenCars.length; i++){
            if(self.choosenCars[i].id===id){
                self.choosenCars.splice(i,1);
            }
        }
    }


   function changedCar(car) {

       for(var i=0; i<self.choosenCars.length; i++){
                   if(self.choosenCars[i] === car){
                       self.updated=false;
                     return;
                   }
               }
           self.choosenCars.push(car);
       self.updated =true;
           console.log(self.choosenCars);

   }

}]);