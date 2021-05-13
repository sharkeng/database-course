№1
Вывести таблицу распределения мест в соревновании 'открытый чемпионат' в городе 'Васюки' по 'шахматам' в 2000 г.
```sql
SELECT ROW_NUMBER() over (ORDER BY score desc, time) AS place_number, sportsmen.name, score, time
FROM results_table
INNER JOIN competition on results_table.id_competition = competition.id_competition
INNER JOIN sportsmen on results_table.Sportsmen_id = sportsmen.idSportsmen
WHERE competition.name='открытый чемпионат'
AND competition.location='Васюки'
AND results_table.sport_name_sport='шахматы'
AND YEAR(competition.date) = 2000
ORDER BY score desc, time
```
| place\_number | name | score | time |
| :--- | :--- | :--- | :--- |
| 1 | Шарипов | 100.00 | 01:00:00 |
| 2 | Караваев | 50.00 | 01:00:00 |
| 3 | Довлатов | 10.00 | 01:00:00 |


№2
Определить спортсменов, которые имеют как олимпийский, так и мировой рекорд.
```sql
SELECT sportsmen.name
FROM sportsmen
INNER JOIN olympic_record on olympic_record.Sportsmen_id = sportsmen.idSportsmen
INNER JOIN world_record on world_record.Sportsmen_id = sportsmen.idSportsmen
```
| name |
| :--- |
| Шарипов |

№3
 Вывести список спортсменов, участвующих более чем в 8 соревнованиях в году в порядке возрастания среднего места на этих соревнованиях.
```sql
SELECT idSportsmen, round(avg(rnk)) as average_place_number
 FROM
 (
     SELECT *, RANK() OVER (PARTITION BY id_competition ORDER BY score DESC) AS rnk
     FROM results_table
     INNER JOIN sportsmen on results_table.Sportsmen_id = sportsmen.idSportsmen
 ) AS x
INNER JOIN competition on x.id_competition = competition.id_competition
GROUP BY idSportsmen
HAVING count(competition.id_competition) > 8
ORDER BY average_place_number
```
| idSportsmen | average\_place\_number |
| :--- | :--- |
| 1 | 1 |
| 2 | 3 |



№4
 Определить наилучший показатель спортсмена 'Караваев' в виде спорта 'тараканьи бега и разницу с мировым и олимпийским рекордами.
```sql
SELECT score, time,
       world_record.w_record_score-score score_dif_w_rec, TIME(world_record.w_record_time-time) time_dif_w_rec,
       olympic_record.o_record_score-score score_dif_o_rec, TIME(olympic_record.o_record_time-time) time_dif_o_rec
FROM results_table
INNER JOIN sportsmen on  results_table.Sportsmen_id = sportsmen.idSportsmen
INNER JOIN competition on results_table.id_competition = competition.id_competition
INNER JOIN world_record on results_table.sport_name_sport = world_record.name_sport
INNER JOIN olympic_record on results_table.sport_name_sport = olympic_record.name_sport
WHERE sportsmen.name = 'Караваев'
AND results_table.sport_name_sport = 'тараканьи бега'
ORDER BY score desc, time
LIMIT 1
```
| score | time | score\_dif\_w\_rec | time\_dif\_w\_rec | score\_dif\_o\_rec | time\_dif\_o\_rec |
| :--- | :--- | :--- | :--- | :--- | :--- |
| 500.00 | 01:00:00 | 100.00 | 00:00:00 | 50.00 | 00:20:00 |


Представление №1
Вид спорта, количество соревнований за год, количество попаданий спортсменов из 'России' в призеры.
```sql
CREATE VIEW view_1 AS
SELECT  y.sport_name_sport, count_competition_last_year , count_russian_medalist
FROM
(
         SELECT sport_name_sport, count(distinct(competition.id_competition)) count_competition_last_year
         FROM results_table
         INNER JOIN competition on results_table.id_competition = competition.id_competition
         AND competition.date BETWEEN DATE_ADD(current_date(), INTERVAL -1 year) AND current_date()
         GROUP BY sport_name_sport
     ) as y,

     (
         SELECT sport_name_sport, count(idSportsmen) count_russian_medalist
         FROM
         (
             SELECT *, RANK() OVER (PARTITION BY id_competition ORDER BY score DESC) AS rnk
             FROM results_table
             INNER JOIN sportsmen on results_table.Sportsmen_id = sportsmen.idSportsmen
         ) AS x
         INNER JOIN competition on x.id_competition = competition.id_competition
         WHERE rnk <= 3
         AND x.country = 'Россия'
         AND competition.date BETWEEN DATE_ADD(current_date(), INTERVAL -1 year) AND current_date()
         GROUP BY sport_name_sport
    ) as x
where y.sport_name_sport = x.sport_name_sport
```
| sport\_name\_sport | count\_competition\_last\_year | count\_russian\_medalist |
| :--- | :--- | :--- |
| футбол | 1 | 1 |
| баскетбол | 1 | 3 |


Представление №2
Вид спорта, рекорды, установленные в этом виде спорта за последние пять лет, место соревнований, на которых установлены рекорды.
```sql
CREATE VIEW view_2 AS
SELECT results_table.sport_name_sport as name_sport, w_record_score, w_record_time, o_record_score, o_record_time, location
FROM results_table
INNER JOIN world_record wr on results_table.sport_name_sport = wr.name_sport
INNER JOIN olympic_record or_ on results_table.sport_name_sport = or_.name_sport
INNER JOIN competition on results_table.id_competition = competition.id_competition
WHERE competition.date BETWEEN DATE_ADD(current_date(), INTERVAL -5 year) AND current_date()
group by sport_name_sport
```
| name\_sport | w\_record\_score | w\_record\_time | o\_record\_score | o\_record\_time | location |
| :--- | :--- | :--- | :--- | :--- | :--- |
| шахматы | 110.00 | 01:00:00 | 130.00 | 01:20:00 | Васюки |
