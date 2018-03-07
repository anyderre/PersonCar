/**
 * Created by anyderre on 04/03/18.
 */
'use strict'
angular.module("personCarApp").controller("CarController", ['$scope','CarServices',function ($scope, CarServices) {
    var self = this;
    self.cars = [];
    self.car = {id:null,image:'', color:'', marca:''};
    self.errorMessage ="";
    self.edit=edit;
    self.remove = remove;
    self.submit = submit;
    self.reset = reset;

    fetchAllCar();

    function fetchAllCar() {
        CarServices.fetchAllCar()
            .then(
                function (d) {
                    self.cars = d;
                    console.log("Reading all the cars");
                },
                function (err) {
                    console.error(err);
                }
            )
    }

    function createCar(car) {
        CarServices.createCar(car)
            .then(
                fetchAllCar,
                function (err) {
                    self.errorMessage ="Error while creating the car";
                    console.error('Error while creating car');
                }
            )
    }

    function updateCar(car, id) {
        CarServices.updateCar(id, car)
            .then(
                fetchAllCar,
                function (err) {
                    self.errorMessage = "Error while updating car "+ id;
                    console.error(err);
                }
            )
    }

    function deleteCar(id) {
        CarServices.deleteCar(id)
            .then(
                fetchAllCar,
                function (err) {
                    self.errorMessage = "Error while deleting car "+ id;
                    console.error(err);
                }
            )
    }

    function submit() {
       if(self.car.id===null){
           createCar(self.car);
           console.log("Creating a new car");
           console.log(self.car);
           reset();
       }else {
           updateCar(self.car, self.car.id);
           console.log("Updating car with id: "+self.car.id);
           console.log(self.car);
           reset();
       }
        reset();

    }
    function edit(id) {
        console.log("Car to be updated id: "+ id);
        for(var i=0; i<self.cars.length; i++){
            if(self.cars[i].id===id){
                self.car = angular.copy(self.cars[i]);
                break;
            }
        }
        console.log(self.car)
    }
    function remove(id) {
        console.log("Car to be deleted with id: "+ id);
        deleteCar(id);
        if(self.car.id ===id)
            reset();

    }

    function reset() {
        self.car = {id:null,image:'', color:'', marca:''};
        $scope.myForm.$setPristine();
    }

}])