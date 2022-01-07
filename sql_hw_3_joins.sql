/*
1. Создать таблицу employees
- id. serial,  primary key,
- employee_name. Varchar(50), not null
 */

create table employees (
	id serial primary key,
	employee_name varchar(50) not null
);
select * from employees;
-- 2. Наполнить таблицу employee 70 строками.

insert into employees(employee_name)
values
('Name1'),
('Name2'),
('Name3'),
('Name4'),
('Name5'),
('Name6'),
('Name7'),
('Name8'),
('Name9'),
('Name10'),
('Name11'),
('Name12'),
('Name13'),
('Name14'),
('Name15'),
('Name16'),
('Name17'),
('Name18'),
('Name19'),
('Name20'),
('Name21'),
('Name22'),
('Name23'),
('Name24'),
('Name25'),
('Name26'),
('Name27'),
('Name28'),
('Name29'),
('Name30'),
('Name31'),
('Name32'),
('Name33'),
('Name34'),
('Name35'),
('Name36'),
('Name37'),
('Name38'),
('Name39'),
('Name40'),
('Name41'),
('Name42'),
('Name43'),
('Name44'),
('Name45'),
('Name46'),
('Name47'),
('Name48'),
('Name49'),
('Name50'),
('Name51'),
('Name52'),
('Name53'),
('Name54'),
('Name55'),
('Name56'),
('Name57'),
('Name58'),
('Name59'),
('Name60'),
('Name61'),
('Name62'),
('Name63'),
('Name64'),
('Name65'),
('Name66'),
('Name67'),
('Name68'),
('Name69'),
('Name70');

/*
3. Создать таблицу salary
- id. Serial  primary key,
- monthly_salary. Int, not null
*/
create table salary (
	id serial primary key,
	monthly_salary int not null
);
select * from salary;
/*
 * 4. Наполнить таблицу salary 15 строками:
- 1000
- 1100
- 1200
- 1300
- 1400
- 1500
- 1600
- 1700
- 1800
- 1900
- 2000
- 2100
- 2200
- 2300
- 2400
- 2500
 */

insert into salary(monthly_salary)
	values(1000),(1100), (1200), (1300), (1400),(1500), (1600), (1700),(1800), (1900), (2000), (2100), (2200), (2300), (2400), (2500);

/*
 5) Создать таблицу employee_salary
- id. Serial  primary key,
- employee_id. Int, not null, unique
- salary_id. Int, not null
 */
	
create table employee_salary (
	id serial primary key,
	employee_id int not null unique,
	salary_id int not null
);

/*
 6) Наполнить таблицу employee_salary 40 строками:
- в 10 строк из 40 вставить несуществующие employee_id
 */

insert into employee_salary (employee_id, salary_id)
values(1, 1), (2, 3), (3, 4), (4, 5), (5, 16), (6, 11), (7, 10), (8, 9), 
(9, 8), (10, 7), (11, 6), (12, 3), (13, 4), (14, 5), (15, 15), (16, 12), (17, 13), 
(18, 11), (19, 12), (20, 1), (21, 12), (22, 2), (23, 2), (24, 4), (25, 7), (26, 6), 
(27, 8), (28, 8), (29, 9), (30, 11), (72, 11), (73, 10), (74, 1), (75, 3), (76, 4), 
(77, 8), (78, 7), (79, 11), (80, 15), (81, 16);

select * from employee_salary;

/*
Создать таблицу roles
- id. Serial  primary key,
- role_name. int, not null, unique
 */

create table roles (
	id serial primary key,
	role_name int not null unique
);
select * from roles;

-- 8. Поменять тип столба role_name с int на varchar(30)

alter table roles 
alter column role_name type varchar(30);

