(function(){"use strict";(function(a){try{a=angular.module("super-templates")}catch(b){a=angular.module("super-templates",[])}a.run(["$templateCache",function(a){a.put("components/super-digital-signature/digital-signature.html","<div class=\"super-digital-signature\"><div ng-if=\"vm.signatureDisplay === 'step-participant'\"><div ng-if=\"!vm.isSigned\"><super-input-text required=\"required\" is-disabled=\"isDisabled\" label=\"{{label}}\" edit-mode=\"vm.editMode\" model=\"model.name\"></super-input-text><super-button ng-if=\"vm.editMode\" label=\"Add Digital Signature\" ng-click=\"go.addSignature()\" is-disabled=\"isDisabled || model.name.trim().length === 0\" aria-controls=\"progress-indicator-{{::$id}}, signature-details-{{::$id}}\"></super-button></div><div id=\"signature-details-{{::$id}}\" ng-if=\"!vm.loading && vm.isSigned\"><p class=\"signed-name\" ss-icon-after=\"shield\">{{model.name}}</p><dl class=\"gd-row signature-details\"><div class=\"gd-50p\"><dt>Signed:</dt><dd>&nbsp;{{model.employeeName}}</dd><dt>Time:</dt><dd>&nbsp;{{vm.timeDisplay}}</dd><dt>IP Address:</dt><dd>&nbsp;{{model.userIP}}</dd></div><div class=\"gd-50p\"><dt>User:</dt><dd>&nbsp;{{model.employeeName}} <span ng-if=\"model.onBehalf\">on behalf of {{model.employeeName}}</span></dd><dt>Email:</dt><dd>&nbsp;{{model.email}}</dd></div></dl></div></div><div class=\"no-signatures\" ng-if=\"vm.signatureDisplay === 'saved-signatures' && vm.signatureGroups.length < 1 && !vm.loading\"><h3>No signatures yet</h3><p>To add a signature, choose an option from the<br>Signatures Properties panel</p></div><ul class=\"saved-signature-list\" ng-class=\"{'horizontal': orientation === 'h', 'vertical': orientation === 'v'}\" ng-if=\"vm.signatureDisplay === 'saved-signatures' && vm.signatureGroups.length > 0\"><li class=\"saved-signature-group\" ng-repeat=\"group in vm.signatureGroups\"><div class=\"signature\" ng-repeat=\"signature in group\"><p>Signed by</p><figure><div class=\"typed-name\" ng-if=\"signature.displayMethod === vm.ssEnumSignatureDisplayMethod.typed\">{{signature.name}}</div><img class=\"signed-name\" ng-if=\"signature.displayMethod === vm.ssEnumSignatureDisplayMethod.image\" ng-src=\"{{signature.imageUrl}}\" height=\"50\" alt=\"{{signature.name}} signature image\"><figcaption class=\"signature-{{::$id}}\">{{signature.name}} ({{signature.title}})</figcaption></figure></div></li></ul><super-loader id=\"progress-indicator-{{::$id}}\" is-loading=\"vm.loading\" status-text=\"vm.loadingStatus\" fill role=\"status\"></super-loader></div>")}])})();var a=function(a,b){if(!(a instanceof b))throw new TypeError("Cannot call a class as a function")},b=function(){function a(a,b){for(var c,d=0;d<b.length;d++)c=b[d],c.enumerable=c.enumerable||!1,c.configurable=!0,"value"in c&&(c.writable=!0),Object.defineProperty(a,c.key,c)}return function(b,c,d){return c&&a(b.prototype,c),d&&a(b,d),b}}(),c=function(a,b){if("function"!=typeof b&&null!==b)throw new TypeError("Super expression must either be null or a function, not "+typeof b);a.prototype=Object.create(b&&b.prototype,{constructor:{value:a,enumerable:!1,writable:!0,configurable:!0}}),b&&(Object.setPrototypeOf?Object.setPrototypeOf(a,b):a.__proto__=b)},d=function(a,b){if(!a)throw new ReferenceError("this hasn't been initialised - super() hasn't been called");return b&&("object"==typeof b||"function"==typeof b)?b:a},e=function b(c,d){var e=2<arguments.length&&arguments[2]!==void 0?arguments[2]:{};a(this,b),this.restrict="E",this.replace=!0,this.scope=c,this.templateUrl="components/super-"+d+"/"+d+".html",Object.assign(this,e)},f={model:"=?",signatures:"=?",orientation:"=?",signatureDisplay:"=?",mappable:"=?",label:"@",isDisabled:"=?",required:"=",onBehalf:"@",editMode:"=?",org:"="},g={};angular.module("super-suit-components").directive("superDigitalSignature",function(){var h=function(e){function f(){return a(this,f),d(this,(f.__proto__||Object.getPrototypeOf(f)).apply(this,arguments))}return c(f,e),b(f,[{key:"controller",value:["$scope","$q","ssFormInstancesApi","ssDateByOrgHlp","ssSignatureApi","ssEnum",function(a,b,c,d,e,f){function g(a,b){for(var c=[],d=0,e="h"===b?2:1,f=0;f<a.length;f++)angular.isUndefined(c[d])&&(c[d]=[]),c[d].push(a[f]),0==(f+1)%e&&d++;return c}var h;null!=a.model&&null==a.model.isSigned&&0<a.model.email.length&&0<a.model.employeeName.length&&(a.model.isSigned=!0);var i=a.vm={timeDisplay:"",editMode:null==a.editMode||a.editMode,signatures:[],ssEnumSignatureDisplayMethod:f.signatureDisplayMethod,signatureDisplay:a.signatureDisplay||"step-participant"};a.$watch("model",function(b){null==b?a.model={name:"",employeeName:"",onBehalf:a.onBehalf||null,userIP:"",user:"",email:"",isSigned:!1}:i.isSigned=null!=b.name&&0<b.name.length&&null!=b.userIP&&0<b.userIP.length}),a.$watch("onBehalf",function(b){null!=a.model&&(a.model.onBehalf="true"===b)}),a.$watch("model.time",function(b){if(null!=b){var c=d.utcIsoToRelativeMoment(b,a.org);i.timeDisplay=c.calendar(null,{sameDay:"[Today at] LT",lastDay:"[Yesterday at] LT",lastWeek:"ddd [at] LT",sameElse:"L [at] LT"})}}),a.$watch("signatures",function(c){if(null!=c){i.signatureGroups=[],i.loading=!0;var d=[];c.forEach(function(a){d.push(e.get({id:a}))}),b.all(d).then(function(b){h=b.filter(function(a){return a}).map(function(a){return{id:a.id,name:a._name,title:a._title,displayMethod:a._displayMethod,imageUrl:a._imageUrl}}),i.signatureGroups=g(h,a.orientation),i.loading=!1,i.loadingStatus=""},function(){i.loading=!1,i.loadingStatus=""})}}),a.$watch("orientation",function(a,b){a===b||(i.signatureGroups=g(h,a))}),a.$watch("signatureDisplay",function(a,b){a===b||(i.signatureDisplay=a)}),a.$watch("mappable",function(){"saved-signatures"===i.signatureDisplay&&(a.mappable=!1)});a.go={addSignature:function(){return""!==a.model.name.trim()&&void(i.loading=!0,i.loadingStatus="creating signature...",c.signature(a.model.name).then(function(b){var c=b.data.data.attributes;a.model.time=c.time,a.model.userIP=c.userIP,a.model.employeeName=c.employeeName,a.model.email=c.email,a.model.user=c.user,a.model.isSigned=!0,i.loading=!1,i.loadingStatus="",i.isSigned=!0,a.$emit("ss-validate-field-event",a.element,"change")},function(){i.loading=!1,i.loadingStatus="",a.model.isSigned=!1,i.isSigned=!1}))}}}]},{key:"link",value:function(a,b){a.element=b}}]),f}(e);return new h(f,"digital-signature",g)})})();
