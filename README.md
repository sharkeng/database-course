# LAB 1

## Сделали ученики 19ПИ-2:

* ***Шарунов Евгений Александрович***
* ***Шатилов Виктор Алексеевич***
  № 1

```sql
create table medical_staffs
(
    id      serial primary key,
    surname varchar not null,
    address varchar not null,
    tax     int     not null
);
create table place_of_works
(
    id                            serial primary key,
    establishment                 varchar not null,
    address                       varchar not null,
    deduction_to_the_local_budget int     not null
);
create table types_of_operations
(
    id           serial primary key,
    name         varchar not null,
    strong_point varchar not null,
    stocks       int     not null,
    cost         int     not null
);
create table labor_activity
(
    contract          serial primary key,
    date              varchar not null,
    medical_stuff     serial  not null references medical_staffs (id),
    place_of_work     serial  not null references place_of_works (id),
    type_of_operation serial  not null references types_of_operations (id),
    quantity          int     not null,
    payment           int     not null
);
```

№ 2

```sql
INSERT INTO medical_staffs
    (id, surname, address, tax)
VALUES (001, 'Медина', 'Вознесенское', 14),
       (002, 'Севастьянов', 'Навашино', 14),
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
SELECT *
FROM medical_staffs;
```

| id | surname | address | tax |
| :--- | :--- | :--- | :--- |
| 1 | Медина | Вознесенское | 14 |
| 2 | Севастьянов | Навашино | 14 |
| 3 | Бессонов | Выкса | 10 |
| 4 | Губанов | Выкса | 10 |
| 5 | Боева | Починки | 5 |

```sql
SELECT *
FROM place_of_works;
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
SELECT *
FROM types_of_operations;
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
SELECT *
FROM labor_activity;
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
select distinct address
from medical_staffs;
```

| address |
| :--- |
| Выкса |
| Починки |
| Вознесенское |
| Навашино |

```sql
select distinct establishment
from place_of_works;
```

| establishment |
| :--- |
| Травм. пункт |
| Больница |
| Род. дом |
| Районная больница |

```sql
select distinct date
from labor_activity;
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
select contract, date
from labor_activity
where payment >= 14000;
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
  and type_of_operation = types_of_operations.id;
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
select date, establishment, quantity, payment
from labor_activity,
     place_of_works
where place_of_work = place_of_works.id
order by payment;
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

№ 7 a) фамилии и места проживания медперсонала, проведших более одного наложения гипса в день

```sql
select surname, address
from labor_activity,
     medical_staffs,
     types_of_operations
where medical_stuff = medical_staffs.id
  and type_of_operation = types_of_operations.id
  and name = 'Наложение гипса'
  and quantity > 1;
```

| surname | address |
| :--- | :--- |
| Губанов | Выкса |
| Бессонов | Выкса |

b) название операций, которые проводили врачи из Вознесенского или Выксы в больницах;

```sql
select distinct name
from labor_activity,
     place_of_works,
     medical_staffs as ms,
     types_of_operations
where place_of_work = place_of_works.id
  and type_of_operation = types_of_operations.id
  and medical_stuff = ms.id
  and (ms.address = 'Выкса' or ms.address = 'Вознесенское')
  and (establishment LIKE '%Больница%' or establishment LIKE '%больница%');
```

| name |
| :--- |
| Инъекция алоэ |
| Наложение гипса |
| УЗИ |
| Флюорография |

c) названия и размер отчислений в местный бюджет для тех учреждений, где проводили операции те, у кого налог не менее
7%, но не более 16%. Включить в вывод фамилии таких людей и отсортировать по размеру отчислений и налогу;

```sql
select DISTINCT establishment, place_of_works.deduction_to_the_local_budget, surname, tax
from place_of_works,
     medical_staffs,
     labor_activity
where tax >= 7
  and tax <= 16
  and place_of_work = place_of_works.id
  and medical_stuff = medical_staffs.id
order by place_of_works.deduction_to_the_local_budget, tax;
```

| establishment | deduction\_to\_the\_local\_budget | surname | tax |
| :--- | :--- | :--- | :--- |
| Травм. пункт | 3 | Бессонов | 10 |
| Травм. пункт | 3 | Губанов | 10 |
| Травм. пункт | 3 | Севастьянов | 14 |
| Больница | 4 | Бессонов | 10 |
| Больница | 4 | Губанов | 10 |
| Районная больница | 10 | Медина | 14 |
| Род. дом | 12 | Губанов | 10 |
| Род. дом | 12 | Севастьянов | 14 |

d) даты, идентификаторы операций и фамилии тех, кто проводил операции стоимостью не менее 7000руб больше одного раза.

```sql
select date, type_of_operation, surname
from types_of_operations,
     medical_staffs,
     labor_activity