-- 9. Наполнить таблицу roles 20 строками:
insert into roles (role_name)
values('Junior Python developer'), 
('Middle Python developer'), 
('Senior Python developer'), 
('Junior Java developer'), 
('Middle Java developer'), 
('Senior Java developer'), 
('Junior JavaScript developer'), 
('Middle JavaScript developer'), 
('Senior JavaScript developer'), 
('Junior Manual QA engineer'), 
('Middle Manual QA engineer'), 
('Senior Manual QA engineer'), 
('Project Manager'), 
('Designer'), 
('HR'), 
('CEO'), 
('Sales manager'), 
('Junior Automation QA engineer'), 
('Middle Automation QA engineer'), 
('Senior Automation QA engineer');

/*
Создать таблицу roles_employee
- id. Serial  primary key,
- employee_id. Int, not null, unique (внешний ключ для таблицы employees, поле id)
- role_id. Int, not null (внешний ключ для таблицы roles, поле id)
*/

create table roles_employee (
id serial primary key,
employee_id int not null unique,
role_id int not null,
	foreign key (employee_id)
		references employees(id),
	foreign key (role_id)
		references roles(id)
);
select * from roles_employee;

-- 11. Наполнить таблицу roles_employee 40 строками

insert into roles_employee (employee_id, role_id)
values(1,13), 
(2,3), 
(3,4), 
(4,5), 
(5,6), 
(6,7), 
(7,8), 
(8,9), 
(9,10), 
(10,11), 
(11,12), 
(12,13), 
(13,14), 
(14,15), 
(15,16), 
(16,19), 
(17,17), 
(18,18), 
(19,20), 
(20,3), 
(21,5), 
(22,3), 
(23,8), 
(24,3), 
(25,9), 
(26,7), 
(27,3), 
(28,1), 
(29,2), 
(30,5), 
(31,8), 
(32,17), 
(33,18), 
(34,20), 
(35,8), 
(36,7), 
(37,4), 
(38,5), 
(39,3), 
(40,13);

--SQL HomeWork 3. Joins

-- 1. Вывести всех работников чьи зарплаты есть в базе, вместе с зарплатами.
select employees.employee_name, salary.monthly_salary
from employee_salary 
join employees on employee_salary.employee_id = employees.id 
join salary on employee_salary.salary_id = salary.id;

--2. Вывести всех работников у которых ЗП меньше 2000.
select employees.employee_name, salary.monthly_salary
from employee_salary 
join employees on employee_salary.employee_id = employees.id 
join salary on employee_salary.salary_id = salary.id
where monthly_salary < 2000;

--3. Вывести все зарплатные позиции, но работник по ним не назначен. 
--(ЗП есть, но не понятно кто её получает.)
select employees.employee_name, employee_salary.employee_id
from employee_salary 
join employees on employees.id = employee_salary.employee_id 
full join salary on salary.id = employee_salary.salary_id
where employee_salary.employee_id is null;

-- вариант 2
select monthly_salary
from employee_salary 
join salary on employee_salary.salary_id = salary.id 
where employee_salary.employee_id >= 70;

-- 4. Вывести все зарплатные позиции  меньше 2000 но работник по ним не назначен. 
--(ЗП есть, но не понятно кто её получает.)
select salary.monthly_salary, employees.employee_name 
from employee_salary 
full join employees on employee_salary.employee_id = employees.id
full join salary on employee_salary.salary_id = salary.id
where employee_name is null and monthly_salary < 2000;
 
-- 5. Найти всех работников кому не начислена ЗП.
select employees.employee_name, employee_salary.salary_id
from employees
full join employee_salary on employees.id = employee_salary.id
where salary_id is null;


--6. Вывести всех работников с названиями их должности.
select employees.employee_name, roles.role_name 
from roles_employee
join employees on roles_employee.employee_id = employees.id
join roles on roles_employee.role_id = roles.id;

-- 7. Вывести имена и должность только Java разработчиков.
select employees.employee_name, roles.role_name 
from roles_employee 
join employees on roles_employee.employee_id = employees.id 
join roles on roles_employee.role_id = roles.id
where role_name like '%Java developer';

