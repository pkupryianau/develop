#!/bin/bash
up=$(uptime)
host=$(hostname)
email_logfile=./ssh_login_failure_warnings.txt
#ssh_auth=/var/log/auth.log
email=prkpo@mail.ru
ipaddr=$(ip a)
fail=$(grep "authentication failure\|Failed password for" $ssh_auth | wc -l)
#ipaddr=$(ip a |grep "inet addr:" |grep -oP '\d+\.\d+\.\d+\.\d+' | head -n 1)
echo "Привет! Я сервер $host мой ip $ipaddr, uptime $up, с момента последней перезагрузки" > $email_logfile
if [ $fail == 0 ]
then
echo "ко мне никто не ломился." >> $email_logfile
mutt -s "Всё хорошо" $email | < $email_logfile
exit
else
echo "зарегистрировано $fail неудачных попыток входа" >> $email_logfile
mutt -s "Нужно ваше внимание!" $email | < $email_logfile
fi
exit
