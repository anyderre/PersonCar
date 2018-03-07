/**
 * Created by anyderre on 04/03/18.
 */
'use strict';
angular.module("personCarApp").factory("CarServices",['$q','$http',function ($q, $http) {

    var factory ={
        fetchAllCar:fetchAllCar,
        createCar:createCar,
        updateCar:updateCar,
        deleteCar:deleteCar
    }
    return factory;
    function fetchAllCar() {
        var deferred = $q.defer();
        $http.get("/api/car/")
            .then(function (response) {
                deferred.resolve(response.data);
                console.log('Reading all the cars');
            },
                function (error) {
                    deferred.reject(error);
                    console.error('Failed to load  all the cars');
                }
            )
        return deferred.promise;
    }

    function createCar(car) {
        var deferred = $q.defer();
        $http.post("/api/car/", car)
            .then(
                function (response) {
                    console.log("Creating a new car");
                    deferred.resolve(response.data)
                },
                function (err) {
                    deferred.reject(err);
                    console.error('Failed to create new car');
                }
            )
        return  deferred.promise;
    }

    function updateCar(id, car) {
        var deferred = $q.defer();
        $http.put("/api/car/"+id, car)
            .then(
                function (response) {
                    console.log("Update a car");
                    deferred.resolve(response.data)
                },
                function (err) {
                    deferred.reject(err);
                    console.error('Failed to update the car');
                }
            )
        return deferred.promise;
    }

    function deleteCar(id) {
        var deferred = $q.defer();
        $http.delete("/api/car/"+id)
            .then(
                function (response) {
                    console.log("Deleting a new car");
                    deferred.resolve(response.data)
                },
                function (err) {
                    deferred.reject(err);
                    console.error('Failed to delete the car');
                }
            )
    }
}]);