--8. Вывести имена и должность только Python разработчиков.
select employees.employee_name, roles.role_name
from roles_employee 
join employees on roles_employee.employee_id = employees.id 
join roles on roles_employee.role_id = roles.id
where role_name like '%Python developer';

--9. Вывести имена и должность всех QA инженеров.
select employees.employee_name, roles.role_name
from roles_employee 
join employees on roles_employee.employee_id = employees.id 
join roles on roles_employee.role_id = roles.id
where role_name like '%QA engineer';

-- 10. Вывести имена и должность ручных QA инженеров.
select employees.employee_name, roles.role_name
from roles_employee 
join employees on roles_employee.employee_id = employees.id 
join roles on roles_employee.role_id = roles.id
where role_name like '%Manual QA engineer';

-- 11. Вывести имена и должность автоматизаторов QA
select employees.employee_name, roles.role_name
from roles_employee 
join employees on roles_employee.employee_id = employees.id 
join roles on roles_employee.role_id = roles.id
where role_name like '%Automation QA engineer';

-- 12. Вывести имена и зарплаты Junior специалистов
select employees.employee_name, roles.role_name, salary.monthly_salary 
from employee_salary
join employees on employee_salary.employee_id = employees.id
join roles on employee_salary.employee_id = roles.id
join salary on employee_salary.salary_id = salary.id
where role_name like '%Junior%';

-- 13. Вывести имена и зарплаты Middle специалистов
select employees.employee_name, roles.role_name, salary.monthly_salary 
from employee_salary
join employees on employee_salary.employee_id = employees.id
join roles on employee_salary.employee_id = roles.id
join salary on employee_salary.salary_id = salary.id
where role_name like '%Middle%';

-- 14. Вывести имена и зарплаты Senior специалистов
select employees.employee_name, roles.role_name, salary.monthly_salary 
from employee_salary
join employees on employee_salary.employee_id = employees.id
join roles on employee_salary.employee_id = roles.id
join salary on employee_salary.salary_id = salary.id
where role_name like '%Senior%';

-- 15. Вывести зарплаты Java разработчиков
select salary.monthly_salary
from roles_employee
full join roles on roles.id = roles_employee.role_id
full join employee_salary on roles_employee.id = employee_salary.id
join employees on employees.id = employee_salary.employee_id 
full join salary on salary.id = employee_salary.salary_id 
where role_name like '%Java developer';

-- 16. Вывести зарплаты Python разработчиков
select roles.role_name, salary.monthly_salary 
from employee_salary 
join roles on employee_salary.employee_id = roles.id 
join salary on employee_salary.salary_id = salary.id
where role_name like '%Python%';

-- 17. Вывести имена и зарплаты Junior Python разработчиков
select employees.employee_name, salary.monthly_salary
from employee_salary
join employees on employee_salary.employee_id = employees.id 
join salary on employee_salary.salary_id = salary.id
join roles on employee_salary.employee_id = roles.id
where role_name like '%Junior Python%';

-- 18. Вывести имена и зарплаты Middle JS разработчиков
select employees.employee_name, salary.monthly_salary
from employee_salary 
join employees on employee_salary.employee_id = employees.id 
join salary on employee_salary.salary_id = salary.id 
join roles on employee_salary.employee_id = roles.id
where role_name like '%Middle JavaScript%';

-- 19. Вывести имена и зарплаты Senior Java разработчиков
select employees.employee_name, salary.monthly_salary
from employee_salary 
join employees on employee_salary.employee_id = employees.id 
join salary on employee_salary.salary_id = salary.id 
join roles on employee_salary.employee_id = roles.id
where role_name like '%Senior Java%';

