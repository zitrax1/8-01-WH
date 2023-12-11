# Домашнее задание к занятию «Защита сети» - `Залиський Сергей`
   

---

### Задание 1

Проведите разведку системы и определите, какие сетевые службы запущены на защищаемой системе:

**sudo nmap -sA < ip-адрес >**

**sudo nmap -sT < ip-адрес >**

**sudo nmap -sS < ip-адрес >**

**sudo nmap -sV < ip-адрес >**

По желанию можете поэкспериментировать с опциями: https://nmap.org/man/ru/man-briefoptions.html.


### Выполнение
Суриката зафиксировала все попытки сканирования портов, Fail2Ban зафиксировал только sudo nmap -sV
1. ![screenshot-1](https://github.com/zitrax1/8-01-WH/blob/main/img/nmap_suricata.jpg)
2. ![screenshot-1](https://github.com/zitrax1/8-01-WH/blob/main/img/nmap_fail2ban.jpg)



### Задание 2

Проведите атаку на подбор пароля для службы SSH:

**hydra -L users.txt -P pass.txt < ip-адрес > ssh**

1. Настройка **hydra**: 
 
 - создайте два файла: **users.txt** и **pass.txt**;
 - в каждой строчке первого файла должны быть имена пользователей, второго — пароли. В нашем случае это могут быть случайные строки, но ради эксперимента можете добавить имя и пароль существующего пользователя.

Дополнительная информация по **hydra**: https://kali.tools/?p=1847.

2. Включение защиты SSH для Fail2Ban:

-  открыть файл /etc/fail2ban/jail.conf,
-  найти секцию **ssh**,
-  установить **enabled**  в **true**.

Дополнительная информация по **Fail2Ban**:https://putty.org.ru/articles/fail2ban-ssh.html.


### Выполнение
Суриката зафиксировала все попытки подбора пароля, Fail2Ban зафиксировал попытку подбора пароля, а так же заблокировал их
1. ![screenshot-1](https://github.com/zitrax1/8-01-WH/blob/main/img/hydra_suricata.jpg
2. ![screenshot-1](https://github.com/zitrax1/8-01-WH/blob/main/img/hydra_fail2ban.jpg



