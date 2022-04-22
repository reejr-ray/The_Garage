# Credentials Folder

## The purpose of this folder is to store all credentials needed to log into your server and databases. This is important for many reasons. But the two most important reasons is
    1. Grading , servers and databases will be logged into to check code and functionality of application. Not changes will be unless directed and coordinated with the team.
    2. Help. If a class TA or class CTO needs to help a team with an issue, this folder will help facilitate this giving the TA or CTO all needed info AND instructions for logging into your team's server. 


# Below is a list of items required. Missing items will causes points to be deducted from multiple milestone submissions.

1. Server URL or IP 
    <br> http://ec2-18-144-3-40.us-west-1.compute.amazonaws.com/
2. SSH username 
    <br> ubuntu 
3. SSH password or key. 
    <br> key provided in folder
4. Database URL or IP and port used. 
    <br> IP used: 127.0.0.1 or localhost
    <br> port (default): 3306
5. Database username
    <br> garageOwner
6. Database password
    <br> h3r3inMyG4rag3
7. Database name (basically the name that contains all your tables)
    <br> myGaragedb
8. Instructions on how to use the above information.
    <br> I have provided both .pem and .ppk files. for the .ppk file, use PUTTY to connect to the server. You do this by booting up PUTTY, and under category selecting session. for host name, the format is 
    ```
    <SSH username>@<Public DNS>
    ```
    <br><br>public DNS is ec2-18-144-3-40.us-west-1.compute.amazonaws.com
    <br> Make sure the connection type reads SSH. Next, navigate to Category -> Connection -> SSH -> Auth. input the private key file for authentication <the .ppk file provided> and click open. By this time, you should be greeted with the welcome message for ubuntu server 18.04.4 LTS. 
    <br> To connect to the mySQL database, run the following command:
    ```
    sudo mysql -u <database username> -h localhost -p
    Enter password: <Database password> 
    ```
    <br> -u is the option for the username, -h is the option for the host, and -p is the option for the password associated with the selected username.

# Most important things to Remember
## These values need to kept update to date throughout the semester. <br>
## <strong>Failure to do so will result it points be deducted from milestone submissions.</strong><br>
## You may store the most of the above in this README.md file. DO NOT Store the SSH key or any keys in this README.md file.
