use IO::Socket;

# Создаем сокет
socket(SOCK, # Указатель сокета
	PF_INET, # Коммуникационный домен ~ IPv4
	SOCK_STREAM, # Тип сокета ~ TCP
	getprotobyname('tcp') # Протокол ~ чтобы не писать цифрой константу
);

# Задаем адрес сервера
$server = 'whois.tcinet.ru';
$port = 43;
$address = <>;
@domain = split(/\./, $address);
$dom = pop @domain;
$paddr = sockaddr_in($port, #Задаем порт, на  который стучим
	inet_aton($server) # Хост к которому обращаемся
);

# Соединяемся с сервером
connect(SOCK, $paddr);

# Отправляем запрос
send(SOCK, $address, 0);

# Принимаем данные
@data = <SOCK>;
print @data;

# Закрываем сокет
close(SOCK);