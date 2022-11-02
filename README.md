# Automation_Project
The script performs an update of the package details and the package list at the start of the script.
Later, it installs the apache2 package if it is not already installed and then checks if the apache2 service is running & enabled.
Later, it creats a tar archive of apache2 access logs and error logs that are present in the /var/log/apache2/ directory and place the tar into the /tmp/ directory and moves it to the S3 bucket.

