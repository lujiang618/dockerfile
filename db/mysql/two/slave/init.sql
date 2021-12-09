change master to master_host='mysql-master',master_user='slave',master_password='root',master_port=3306,master_log_file='mysql-bin.000003', master_log_pos=1,master_connect_retry=30;
start slave;