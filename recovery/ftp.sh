set host [lindex $argv 0]
set username [lindex $argv 1]
set password [lindex $argv 2]
spawn scp -r $username@$host:~/backup.zip ./
expect {
  -re ".*es.*o.*" {
    exp_send "yes\r"
    exp_continue
  }
  -re ".*sword.*" {
    exp_send "$password\r"
  }
}
interact

