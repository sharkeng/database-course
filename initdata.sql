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