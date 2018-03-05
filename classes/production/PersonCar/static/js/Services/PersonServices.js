/**
 * Created by anyderre on 04/03/18.
 */

'use strict '
angular.module('personCarApp').factory('PersonServices', ['$http','$q', function ($http, $q) {
    var REST_SERVICE_URI ='<a class = "vglink" href="http://localhost:5000/api/person/" rel="nofollow"><span>http</span><span>://</span><span>localhost</span><span>:</span><span>5000</span><span>/</span><span>api</span><span>/</span><span>person<span>/</span></span></a>';
    var factory = {
        fetchAllPersons: fetchAllPerson,
        createPerson: createPerson,
        updatePerson: updatePerson,
        deletePerson: deletePerson
    }
    return factory;

    function fetchAllPerson() {
        var deferred = $q.defer();
        $http.get("/api/person/")
            .then(
                function (response) {
                    deferred.resolve(response.data);
                }, function (errResponse) {
                    console.error('Error while fetching person');
                    deferred.reject(errResponse);
                }
            );
        return deferred.promise;
    }

    function createPerson(person) {
        var deferred = $q.defer();
        $http.post("/api/person/", person)
            .then(
                function (response) {
                    deferred.resolve(response.data)
                },function(errResponse){
                    console.error('Error while creating Person');
                    deferred.reject(errResponse);
                }

            );
        return deferred.promise;
    }

    function updatePerson(person, id) {
        var deferred = $q.defer();
        $http.put("/api/person/"+id, person)
            .then(
                function (response) {
                    deferred.resolve(response.data)
                },function(errResponse){
                    console.error('Error while updating Person');
                    deferred.reject(errResponse);
                }
            );
        return deferred;
    }
    function deletePerson(id) {
        var deferred = $q.defer();
        $http.delete("/api/person/"+id)
            .then( function (response) {
                deferred.resolve(response.data)
            },function(errResponse){
                console.error('Error while deleting Person');
                deferred.reject(errResponse);
            });
        return deferred.promise;
    }
}]);