<#include "header.ftl">
<#include "nav.ftl">
<div ng-app="personCarApp" ng-cloak >

    <div class="generic-container">
        <div class="panel panel-default">
            <!-- Default panel contents -->
            <div class="panel-heading"><span class="lead">Car </span></div>
            <div class="panel-body">
                <div class="formcontainer">
                    <div class="alert alert-success" role="alert" ng-if="ctrl.successMessage">{{ctrl.successMessage}}</div>
                    <div class="alert alert-danger" role="alert" ng-if="ctrl.errorMessage">{{ctrl.errorMessage}}</div>
                    <form ng-submit="ctrl.submit()" name="myForm" class="form-horizontal">
                        <input type="hidden" ng-model="person.id" />
                        <div class="row">
                            <div class="form-group col-md-12">
                                <label class="col-md-2 control-label" for="imageUrl"> Image Url</label>
                                <div class="col-md-7">
                                    <input type="text"  id="imageUrl" class="imageUrl form-control input-sm" placeholder="Enter Image Url" required />
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="form-group col-md-12">
                                <label class="col-md-2 control-label" for="Color">Color</label>
                                <div class="col-md-7">
                                    <input type="text"  id="Color" class="form-control input-sm" placeholder="Enter Color" required />
                                </div>
                            </div>
                        </div>


                        <div class="row">
                            <div class="form-group col-md-12">
                                <label class="col-md-2 control-label" for="Marca">Marca</label>
                                <div class="col-md-7">
                                    <input type="text"  id="Marca" class="form-control input-sm" placeholder="Enter Marca" required />
                                </div>
                            </div>
                        </div>


                        <div class="row">
                            <div class="form-actions floatRight">
                                <input type="submit"  value="{{!ctrl.user.id ? 'Add' : 'Update'}}" class="btn btn-primary btn-sm" ng-disabled="myForm.$invalid || myForm.$pristine">
                                <button type="button"  class="btn btn-warning btn-sm" ng-disabled="myForm.$pristine">Reset Form</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
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
                            <th width="100"></th>
                            <th width="100"></th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td></td>
                            <td></td>
                            <td><button type="button" ng-click="ctrl.editUser(u.id)" class="btn btn-success custom-width">Edit</button></td>
                            <td><button type="button" ng-click="ctrl.removeUser(u.id)" class="btn btn-danger custom-width">Remove</button></td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
<#include "footer.ftl">

