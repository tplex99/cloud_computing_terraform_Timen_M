
resource "aws_instance" "terraec2" { //aws instance = welke aws service  //naam word enkel gebruikt voor terraform voor een naam aan een instance te geven moet je een tag :Name: toevoegen
  ami = "ami-08edbb0e85d6a0a07" //geeft aan welke AMI er moet gebruikt worden //in dit geval is het een ubuntu 20.04
  instance_type = "t2.micro" //free teer machine 
  subnet_id = "${aws_subnet.TMCloud-public-1.id}"
  vpc_security_group_ids = [aws_security_group.secgroup_webserv.id]
  //user_data = "${file("user_data.txt")}"
  user_data = <<EOF
#!bin/bash
sudo mkdir /testese22
sudo apt update 
sudo apt install apache2 -y
sudo apt install php7.4 -y

echo " <?php 
echo file_get_contents ('${aws_api_gateway_deployment.example.invoke_url}');
#echo file_get_contents ('$ {aws_apigatewayv2_api.lambda-api.api_endpoint}');

?>
<br>
<img src='https://r0802093.s3-eu-west-1.amazonaws.com/image.png'>  " | > sudo tee /var/www/html/cloud.php
  EOF

    tags = {
    "Name" = "instance_1"
    }
}

output "ec2_ip" { //geeft het public ip van de instance 
  value = ["${aws_instance.terraec2.public_ip}"]
}

resource "local_file" "ip" { //maakt txt aan met public ip van de instance
  content = aws_instance.terraec2.public_ip
  filename = "ec2_instance_public_ip.txt"
} 



