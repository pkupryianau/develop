echo Системе требуются некоторые данные...
read -p "Введите пароль пользователя mariaDB (определен при установке): " pmdb
read -p "Введите название базы данных mariaDB: " newdb
read -p "Введите имя пользователя новой базы данных: " userdb
read -p "Введите пароль пользователя новой базы данных: " userpass
echo Данные записаны в систему
echo Создание нового пользователя и базы данных...
sudo mysql -uroot -p$pmdb -e "CREATE DATABASE $newdb"
sudo mysql -uroot -p$pmdb -e "CREATE USER '$userdb'@'localhost' IDENTIFIED BY '$userpass'; GRANT ALL PRIVILEGES ON $newdb.* TO '$userdb'@'localhost'; FLUSH PRIVILEGES;"
echo Создание завершено