where type_of_operation = types_of_operations.id
  and medical_stuff = medical_staffs.id
  and cost > 7000
  and quantity > 1;
```

| date | type\_of\_operation | surname |
| :--- | :--- | :--- |
| Понедельник | 4 | Губанов |
| Понедельник | 1 | Губанов |
| Среда | 5 | Севастьянов |
| Четверг | 4 | Бессонов |
| Четверг | 3 | Боева |
| Пятница | 4 | Бессонов |
| Пятница | 1 | Бессонов |
| Суббота | 4 | Боева |
| Суббота | 3 | Бессонов |

№ 8 Создать запрос для модификации всех значений столбца с суммарной величиной оплаты, чтобы он содержал истинную сумму,
получаемую медперсоналом ( за вычетом налога). Вывести новые значения.

```sql
UPDATE labor_activity
SET payment = payment / 100 * (100 - (SELECT tax FROM medical_staffs WHERE id = medical_stuff));

SELECT *
FROM labor_activity;
```

| contract | date | medical\_stuff | place\_of\_work | type\_of\_operation | quantity | payment |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| 51040 | Понедельник | 1 | 1 | 7 | 4 | 17200 |
| 51041 | Понедельник | 3 | 3 | 6 | 1 | 27000 |
| 51042 | Понедельник | 4 | 3 | 4 | 3 | 29700 |
| 51043 | Понедельник | 4 | 5 | 1 | 2 | 32400 |
| 51044 | Понедельник | 4 | 4 | 6 | 1 | 27000 |
| 51045 | Среда | 2 | 2 | 5 | 3 | 25800 |
| 51046 | Четверг | 3 | 6 | 4 | 4 | 39600 |
| 51047 | Четверг | 4 | 6 | 2 | 1 | 12600 |
| 51048 | Четверг | 5 | 3 | 3 | 4 | 41800 |
| 51049 | Пятница | 2 | 4 | 5 | 1 | 8600 |
| 51050 | Пятница | 3 | 6 | 4 | 2 | 19800 |
| 51051 | Пятница | 3 | 3 | 1 | 2 | 32400 |
| 51052 | Пятница | 5 | 3 | 2 | 1 | 13300 |
| 51053 | Суббота | 3 | 2 | 7 | 2 | 9000 |
| 51054 | Суббота | 4 | 6 | 4 | 1 | 9900 |
| 51055 | Суббота | 5 | 5 | 4 | 2 | 20900 |
| 51056 | Суббота | 3 | 6 | 3 | 2 | 19800 |

№9 Расширить таблицу с данными об операциях столбцом, содержащим величину отчислений в местный бюджет для
мед.учреждения, где проводилась операция. Создать запрос для ввода конкретных значений во все строки таблицы операций.
(???? мы правильно поняли что в эту таблицу???)
```sql
ALTER TABLE labor_activity
    ADD COLUMN deduction_to_the_local_budget INT;
UPDATE labor_activity
SET deduction_to_the_local_budget=(SELECT place_of_works.deduction_to_the_local_budget
                                   FROM place_of_works
                                   WHERE id = labor_activity.place_of_work) * (payment / 100)
```

| contract | date | medical\_stuff | place\_of\_work | type\_of\_operation | quantity | payment | deduction\_to\_the\_local\_budget |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| 51040 | Понедельник | 1 | 1 | 7 | 4 | 17200 | 1720 |
| 51041 | Понедельник | 3 | 3 | 6 | 1 | 27000 | 1080 |
| 51042 | Понедельник | 4 | 3 | 4 | 3 | 29700 | 1188 |
| 51043 | Понедельник | 4 | 5 | 1 | 2 | 32400 | 1296 |
| 51044 | Понедельник | 4 | 4 | 6 | 1 | 27000 | 3240 |
| 51045 | Среда | 2 | 2 | 5 | 3 | 25800 | 774 |
| 51046 | Четверг | 3 | 6 | 4 | 4 | 39600 | 1188 |
| 51047 | Четверг | 4 | 6 | 2 | 1 | 12600 | 378 |
| 51048 | Четверг | 5 | 3 | 3 | 4 | 41800 | 1672 |
| 51049 | Пятница | 2 | 4 | 5 | 1 | 8600 | 1032 |
| 51050 | Пятница | 3 | 6 | 4 | 2 | 19800 | 594 |
| 51051 | Пятница | 3 | 3 | 1 | 2 | 32400 | 1296 |
| 51052 | Пятница | 5 | 3 | 2 | 1 | 13300 | 532 |
| 51053 | Суббота | 3 | 2 | 7 | 2 | 9000 | 270 |
| 51054 | Суббота | 4 | 6 | 4 | 1 | 9900 | 297 |
| 51055 | Суббота | 5 | 5 | 4 | 2 | 20900 | 836 |
| 51056 | Суббота | 3 | 6 | 3 | 2 | 19800 | 594 |

№10 a) найти фамилии медперсонала из Навашино, проводивших инъекции в Выксе;

```sql
select surname
from medical_staffs,
     types_of_operations,
     place_of_works,
     labor_activity
