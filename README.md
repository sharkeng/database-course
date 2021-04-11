# LAB 1
## Сделали ученики 19ПИ-2:
* ***Шарунов Евгений Александрович*** 
* ***Шатилов Виктор Кенгович***
№ 1
```sql
create table medical_staffs
(
	id serial primary key,
	surname varchar not null,
	address varchar not null,
	tax int not null
);
create table place_of_works
(
	id serial primary key,
	establishment varchar not null,
	address varchar not null,
	deduction_to_the_local_budget int not null
);
create table types_of_operations
(
	id serial primary key,
	name varchar not null,
	strong_point varchar not null,
	stocks int not null,
	cost int not null
);
create table labor_activity
(
	contract serial primary key,
	date varchar not null,
	medical_stuff serial not null references medical_staffs(id),
	place_of_work serial not null references place_of_works(id),
	type_of_operation serial not null references types_of_operations(id),
	quantity int not null,
	payment int not null
);
```
№ 2
```sql
INSERT INTO medical_staffs
    (id, surname, address, tax)
VALUES (001, 'Медина','Вознесенское', 14),
       (002, 'Севастьянов','Навашино', 14),
       (003, 'Бессонов', 'Выкса', 10),
       (004, 'Губанов', 'Выкса', 10),
       (005, 'Боева', 'Починки', 5);

INSERT INTO place_of_works
    (id, establishment, address, deduction_to_the_local_budget)
VALUES (001, 'Районная больница', 'Вознесенское', 10),
       (002, 'Травм. пункт', 'Выкса', 3),
       (003, 'Больница', 'Навашино', 4),
       (004, 'Род. дом', 'Вознесенское', 12),
       (005, 'Больница', 'Починки', 4),
       (006, 'Травм. пункт', 'Лукояново', 3);

INSERT INTO types_of_operations
    (id, name, strong_point, stocks, cost)
VALUES (001, 'Наложение гипса', 'Выкса', 2000, 18000),
       (002, 'Блокада', 'Навашино', 10000, 14000),
       (003, 'Инъекция поливитаминов', 'Навашино', 20000, 11000),
       (004, 'Инъекция алоэ', 'Навашино', 12000, 11000),
       (005, 'ЭКГ', 'Вознесенское', 115, 10000),
       (006, 'УЗИ', 'Вознесенское', 20, 30000),
       (007, 'Флюорография', 'Выкса', 1000, 5000);

INSERT INTO labor_activity
(contract, date,
 medical_stuff, place_of_work, type_of_operation, quantity, payment)
VALUES (51040, 'Понедельник', 001, 001, 007, 4, 20000),
       (51041, 'Понедельник', 003, 003, 006, 1, 30000),
       (51042, 'Понедельник', 004, 003, 004, 3, 33000),
       (51043, 'Понедельник', 004, 005, 001, 2, 36000),
       (51044, 'Понедельник', 004, 004, 006, 1, 30000),
       (51045, 'Среда', 002, 002, 005, 3, 30000),
       (51046, 'Четверг', 003, 006, 004, 4, 44000),
       (51047, 'Четверг', 004, 006, 002, 1, 28000),
       (51048, 'Четверг', 005, 003, 003, 4, 44000),
       (51049, 'Пятница', 002, 004, 005, 1, 10000),
       (51050, 'Пятница', 003, 006, 004, 2, 22000),
       (51051, 'Пятница', 003, 003, 001, 2, 36000),
       (51052, 'Пятница', 005, 003, 002, 1, 14000),
       (51053, 'Суббота', 003, 002, 007, 2, 10000),
       (51054, 'Суббота', 004, 006, 004, 1, 11000),
       (51055, 'Суббота', 005, 005, 004, 2, 22000),
       (51056, 'Суббота', 003, 006, 003, 2, 22000);

```
№ 3
```sql
SELECT * FROM medical_staffs
```
| id | surname | address | tax |
| :--- | :--- | :--- | :--- |
| 1 | Медина | Вознесенское | 14 |
| 2 | Севастьянов | Навашино | 14 |
| 3 | Бессонов | Выкса | 10 |
| 4 | Губанов | Выкса | 10 |
| 5 | Боева | Починки | 5 |
```sql
SELECT * FROM place_of_works
```
| id | establishment | address | deduction\_to\_the\_local\_budget |
| :--- | :--- | :--- | :--- |
| 1 | Районная больница | Вознесенское | 10 |
| 2 | Травм. пункт | Выкса | 3 |
| 3 | Больница | Навашино | 4 |
| 4 | Род. дом | Вознесенское | 12 |
| 5 | Больница | Починки | 4 |
| 6 | Травм. пункт | Лукояново | 3 |
```sql
SELECT * FROM types_of_operations
```
| id | name | strong\_point | stocks | cost |
| :--- | :--- | :--- | :--- | :--- |
| 1 | Наложение гипса | Выкса | 2000 | 18000 |
| 2 | Блокада | Навашино | 10000 | 14000 |
| 3 | Инъекция поливитаминов | Навашино | 20000 | 11000 |
| 4 | Инъекция алоэ | Навашино | 12000 | 11000 |
| 5 | ЭКГ | Вознесенское | 115 | 10000 |
| 6 | УЗИ | Вознесенское | 20 | 30000 |
| 7 | Флюорография | Выкса | 1000 | 5000 |
```sql
SELECT * FROM labor_activity
```
| contract | date | medical\_stuff | place\_of\_work | type\_of\_operation | quantity | payment |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| 51040 | Понедельник | 1 | 1 | 7 | 4 | 20000 |
| 51041 | Понедельник | 3 | 3 | 6 | 1 | 30000 |
| 51042 | Понедельник | 4 | 3 | 4 | 3 | 33000 |
| 51043 | Понедельник | 4 | 5 | 1 | 2 | 36000 |
| 51044 | Понедельник | 4 | 4 | 6 | 1 | 30000 |
| 51045 | Среда | 2 | 2 | 5 | 3 | 30000 |
| 51046 | Четверг | 3 | 6 | 4 | 4 | 44000 |
| 51047 | Четверг | 4 | 6 | 2 | 1 | 28000 |
| 51048 | Четверг | 5 | 3 | 3 | 4 | 44000 |
| 51049 | Пятница | 2 | 4 | 5 | 1 | 10000 |
| 51050 | Пятница | 3 | 6 | 4 | 2 | 22000 |
| 51051 | Пятница | 3 | 3 | 1 | 2 | 36000 |
| 51052 | Пятница | 5 | 3 | 2 | 1 | 14000 |
| 51053 | Суббота | 3 | 2 | 7 | 2 | 10000 |
| 51054 | Суббота | 4 | 6 | 4 | 1 | 11000 |
| 51055 | Суббота | 5 | 5 | 4 | 2 | 22000 |
| 51056 | Суббота | 3 | 6 | 3 | 2 | 22000 |

