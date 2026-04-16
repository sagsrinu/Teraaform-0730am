provider "aws" {
    region = "us-east-1"  
}

resource "aws_db_instance" "test_rds" {
identifier = "testrds"
engine = "mysql"
instance_class = "db.t3.micro"
username = "Srini"
password = "Srini123"
db_name = "db_test"
allocated_storage = "10"
skip_final_snapshot = true
publicly_accessible = true
  }

resource "null_resource" "local_sql_exec" {
    depends_on = [aws_db_instance.test_rds ]

    provisioner "local-exec" {
      command = "mysql -h ${aws_db_instance.test_rds.address} -u Srini -pSrini123 db_test < init.sql"
    }

    # triggers = {
    #     always_run = timestamp()
    # }
}