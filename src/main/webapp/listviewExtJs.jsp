<%@page import="net.sf.json.JSONObject"%>
<%@page import="java.io.PrintWriter"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Employee View</title>
        <script type="text/javascript" src="ext/bootstrap.js"></script>
        <link rel="stylesheet" type="text/css" href="ext/resources/css/ext-all.css" />
        <link rel="stylesheet" type="text/css" href="ext/examples/shared/example.css" />
        
        <script type = "text/javascript">
            Ext.onReady(function(){
                
                var logoutBtn = Ext.create('Ext.button.Button',{
                    text : 'Logout',
                    scale : 'medium',
                    style: 'margin-right:40px;',
                    listeners: {
                        click: function() {
                            window.location.href = "login";
                        }
                    }
                });
                
                var logoutContainer = Ext.create('Ext.container.Container', {
                    width: "100%",
                    style: 'margin-right:40px;',
                    layout : {
                        type : 'vbox',
                        align: 'right'
                    },
                    items : [logoutBtn]
                });
                
                
                
                var header = Ext.create('Ext.panel.Header',{
                    width: "100%",
                    height: 100,
                    title : "Employee Info Latest",
                    titleAlign: 'center',
                    style: 'font-size:30px; color: #25316D; font-weight:bold;'
                });
                
                var addBtn = Ext.create('Ext.button.Button',{
                    text : 'Add Employee',
                    scale : 'medium',
                    style: 'margin-right:15px;',
                    listeners: {
                        click: function() {
                            window.location.href = "new";
                        }
                    }
                });
                
                var deleteBtn = Ext.create('Ext.button.Button',{
                    id : 'deleteButton',
                    text : 'Delete Employee',
                    scale : 'medium',
                    disabled: true,
                    listeners: {
                        click: function() {
                            if(deleteConfirm() === true){
                                var selectedData = Ext.getCmp('employeeGrid').getSelectionModel().getSelection();
                                var empIdArray = [];
                                selectedData.forEach((record)=> {
                                    empIdArray.push(record.get("id"));
                                });
                                Ext.Ajax.request({
                                    url: 'delete',
                                    params: {
                                        empIdArray : empIdArray
                                    },
                                    success: function(response, opts) {
                                        window.location.href="viewemployee";
                                    },

                                    failure: function(response, opts) {
                                        console.log('Something went wrong! Error code is: ' + response.status);
                                    }
                                });
                            }
                        }
                    }
                });
                
                var btnContainer = Ext.create('Ext.container.Container', {
                    layout : {
                        type : 'hbox'
                    },
                    items : [addBtn, deleteBtn]
                });
                
                var itemsPerPage = 10;
                Ext.define('Employee',{
                    extend : 'Ext.data.Model',
                    fields : ['id', 'firstname','lastname','gender', 'emailid','hobbies', 'mobilenumber', 'jobrole', 'availability', 'expectedCTC',
                        'prevcompanyname', 'prevjobrole', 'prevworkingperiod', 'reasontoleave', 'languagesknown'
                            ]     
                });

                var employeeData = Ext.create('Ext.data.Store',{
                    model : 'Employee',
                    pageSize : itemsPerPage,
                    
                    proxy : {
                         type: 'ajax',
                         url : 'list',
                         enablePaging : true,
                         reader : {
                             type : 'json',
                             totalProperty : 'totalCount',
                             successProperty : 'success',
                             root : 'rows'
                         }
                     },
                     autoLoad : false
                });
                
                employeeData.load({
                    params : {
                        start : 0,
                        limit : itemsPerPage
                    }
                });
                
                var gridPanel = Ext.create('Ext.grid.Panel', {
                    store: employeeData,
                    id: 'employeeGrid',
                    columnLines : true,
                    width: '99%',
                    title: 'Employee Details',
                    titleAlign: 'center',
                    style: 'margin-top:50px;',
                    columns: [
                        {
                            text: 'First Name',
                            width: 70,
                            dataIndex: 'firstname',
                            renderer : function(val, meta, record, rowIndex){
                                var empId = String(record.get('id'));
                                var link = "edit?empId="+empId;
                                return "<a href="+link+">"+val+"</a>";
                            }
                        },
                        {
                            text: 'Last Name',
                            width: 65,
                            dataIndex: 'lastname'
                        },
                        {
                            text: 'Gender',
                            width: 55,
                            dataIndex: 'gender'
                        },
                        {
                            text: 'Email ID',
                            width: 155,
                            dataIndex: 'emailid'
                        },
                        {
                            text: 'Hobbies',
                            width: 160,
                            dataIndex: 'hobbies'
                        },
                        {
                            text: 'Mobile',
                            width: 85,
                            dataIndex: 'mobilenumber'
                        },
                        {
                            text: 'Job Role',
                            width: 110,
                            dataIndex: 'jobrole'
                        },
                        {
                            text: 'Availability',
                            width: 95,
                            dataIndex: 'availability'
                        },
                        {
                            text: 'Expected CTC',
                            width: 85,
                            dataIndex: 'expectedCTC'
                        },
                        {
                            text: 'Previous Company Name',
                            width: 135,
                            dataIndex: 'prevcompanyname'
                        },
                        {
                            text: 'Previous Job Role',
                            width: 125,
                            dataIndex: 'prevjobrole'
                        },
                        {
                            text: 'Previous Working Period',
                            width: 130,
                            dataIndex: 'prevworkingperiod'
                        },
                        {
                            text: 'Reason To Leave',
                            width: 150,
                            dataIndex: 'reasontoleave'
                        },
                        {
                            text: 'Languages Known',
                            width:125,
                            dataIndex: 'languagesknown'
                        }
                    ],
                    selModel:{
                        selType :'checkboxmodel',
                        listeners: {
                            select: function(){
                                Ext.getCmp("deleteButton").setDisabled(false);
                            },
                            deselect: function(){
                                if((Ext.getCmp('employeeGrid').getSelectionModel().getSelection().length)===0){
                                    Ext.getCmp("deleteButton").setDisabled(true);
                                }  
                            }
                        }
                    },
                    dockedItems: [{
                        xtype: 'pagingtoolbar',
                        store: employeeData,
                        dock: 'bottom',
                        displayInfo: true
                    }]
                }); 
                
                
                Ext.create('Ext.container.Viewport', {
                    height: '100%',
                    layout : {
                        type : 'vbox'
                    },
                    style : 'padding-left:15px;margin-top:85px',
                    renderTo : document.body,
                    items : [logoutContainer, header, btnContainer, gridPanel]
                });
            });
            
            function deleteConfirm(){
                if(confirm("Do you want to delete the selected employee(s)?") === true){
                    return true;
                }
                else{
                    return false;
                }
            }
        </script>
    </head>
    <body>
    </body>
</html>