№ 4
```sql
select distinct address from medical_staffs;
```
| address |
| :--- |
| Выкса |
| Починки |
| Вознесенское |
| Навашино |
```sql
select distinct establishment from place_of_works;
```
| establishment |
| :--- |
| Травм. пункт |
| Больница |
| Род. дом |
| Районная больница |

```sql
select distinct date from labor_activity;
```
| date |
| :--- |
| Четверг |
| Понедельник |
| Пятница |
| Среда |
| Суббота |

№ 5
```sql
select  contract,date
from labor_activity
where payment>=14000;
```
| contract | date |
| :--- | :--- |
| 51040 | Понедельник |
| 51041 | Понедельник |
| 51042 | Понедельник |
| 51043 | Понедельник |
| 51044 | Понедельник |
| 51045 | Среда |
| 51046 | Четверг |
| 51047 | Четверг |
| 51048 | Четверг |
| 51050 | Пятница |
| 51051 | Пятница |
| 51052 | Пятница |
| 51055 | Суббота |
| 51056 | Суббота |

```sql
select distinct address, tax
from medical_staffs
where address = 'Навашино'
   or address = 'Выкса';
```
| address | tax |
| :--- | :--- |
| Выкса | 10 |
| Навашино | 14 |

```sql
select name, strong_point, cost
from types_of_operations
where cost > 10000
  and name LIKE '%Инъекция%'
order by strong_point, cost;
```
| name | strong\_point | cost |
| :--- | :--- | :--- |
| Инъекция поливитаминов | Навашино | 11000 |
| Инъекция алоэ | Навашино | 11000 |

