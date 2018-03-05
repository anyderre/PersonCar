/**
 * Created by anyderre on 04/03/18.
 */
'use strict'

angular.module('personCarApp').controller('PersonController', ['$scope', 'PersonServices', function ($scope, PersonServices) {
    var self = this;
    self.person = {id:null, name:'', edad:null}
    self.persons= [];
    self.successMessag='';
    self.errorMessage='';
    self.submit = submit;
    self.edit = edit;
    self.remove = remove;
    self.reset= reset;

    fetchAllPersons();
    function fetchAllPersons() {
        PersonServices.fetchAllPersons()
            .then(
                function (d) {
                self.persons = d;
            },
            function (errorResponse) {
                console.error('Error while fetching Persons');
            })
    }
    function createPerson(person) {
        PersonServices.createPerson(person)
            .then(
                fetchAllPersons,function (err) {
                    self.errorMessage='Error while creating Person';
                    console.error('Error while creating Person')
                }
            )
    }

    function updatePerson(person, id) {
        PersonServices.updatePerson(person,id)
            .then(
                fetchAllPersons,function (errResponse) {
                    self.errorMessage='Error while creating Person';
                    console.error('Error while updating Person')
                }
            )
    }

    function deletePerson(id) {
        PersonServices.deletePerson(id)
            .then  (
                fetchAllPersons,function (errResponse) {
                    self.errorMessage='Error while creating Person';
                    console.error('Error while deleting Person')
                }
            )
    }

    function submit() {
        if(self.person.id===null){
            console.log('Saving new User');
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
}]);