where medical_stuff = medical_staffs.id
  and type_of_operation = types_of_operations.id
  and place_of_work = place_of_works.id
  and medical_staffs.address = 'Навашино'
  and place_of_works.address = 'Выкса'
  and types_of_operations.name in (select tofo.name
                                   from types_of_operations as tofo
                                   where tofo.name like '%Инъекция%');

```
таких значений нет((((

b) найти те операции, которые не проводились до среды;

```sql
SELECT DISTINCT name
FROM types_of_operations,
     labor_activity
where id = type_of_operation
  and name not in (select name
                   from types_of_operations,
                        labor_activity
                   where id = labor_activity.type_of_operation
                     and (date = 'Понедельник' or date = 'Вторник'));
```

| name |
| :--- |
| Блокада |
| Инъекция поливитаминов |
| ЭКГ |

c) запросы задания 7.с и 7.d. c) названия и размер отчислений в местный бюджет для тех учреждений, где проводили
операции те, у кого налог не менее 7%, но не более 16%. Включить в вывод фамилии таких людей и отсортировать по размеру
отчислений и налогу;

```sql
select distinct establishment, place_of_works.deduction_to_the_local_budget, surname, tax
from place_of_works,
     medical_staffs,
     labor_activity
where place_of_work = place_of_works.id
  and medical_stuff = medical_staffs.id
  and tax in (select ms.tax
              from medical_staffs as ms
              where ms.tax >= 7
                and ms.tax <= 16)
order by deduction_to_the_local_budget,tax;
```

| establishment | deduction\_to\_the\_local\_budget | surname | tax |
| :--- | :--- | :--- | :--- |
| Травм. пункт | 3 | Бессонов | 10 |
| Травм. пункт | 3 | Губанов | 10 |
| Травм. пункт | 3 | Севастьянов | 14 |
| Больница | 4 | Бессонов | 10 |
| Больница | 4 | Губанов | 10 |
| Районная больница | 10 | Медина | 14 |
| Род. дом | 12 | Губанов | 10 |
| Род. дом | 12 | Севастьянов | 14 |


d) даты, идентификаторы операций и фамилии тех, кто проводил операции стоимостью не менее 7000руб больше одного раза.

```sql
select date, type_of_operation, surname
from types_of_operations,
     medical_staffs,
     labor_activity
where type_of_operation = types_of_operations.id
  and medical_stuff = medical_staffs.id
  and quantity > 1
  and type_of_operation in (select tofop.id from types_of_operations as tofop where tofop.cost > 7000);
```

| date | type\_of\_operation | surname |
| :--- | :--- | :--- |
| Пятница | 1 | Бессонов |
| Понедельник | 1 | Губанов |
| Суббота | 3 | Бессонов |
| Четверг | 3 | Боева |
| Суббота | 4 | Боева |
| Пятница | 4 | Бессонов |
| Четверг | 4 | Бессонов |
| Понедельник | 4 | Губанов |
| Среда | 5 | Севастьянов |

№11
 Используя операции ALL-ANY реализовать следующие запросы:

a) найти среди больниц ту, которая имеет наименьший процент отчислений;

```sql
select establishment, address
from place_of_works
where (establishment LIKE '%больница%'
    or establishment LIKE '%Больница%')
  and deduction_to_the_local_budget <= ALL (
    select pw.deduction_to_the_local_budget
    from place_of_works as pw
    WHERE pw.establishment LIKE '%больница%'
       or pw.establishment LIKE '%Больница%');
```
(Эти больницы делают одинаковое отчислиние в процентах)


| establishment | address |
| :--- | :--- |
| Больница | Навашино |
| Больница | Починки |

b) найти медперсонал, проводивший операции с самой малой суммой оплаты;

```sql
select surname, payment
from medical_staffs,
     labor_activity
where medical_stuff = medical_staffs.id
  and payment <= ALL (
    select la.payment
    from labor_activity as la);
```

| surname | payment |
| :--- | :--- |
| Севастьянов | 8600 |

c) найти цену самой дорогой операции, проведенной в четверг или пятницу;

```sql
select name, cost
from types_of_operations,
     labor_activity
