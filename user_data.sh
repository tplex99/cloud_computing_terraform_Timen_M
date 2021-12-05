#!bin/bash
sudo apt update 
sudo apt install apache2 -y
sudo apt install php7.4 -y

echo " <?php

        echo file_get_contents('https://xlq5hokesc.execute-api.eu-west-1.amazonaws.com/default/test');
  

?>
<br>
<img src="https://tmcloud.s3-eu-west-1.amazonaws.com/image.png">  " | > sudo tee /var/www/html/cloud.php