<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Employee Address Details</title>
        <link rel="stylesheet" href="css/addressviewstyle.css" type="text/css" />
    </head>
    <body>
        <div class="buttonContainer">
            <a class="backButton" href="list">&larr; Back</a>    
            <a class="logoutButton" href="login">&#9728; Logout</a>    
        </div>
        <h2>Employee Address Information</h2>
        
        <table border="1" bordercolor="darkcyan" class="addresstable">
            <thead>
                <th>First Name</th>
                <th>Last Name</th>
                <th>Address Type</th>
                <th>House Name/No.</th>
                <th>Street Address</th>
                <th>City</th>
                <th>State</th>
                <th>Zip Code</th>
            </thead>
            <tbody>
                <tr>
                    <td>${employee.getFirstname()}</td>
                    <td>${employee.getLastname()}</td>
                    <td>${employee.getAddresses().get(0).getAddresstype()}</td>
                    <td>${employee.getAddresses().get(0).getHousename()}</td>
                    <td>${employee.getAddresses().get(0).getStreetaddress()}</td>
                    <td>${employee.getAddresses().get(0).getCityname()}</td>
                    <td>${employee.getAddresses().get(0).getStatename()}</td>
                    <td>${employee.getAddresses().get(0).getZipcode()}</td>
                </tr>  
                <tr>
                    <td>${employee.getFirstname()}</td>
                    <td>${employee.getLastname()}</td>
                    <td>${employee.getAddresses().get(1).getAddresstype()}</td>
                    <td>${employee.getAddresses().get(1).getHousename()}</td>
                    <td>${employee.getAddresses().get(1).getStreetaddress()}</td>
                    <td>${employee.getAddresses().get(1).getCityname()}</td>
                    <td>${employee.getAddresses().get(1).getStatename()}</td>
                    <td>${employee.getAddresses().get(1).getZipcode()}</td>
                </tr>
            </tbody>
        </table>
        
        
    </body>
</html>
