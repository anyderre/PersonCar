<#include "header.ftl">
<#include "nav.ftl">
<div ng-app="personCarApp" class="person" ng-cloak >

    <div class="generic-container w3-panel w3-card-2" ng-controller="PersonController as ctrl" style="margin:20px; padding:10px; background-color: white;">
        <div class="row">
            <div class="col-md-12">
                <div class="panel panel-default">
                    <!-- Default panel contents -->
                    <div class="panel-heading"><span class="lead">{{!ctrl.person.id? 'Add a new ': 'Update '}} person </span></div>
                    <div class="panel-body">
                        <div class="formcontainer">
                            <div class="alert alert-success" role="alert" ng-if="ctrl.successMessage">{{ctrl.successMessage}}</div>
                            <div class="alert alert-danger" role="alert" ng-if="ctrl.errorMessage">{{ctrl.errorMessage}}</div>
                            <form ng-submit="ctrl.submit()" name="myForm" class="form-horizontal">
                                <input type="hidden" ng-model="ctrl.person.id"/>
                                <div class="row">
                                    <div class="form-group col-md-12">
                                        <label class="col-md-2 control-label" for="name"> Name</label>
                                        <div class="col-md-7">
                                            <input type="text" ng-model="ctrl.person.name"  id="name" class="Name form-control input-sm" placeholder="Enter Person Name" required ng-minlength="3"/>
                                            <span ng-show="myForm.name.$error.required">This is a required field</span>
                                            <span ng-show="myForm.name.$error.minlength">Minimum length required is 3</span>
                                            <span ng-show="myForm.name.$invalid">This field is invalid</span>
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="form-group col-md-12">
                                        <label  class="col-md-2 control-label" for="cars">Cars</label>
                                        <div class="col-md-7">
                                                <select style="margin-bottom: 20px" class="form-control input-sm"
                                                        ng-model="ctrl.selectedCar"
                                                        ng-options="car.marca for car in ctrl.cars" id="cars"
                                                        ng-change="ctrl.changedCar(ctrl.selectedCar)">
                                                </select>
                                                <#--<div ng-repeat="item in ctrl.choosenCars" ><span  class="w3-badge   w3-white"></span></div>-->
                                                <span ng-repeat="item in ctrl.choosenCars" class="w3-card cars-tags w3-{{item.color}}" style="text-align: center; padding: 5px; margin-top=20px; margin-right: 20px" ng-click="ctrl.deleteCar(item.id)">{{item.marca}}</span>
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="form-group col-md-12">
                                        <label class="col-md-2 control-label" for="Edad">Edad</label>
                                        <div class="col-md-7">
                                            <input type="number" ng-model="ctrl.person.edad"  id="Edad" class="form-control input-sm" placeholder="Enter Age" required />
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="form-actions col-md-12 float-right ">
                                        <input type="submit"  value="{{!ctrl.person.id? 'Add': 'Update'}}" class="btn w3-red btn-sm float-right" ng-disabled="myForm.$invalid || myForm.$pristine">
                                        <button type="button" ng-click="ctrl.reset()" class="btn w3-black btn-sm float-right" ng-disabled="myForm.$pristine">Reset Form</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>

            </div>
        </div>
     <div class="row">
         <div class="col-md-12">
             <div class="panel panel-default">
                 <!-- Default panel contents -->
                 <div class="panel-heading"><span class="lead">List of Person </span></div>
                 <div class="panel-body">
                     <div class="table-responsive">
                         <table class="table table-hover">
                             <thead>
                             <tr>
                                 <th>ID</th>
                                 <th>Name</th>
                                 <th>Edad</th>
                                 <th>Cars</th>
                                 <th width="20%"></th>
                                 <th width="20%"></th>
                             </tr>
                             </thead>
                             <tbody>
                             <tr ng-repeat="p in ctrl.persons">
                                 <td><span ng-bind="p.id"></span></td>
                                 <td><span ng-bind="p.name"></span></td>
                                 <td><span ng-bind="p.edad"></span></td>
                                 <td><span ng-repeat="c in p.personCars">{{c.car.marca}} | {{c.car.color}}<br></span></td>
                                 <td><button type="button" ng-click="ctrl.edit(p.id)" class="btn btn-success custom-width">Edit</button></td>
                                 <td><button type="button" ng-click="ctrl.remove(p.id)" class="btn btn-danger custom-width">Remove</button></td>
                             </tr>
                             </tbody>
                         </table>
                     </div>
                 </div>
             </div>

         </div>
     </div>

    </div>
</div>
<#include "footer.ftl">