where type_of_operation = id
  and (date = 'Четверг' or date = 'Пятница')
  and cost >= ALL (
    select tofo.cost
    from types_of_operations as tofo,
         labor_activity as la
    where la.type_of_operation = tofo.id
      and (la.date = 'Четверг' or la.date = 'Пятница'))
```

| name | cost |
| :--- | :--- |
| Наложение гипса | 18000 |

d) запрос задания 7.а.
a) фамилии и места проживания медперсонала, проведших более одного наложения гипса в день;

```sql
SELECT surname, address
FROM medical_staffs
WHERE medical_staffs.id = ANY (
    SELECT DISTINCT medical_stuff
    FROM labor_activity,
         types_of_operations
    WHERE type_of_operation = types_of_operations.id
      and name = 'Наложение гипса'
      and quantity > 1
);
```
| surname | address |
| :--- | :--- |
| Бессонов | Выкса |
| Губанов | Выкса |

№12 
Используя операцию UNION получить места проживания медпероснала и опероные пункты для операций.

```sql
SELECT strong_point
FROM types_of_operations
UNION
SELECT address
FROM medical_staffs;
```
| strong\_point |
| :--- |
| Выкса |
| Навашино |
| Починки |
| Вознесенское |

№13
Используя операцию EXISTS ( NOT EXISTS ) реализовать нижеследующие запросы. В случае, если для текущего состояния БД запрос будет выдавать пустое множество строк, требуется указать какие добавления в БД необходимо провести.

a) определить тот медперсонал, который не работал в субботу;
```sql
SELECT *
FROM medical_staffs
WHERE NOT EXISTS
          (SELECT *
           FROM labor_activity
           WHERE date LIKE 'Суббота'
             and labor_activity.medical_stuff = id);
```
| id | surname | address | tax |
| :--- | :--- | :--- | :--- |
| 1 | Медина | Вознесенское | 14 |
| 2 | Севастьянов | Навашино | 14 |

b) найти такие операции, которые проводились всеми врачами в Выксе;
НАйти операции, которые провродились только в выксе?
или найти операции, которые проводились всеми врачами из Выксы?
```sql
SELECT *
FROM types_of_operations
WHERE EXISTS
          (SELECT *
           FROM labor_activity
           WHERE type_of_operation = id
             AND place_of_work IN (
               SELECT id
               FROM place_of_works
               WHERE address = 'Выкса'
           )
             AND NOT EXISTS
               (SELECT *
                FROM labor_activity
                WHERE place_of_work NOT IN (
                    SELECT id
                    FROM place_of_works
                    WHERE address = 'Выкса'
                )
                  AND type_of_operation = id
               ));
```
c) определить те места работы, где не делали УЗИ более раза;
```sql
INSERT INTO labor_activity (contract, date, medical_stuff, place_of_work, type_of_operation, quantity, payment,
                            deduction_to_the_local_budget)
values (51057, 'Суббота', 1, 3, 6, 2, 24080, 963);


SELECT *
FROM place_of_works
WHERE
          (SELECT count(*) <= 1
           FROM labor_activity la
          INNER JOIN types_of_operations top on top.id = la.type_of_operation
           WHERE place_of_work = place_of_works.id
              AND top.name='УЗИ');

DELETE
FROM labor_activity
WHERE contract = 51057;
```

| id | establishment | address | deduction\_to\_the\_local\_budget |
| :--- | :--- | :--- | :--- |
| 1 | Районная больница | Вознесенское | 10 |
| 2 | Травм. пункт | Выкса | 3 |
| 4 | Род. дом | Вознесенское | 12 |
| 5 | Больница | Починки | 4 |
| 6 | Травм. пункт | Лукояново | 3 |


d) определить места работы, где работали все врачи из чужих населенных пунктов.

```sql
INSERT INTO labor_activity (contract, date, medical_stuff, place_of_work, type_of_operation, quantity, payment,
                            deduction_to_the_local_budget)
values (51057, 'Суббота', 1, 3, 2, 2, 24080, 963);


SELECT pw.id, pw.establishment, pw.address
FROM place_of_works pw
WHERE (
          (SELECT count(DISTINCT la.medical_stuff)
           FROM labor_activity la
                    INNER JOIN medical_staffs ms on ms.id = la.medical_stuff
           WHERE place_of_work = pw.id
             AND ms.address != pw.address) =
          (SELECT count(*) FROM medical_staffs WHERE medical_staffs.address != pw.address)
      );


