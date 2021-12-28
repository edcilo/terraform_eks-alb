resource "aws_security_group" "sec_grp_rds" {
  name = "${var.cluster_name}_rds"
  description = "rds security group"

  ingress {
    from_port = 5432
    to_port = 5432
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 5432
    to_port = 5432
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_db_instance" "eks_cluster_db" {
  identifier = "${var.cluster_name}-rds"
  allocated_storage = 10
  storage_type = var.rds_storage_type
  engine = "postgres"
  engine_version = "13.4"
  instance_class = "db.t3.micro"
  name = var.rds_db_name
  username = var.rds_db_username
  password = var.rds_db_password

  publicly_accessible = true
  skip_final_snapshot = true
  multi_az = false

  vpc_security_group_ids = [ aws_security_group.sec_grp_rds.id ]
}

# resource "aws_db_subnet_group" "db_sub_gr" {
#   description = "terrafom db subnet group"
#   name        = "main_subnet_group"
#   subnet_ids  = module.vpc.private_subnets

#   tags = {
#     name = "${var.cluster_name}-db-subnet-group"
#   }
# }

# resource "aws_security_group" "sec_grp_rds" {
#   vpc_id      = module.vpc.vpc_id
              
#   tags = {
#     Name = "${var.cluster_name}-db-sec-group"
#   }
# }

# resource "aws_db_instance" "db" {
#   vpc_security_group_ids = aws_security_group.sec_grp_rds

#   db_subnet_group_name = aws_db_subnet_group.db_sub_gr.id

#   tags = {
#     name = "${var.cluster_name}-rds-postgres"
#   }
# }
