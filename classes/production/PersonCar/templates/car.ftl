<#include "header.ftl">
<#include "nav.ftl">
<div ng-app="personCarApp" ng-cloak >

    <div class="generic-container w3-panel w3-card-2" ng-controller="CarController as ctrl" style="margin:20px; background-color: white; padding:10px;">
        <div class="panel panel-default">
            <!-- Default panel contents -->
            <div class="panel-heading"><span class="lead">{{!ctrl.car.id?'Add new ': 'Edit '}}Car</span></div>
            <div class="panel-body">
                <div class="formcontainer">
                    <div class="alert alert-success" role="alert" ng-if="ctrl.successMessage">{{ctrl.successMessage}}</div>
                    <div class="alert alert-danger" role="alert" ng-if="ctrl.errorMessage">{{ctrl.errorMessage}}</div>
                    <form ng-submit="ctrl.submit()" name="myForm" class="form-horizontal">
                        <input type="hidden" ng-model="ctrl.car.id" />
                        <div class="row">
                            <div class="form-group col-md-12">
                                <label class="col-md-2 control-label" for="image">Image Url</label>
                                <div class="col-md-7">
                                    <input type="text" ng-model="ctrl.car.image"  id="image" class="image form-control input-sm" placeholder="Enter Image Url" required ng-minlength="10"/>
                                    <span ng-show="myForm.image.$error.required">Car should have a valid url for the car</span>
                                    <span ng-show="myForm.image.$error.minlength">You should enter at least 10 characters</span>
                                    <span ng-show="myForm.image.$invalid">Invalid trade</span>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="form-group col-md-12">
                                <label class="col-md-2 control-label" for="Color">Color</label>
                                <div class="col-md-7">
                                    <input type="text"  id="Color" ng-model="ctrl.car.color" class="form-control input-sm" placeholder="Enter Color" required ng-minlength="2"/>
                                    <span ng-show="myForm.Color.$error.required">Car should have a trade</span>
                                    <span ng-show="myForm.Color.$error.minlength">You should enter at least 2 characters</span>
                                    <span ng-show="myForm.Color.$invalid">Invalid Color</span>
                                </div>
                            </div>
                        </div>


                        <div class="row">
                            <div class="form-group col-md-12">
                                <label class="col-md-2 control-label" for="Marca">Marca</label>
                                <div class="col-md-7">
                                    <input type="text" ng-model="ctrl.car.marca" id="Marca" class="form-control input-sm" placeholder="Enter Marca" required ng-minlength="3" />
                                    <span ng-show="myForm.Marca.$error.minlength">Marca should have at least 3 chracters</span>
                                    <span ng-show="myForm.Marca.$error.required">you should enter  a valid Marca</span>
                                    <span ng-show="myForm.Marca.$invalid">Invalid Marca</span>
                                </div>
                            </div>
                        </div>


                        <div class="row">
                            <div class="form-actions">
                                <input type="submit" value="{{!ctrl.car.id ? 'Add' : 'Update'}}" class="btn w3-red btn-sm float-right" ng-disabled="myForm.$invalid || myForm.$pristine">
                                <button type="button"  class="btn w3-black btn-sm float-right" ng-disabled="myForm.$pristine">Reset Form</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <div class="panel panel-default">
            <!-- Default panel contents -->
            <div class="panel-heading"><span class="lead">List of Cars </span></div>
            <div class="panel-body">
                <div class="table-responsive">
                    <table class="table table-hover">
                        <thead>
                        <tr>
                            <th>ID</th>
                            <th>Image</th>
                            <th>Marca</th>
                            <th>Color</th>
                            <th width="20%"></th>
                            <th width="20%"></th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr ng-repeat="item in ctrl.cars">
                            <td>{{item.id}}</td>
                            <td><img src="{{item.image}}" alt="" style="width: 60px; height: 40px"></td>
                            <td>{{item.marca}}</td>
                            <td><div class="w3-card w3-{{item.color}}" style="text-align: center; padding: 5px">{{item.color}}</div></span></td>

                            <td><button type="button" ng-click="ctrl.edit(item.id)" class="btn btn-success custom-width">Edit</button></td>
                            <td><button type="button" ng-click="ctrl.remove(item.id)" class="btn btn-danger custom-width">Remove</button></td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
<#include "footer.ftl">