DELETE
FROM labor_activity
WHERE contract = 51057;
```
Здесь мы вставили в лаейбор активити новую строку, 
чтобы сделать в Больнице НАвашино ситацию, 
когда там поработали все врачи из других населенных пунктов.

| id | establishment | address |
| :--- | :--- | :--- |
| 3 | Больница | Навашино |


№14
Реализовать запросы с использованием аггрегатных функций:

a) найти число различных мест работы для медперсонала, работавшего в мед.учреждениях Выксы;
```sql
SELECT count(DISTINCT place_of_work)
FROM labor_activity
WHERE medical_stuff IN (
SELECT medical_stuff
FROM labor_activity
WHERE place_of_work = (SELECT id FROM place_of_works WHERE address='Выкса'));
```
| count |
| :--- |
| 4 |

б) определить средний размер налога для медперсонала, производившего иньекции;
```sql
SELECT AVG(tax) AS AVERAGE_TAX
FROM medical_staffs
WHERE id IN (
SELECT medical_stuff
FROM labor_activity
WHERE type_of_operation IN (SELECT id FROM types_of_operations WHERE name LIKE 'Инъекция%'));
```
| average\_tax |
| :--- |
| 8.3333333333333333 |

c) кто из медперсонала делал операцию с минимальной стоимостью;
```sql
SELECT *
FROM medical_staffs
WHERE id IN (
    SELECT medical_stuff
    FROM labor_activity
    WHERE type_of_operation IN
          (SELECT id
           FROM types_of_operations
           WHERE cost IN (SELECT min(cost)
                          FROM types_of_operations
           )));
```
| id | surname | address | tax |
| :--- | :--- | :--- | :--- |
| 1 | Медина | Вознесенское | 14 |
| 3 | Бессонов | Выкса | 10 |

d) определить количество операций стоимостью не более 15000, проведенных в понедельник Губановым .
```sql
SELECT sum(quantity) AS QUANTITY_OF_OPERATIONS
FROM labor_activity
WHERE medical_stuff = (SELECT id FROM medical_staffs WHERE surname='Губанов')
AND date = 'Понедельник'
AND (SELECT cost FROM types_of_operations WHERE id=type_of_operation) <= 15000;
```
| quantity\_of\_operations |
| :--- |
| 3 |

№15.

Используя средства группировки реализовать следующие запросы:

a) определить для каждого дня недели и каждой операции сколько раз ее проводили;
```sql
SELECT date, type_of_operation, SUM(quantity) as count
FROM labor_activity
GROUP BY date, type_of_operation;
```
| date | type\_of\_operation | count |
| :--- | :--- | :--- |
| Понедельник | 6 | 2 |
| Понедельник | 4 | 3 |
| Понедельник | 1 | 2 |
| Понедельник | 7 | 4 |
| Пятница | 5 | 1 |
| Пятница | 4 | 2 |
| Пятница | 2 | 1 |
| Пятница | 1 | 2 |
| Среда | 5 | 3 |
| Суббота | 3 | 2 |
| Суббота | 7 | 2 |
| Суббота | 4 | 3 |
| Четверг | 4 | 4 |
| Четверг | 3 | 4 |
| Четверг | 2 | 1 |

b) найти для каждого медработника среднюю стоимость всех проведенных им операций;

```sql
SELECT ms.surname, AVG(cost) as avg_cost
FROM labor_activity la
INNER JOIN types_of_operations top ON top.id = la.type_of_operation
INNER JOIN medical_staffs ms ON ms.id = la.medical_stuff
GROUP BY ms.surname
ORDER BY avg_cost;
```
| surname | avg\_cost |
| :--- | :--- |
| Медина | 5000 |
| Севастьянов | 10000 |
| Боева | 12000 |
| Бессонов | 14333.333333333333 |
| Губанов | 16800 |

c) определить те мед.учреждения, где 
суммарная величина стоимости всех проведенных в них операций была более 30000;
```sql
SELECT pow.address, pow.establishment
FROM labor_activity la
INNER JOIN place_of_works pow ON pow.id = la.place_of_work
INNER JOIN types_of_operations top ON top.id = la.type_of_operation
GROUP BY pow.address, pow.establishment
HAVING SUM(cost) < 30000;
```
| address | establishment |
| :--- | :--- |
| Вознесенское | Районная больница |
| Выкса | Травм. пункт |
| Починки | Больница |

d) для каждого дня недели найти число проведенных в этот день операций.
```sql
SELECT date, SUM(quantity)
FROM labor_activity la
GROUP BY date;
```
| date | sum |
| :--- | :--- |
| Пятница | 6 |
| Среда | 3 |
| Суббота | 7 |
| Четверг | 9 |
| Понедельник | 11 |


