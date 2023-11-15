# Домашнее задание к занятию «Индексы» - `Залиський Сергей`
   

---

### Легенда

Заказчик передал вам [файл в формате Excel](https://github.com/netology-code/sdb-homeworks/blob/main/resources/hw-12-1.xlsx), в котором сформирован отчёт. 

На основе этого отчёта нужно выполнить следующие задания.

### Задание 1

Напишите запрос к учебной базе данных, который вернёт процентное отношение общего размера всех индексов к общему размеру всех таблиц.

### Выполнение

1. ![screenshot-1](https://github.com/zitrax1/8-01-WH/blob/main/img/indexes.jpg)

### Задание 2

Выполните explain analyze следующего запроса:
```sql
select distinct concat(c.last_name, ' ', c.first_name), sum(p.amount) over (partition by c.customer_id, f.title)
from payment p, rental r, customer c, inventory i, film f
where date(p.payment_date) = '2005-07-30' and p.payment_date = r.rental_date and r.customer_id = c.customer_id and i.inventory_id = r.inventory_id
```
- перечислите узкие места;
- оптимизируйте запрос: внесите корректировки по использованию операторов, при необходимости добавьте индексы.

### Выполнение

1. Слабые места это over (partition by c.customer_id, f.title ORDER BY c.customer_id) так как занимает лишнее время, а так же создает кучу дублей, которые потом нужно убирать на что и тратится много времени и использование таблицы film.
2. 
```sql
select DISTINCT concat(c.last_name, ' ', c.first_name), sum(p.amount)
from payment p, rental r, customer c, inventory i
where date(p.payment_date) = '2005-07-30' and p.payment_date = r.rental_date and r.customer_id = c.customer_id and i.inventory_id = r.inventory_id
GROUP BY c.customer_id;
```