№ 6
```sql
select date, surname, establishment, name
from medical_staffs,
     labor_activity,
     place_of_works,
     types_of_operations
where medical_stuff = medical_staffs.id
  and place_of_work = place_of_works.id
  and type_of_operation = types_of_operations.id
```
| date | surname | establishment | name |
| :--- | :--- | :--- | :--- |
| Понедельник | Медина | Районная больница | Флюорография |
| Понедельник | Бессонов | Больница | УЗИ |
| Понедельник | Губанов | Больница | Инъекция алоэ |
| Понедельник | Губанов | Больница | Наложение гипса |
| Понедельник | Губанов | Род. дом | УЗИ |
| Среда | Севастьянов | Травм. пункт | ЭКГ |
| Четверг | Бессонов | Травм. пункт | Инъекция алоэ |
| Четверг | Губанов | Травм. пункт | Блокада |
| Четверг | Боева | Больница | Инъекция поливитаминов |
| Пятница | Севастьянов | Род. дом | ЭКГ |
| Пятница | Бессонов | Травм. пункт | Инъекция алоэ |
| Пятница | Бессонов | Больница | Наложение гипса |
| Пятница | Боева | Больница | Блокада |
| Суббота | Бессонов | Травм. пункт | Флюорография |
| Суббота | Губанов | Травм. пункт | Инъекция алоэ |
| Суббота | Боева | Больница | Инъекция алоэ |
| Суббота | Бессонов | Травм. пункт | Инъекция поливитаминов |

```sql
select date, establishment, quantity,payment
from
     labor_activity,
     place_of_works
where place_of_work = place_of_works.id
order by payment
```
| date | establishment | quantity | payment |
| :--- | :--- | :--- | :--- |
| Пятница | Род. дом | 1 | 10000 |
| Суббота | Травм. пункт | 2 | 10000 |
| Суббота | Травм. пункт | 1 | 11000 |
| Пятница | Больница | 1 | 14000 |
| Понедельник | Районная больница | 4 | 20000 |
| Суббота | Травм. пункт | 2 | 22000 |
| Пятница | Травм. пункт | 2 | 22000 |
| Суббота | Больница | 2 | 22000 |
| Четверг | Травм. пункт | 1 | 28000 |
| Среда | Травм. пункт | 3 | 30000 |
| Понедельник | Больница | 1 | 30000 |
| Понедельник | Род. дом | 1 | 30000 |
| Понедельник | Больница | 3 | 33000 |
| Понедельник | Больница | 2 | 36000 |
| Пятница | Больница | 2 | 36000 |
| Четверг | Больница | 4 | 44000 |
| Четверг | Травм. пункт | 4 | 44000 |


№ 7
```sql
select surname, address
from labor_activity,
     medical_staffs,
     types_of_operations
where medical_stuff = medical_staffs.id
  and type_of_operation = types_of_operations.id
  and name = 'Наложение гипса'
  and quantity > 1
```
| surname | address |
| :--- | :--- |
| Губанов | Выкса |
| Бессонов | Выкса |

```sql
select name, address
from labor_activity,
     place_of_works,
     types_of_operations
where place_of_work = place_of_works.id
  and type_of_operation = types_of_operations.id
  and (address = 'Выкса' or address = 'Вознесенское')
  and establishment LIKE '%больница%';
```
| name | address |
| :--- | :--- |
| Флюорография | Вознесенское |

```sql
select establishment, deduction_to_the_local_budget, surname
from place_of_works,
     medical_staffs
where tax >= 7
  and tax <= 16
  and place_of_works.address = medical_staffs.address
order by tax, deduction_to_the_local_budget
```
| establishment | deduction\_to\_the\_local\_budget | surname |
| :--- | :--- | :--- |
| Травм. пункт | 3 | Губанов |
| Травм. пункт | 3 | Бессонов |
| Больница | 4 | Севастьянов |
| Районная больница | 10 | Медина |
| Род. дом | 12 | Медина |

```sql
select date, type_of_operation, surname, cost, quantity
from types_of_operations,
     medical_staffs,
     labor_activity
where type_of_operation = types_of_operations.id
  and medical_stuff = medical_staffs.id
  and cost > 7000
  and quantity > 1;
```
| date | type\_of\_operation | surname | cost | quantity |
| :--- | :--- | :--- | :--- | :--- |
| Четверг | 4 | Бессонов | 11000 | 4 |
| Пятница | 4 | Бессонов | 11000 | 2 |
| Пятница | 1 | Бессонов | 18000 | 2 |
| Суббота | 3 | Бессонов | 11000 | 2 |
| Четверг | 3 | Боева | 11000 | 4 |
| Суббота | 4 | Боева | 11000 | 2 |
| Понедельник | 4 | Губанов | 11000 | 3 |
| Понедельник | 1 | Губанов | 18000 | 2 |
| Среда | 5 | Севастьянов | 10000 | 3 |
