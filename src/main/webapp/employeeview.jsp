<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Employee Details</title>
        <link rel="stylesheet" href="css/viewstyle.css" type="text/css" />
    </head>
    <body>
        <div class="logoutContainer">   
            <a class="logoutButton" href="login">&#9728; Logout</a>    
        </div>
        <h1>Employee Details Table</h1>
        <div class="buttonContainer">
            <a class="addButton" href="new">Add Employee</a>
            
        </div>
        <h2>Employee Info</h2>
        <table border="1" bordercolor="darkcyan" class="employeeinfotable">
            <thead>
                <th>First Name</th>
                <th>Last Name</th>
                <th>Gender</th>
                <th>Email ID</th>
                <th>Hobbies</th>
                <th>Mobile Number</th>
                <th>Job Role</th>
                <th>Availability</th>
                <th>Expected CTC</th>
                <th>Previous Company Name</th>
                <th>Previous Job Role</th>
                <th>Previous Working Period</th>
                <th>Reason to Leave</th>
                <th>Languages Known</th>
                <th>Address</th>
                <th class="actionscontainer">Actions</th>
            </thead>
            <tbody>
                <c:forEach var="employee" items="${employeeDetails}"> 
                    <tr>
                        <td>${employee.getFirstname()}</a></td>
                        <td>${employee.getLastname()}</td>
                        <td>${employee.getGender()}</td>
                        <td>${employee.getEmailid()}</td>
                        <td>${employee.getHobbies()}</td>
                        <td>${employee.getMobilenumber()}</td>
                        <td>${employee.getJobrole()}</td>
                        <td>${employee.getAvailability()}</td>
                        <td>${employee.getExpectedCTC()}</td>
                        <td>${employee.getPrevcompanyname()}</td>
                        <td>${employee.getPrevjobrole()}</td>
                        <td>${employee.getPrevworkingperiod()}</td>
                        <td>${employee.getReasontoleave()}</td>
                        <td>${employee.getLanguagesknown()}</td>
                        <td><a href="viewaddress?empId=${employee.getId()}">View</a></td>
                        <td style="height:100%;" class="actionBtns"><a class="editBtn" href="edit?empId=${employee.getId()}">Edit </a>
                            <a onClick="return deleteConfirm()" class="deleteBtn" href="delete?empId=${employee.getId()}"> Delete</a></td>
                    </tr>  
                </c:forEach>
            </tbody>
        </table>
        
        <script>
            function deleteConfirm(){
                if(confirm("Do you want to delete the employee?") === true){
                    return true;
                }
                else{
                    return false;
                }
            }
        </script>
        
    </body>
</html>