-- 20. Вывести зарплаты Junior QA инженеров
select employees.employee_name, salary.monthly_salary, roles.role_name
from employee_salary 
join employees on employee_salary.employee_id = employees.id 
join salary on employee_salary.salary_id = salary.id 
join roles on employee_salary.employee_id = roles.id
where role_name like '%Junior%' and role_name like '%QA%';

--21. Вывести среднюю зарплату всех Junior специалистов
select avg (salary.monthly_salary) as avg
from employee_salary
join roles on employee_salary.salary_id = roles.id 
join salary on employee_salary.salary_id = salary.id
where roles.role_name like '%Junior%';

-- 22. Вывести сумму зарплат JS разработчиков
select sum (salary.monthly_salary) as sum
from employee_salary 
join roles on employee_salary.salary_id = roles.id 
join salary on employee_salary.salary_id = salary.id
where role_name like '%JavaScript%';

-- 23. Вывести минимальную ЗП QA инженеров
select min (salary.monthly_salary) as min
from employee_salary 
join roles on employee_salary.salary_id = roles.id 
join salary on employee_salary.salary_id = salary.id
where role_name like '%QA engineer%';

 --24. Вывести максимальную ЗП QA инженеров
select max (salary.monthly_salary) as max
from employee_salary 
join roles on employee_salary.salary_id = roles.id 
join salary on employee_salary.salary_id = salary.id
where role_name like '%QA engineer%';

-- 25. Вывести количество QA инженеров
select count (roles.role_name) as count 
from roles_employee 
join roles on roles_employee.role_id = roles.id
where role_name like '%QA engineer%';

-- 26. Вывести количество Middle специалистов.
select count (roles.role_name) as count 
from roles_employee 
join roles on roles_employee.role_id = roles.id 
where role_name like '%Middle%';

-- 27. Вывести количество разработчиков
select count (roles.role_name) as count 
from roles_employee 
join roles on roles_employee.role_id = roles.id 
where role_name like '%developer%';

-- 28. Вывести фонд (сумму) зарплаты разработчиков.
select sum (salary.monthly_salary) as sum
from employee_salary
join roles on employee_salary.salary_id = roles.id
join salary on employee_salary.salary_id = salary.id
where role_name like '%developer%';

-- 29. Вывести имена, должности и ЗП всех специалистов по возрастанию
select employees.employee_name, roles.role_name, salary.monthly_salary 
from employee_salary 
join employees on employee_salary.employee_id = employees.id 
join roles on employee_salary.employee_id = roles.id 
join salary on employee_salary.salary_id = salary.id
order by salary.monthly_salary 

----30. Вывести имена, должности и ЗП всех специалистов по 
--возрастанию у специалистов у которых ЗП от 1700 до 2300
select employees.employee_name, roles.role_name, salary.monthly_salary 
from employee_salary 
join employees on employee_salary.employee_id = employees.id 
join roles on employee_salary.employee_id = roles.id 
join salary on employee_salary.salary_id = salary.id
where monthly_salary > 1700 and monthly_salary < 2300
order by salary.monthly_salary;

--31. Вывести имена, должности и ЗП всех специалистов по возрастанию 
--у специалистов у которых ЗП меньше 2300
select employees.employee_name, roles.role_name, salary.monthly_salary 
from employee_salary 
join employees on employee_salary.employee_id = employees.id 
join roles on employee_salary.employee_id = roles.id 
join salary on employee_salary.salary_id = salary.id
where monthly_salary < 2300
order by salary.monthly_salary;

-- 32. Вывести имена, должности и ЗП всех специалистов по возрастанию у 
--специалистов у которых ЗП равна 1100, 1500, 2000
select employees.employee_name, roles.role_name, salary.monthly_salary 
from employee_salary 
join employees on employee_salary.employee_id = employees.id 
join roles on employee_salary.employee_id = roles.id 
join salary on employee_salary.salary_id = salary.id
where monthly_salary = 1100 or monthly_salary = 1500 or monthly_salary = 2000
order by salary.monthly_salary;