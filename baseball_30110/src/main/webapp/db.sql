create table tbl_player_info (
	registration_code char(4) not null primary key,
	name varchar2(18),
	birth_day varchar2(8),
	height number(3),
	weight number(3)
);

create table tbl_hitter_info (
	registration_code char(4) not null primary key,
	game_numbers number(3),
	appearance number(3),
	hit_numbers number(3),
	home_runs number(3),
	put_out number(3),
	double_play number(3),
	error_count number(3)
);

insert into tbl_player_info (registration_code, name, birth_day, height, weight)
values ('A001', '김길동', '19900101', 180, 82);
insert into tbl_player_info (registration_code, name, birth_day, height, weight)
values ('A005', '이길동', '20000101', 190, 85);
insert into tbl_player_info (registration_code, name, birth_day, height, weight)
values ('B002', '홍길동', '19950101', 175, 75);
insert into tbl_player_info (registration_code, name, birth_day, height, weight)
values ('B006', '조길동', '19950101', 185, 80);

insert into tbl_hitter_info (registration_code, game_numbers, appearance, hit_numbers, home_runs, put_out, double_play, error_count)
values ('A001', 120, 330, 100, 20, 80, 27, 1);
insert into tbl_hitter_info (registration_code, game_numbers, appearance, hit_numbers, home_runs, put_out, double_play, error_count)
values ('A005', 110, 300, 110, 30, 60, 5, 2);
insert into tbl_hitter_info (registration_code, game_numbers, appearance, hit_numbers, home_runs, put_out, double_play, error_count)
values ('B002', 100, 270, 90, 5, 100, 10, 3);


select * from tbl_player_info
select * from tbl_hitter_info

--insert
select '['||REGISTRATION_CODE||']'||NAME from tbl_player_info;
--p1
select p.REGISTRATION_CODE, p.name, h.GAME_NUMBERS, h.APPEARANCE, h.HIT_NUMBERS, h.HOME_RUNS,
to_char((((h.HIT_NUMBERS+h.HOME_RUNS)/h.APPEARANCE)*100),'999.99') + h.HOME_RUNS ATK, h.PUT_OUT, h.DOUBLE_PLAY, h.ERROR_COUNT,
(h.PUT_OUT+(h.DOUBLE_PLAY*2)-(h.ERROR_COUNT*5)) DEF
from TBL_PLAYER_INFO p, TBL_HITTER_INFO h
where p.REGISTRATION_CODE = h.REGISTRATION_CODE;
--p2
select p.REGISTRATION_CODE, p.name, substr(p.BIRTH_DAY,1,4)||'년'||substr(p.BIRTH_DAY,5,3)||'월'||substr(p.BIRTH_DAY,7,2)||'일' as BIRTH_DAY,
p.HEIGHT, p.WEIGHT, decode(substr(p.REGISTRATION_CODE,1,1),'A','1군','B','2군') asdz,
round((((((h.HIT_NUMBERS+h.HOME_RUNS)/h.appearance)*100) + h.HOME_RUNS)+(h.PUT_OUT+(h.DOUBLE_PLAY*2)-(h.ERROR_COUNT*5)))/2) adsum,
rank() over(order by round((((((h.HIT_NUMBERS+h.HOME_RUNS)/h.APPEARANCE)*100) + h.HOME_RUNS)+(h.PUT_OUT+(h.DOUBLE_PLAY*2)-(h.ERROR_COUNT*5)))/2) desc) rank
from TBL_PLAYER_INFO p, TBL_HITTER_INFO h
where p.REGISTRATION_CODE = h.REGISTRATION_CODE;


select a.registration_code as code, a.name, 
	   substr(a.birth_day,1,4)||'년'||substr(a.birth_day,5,2)||'월'||substr(a.birth_day,7,2)||'일' as birth_day, a.height, a.weight, 
	   decode(substr(a.registration_code,1,1),'A','1군','B','2군') aaa,
	   round((((((b.HIT_NUMBERS+b.HOME_RUNS)/b.appearance)*100) + b.HOME_RUNS)+(b.PUT_OUT+(b.DOUBLE_PLAY*2)-(b.ERROR_COUNT*5)))/2) as adsum,
	   CASE
        WHEN round((((((b.HIT_NUMBERS+b.HOME_RUNS)/b.appearance)*100) + b.HOME_RUNS)+(b.PUT_OUT+(b.DOUBLE_PLAY*2)-(b.ERROR_COUNT*5)))/2) >= 90 THEN 'A'
        WHEN round((((((b.HIT_NUMBERS+b.HOME_RUNS)/b.appearance)*100) + b.HOME_RUNS)+(b.PUT_OUT+(b.DOUBLE_PLAY*2)-(b.ERROR_COUNT*5)))/2) >= 80 THEN 'B'
        WHEN round((((((b.HIT_NUMBERS+b.HOME_RUNS)/b.appearance)*100) + b.HOME_RUNS)+(b.PUT_OUT+(b.DOUBLE_PLAY*2)-(b.ERROR_COUNT*5)))/2) >= 80 THEN 'B'
        WHEN round((((((b.HIT_NUMBERS+b.HOME_RUNS)/b.appearance)*100) + b.HOME_RUNS)+(b.PUT_OUT+(b.DOUBLE_PLAY*2)-(b.ERROR_COUNT*5)))/2) >= 70 THEN 'C'
        WHEN round((((((b.HIT_NUMBERS+b.HOME_RUNS)/b.appearance)*100) + b.HOME_RUNS)+(b.PUT_OUT+(b.DOUBLE_PLAY*2)-(b.ERROR_COUNT*5)))/2) >= 60 THEN 'D'
        ELSE 'F' END AS bbb,
       rank() over(order by round((((((b.HIT_NUMBERS+b.HOME_RUNS)/b.APPEARANCE)*100) + b.HOME_RUNS)+(b.PUT_OUT+(b.DOUBLE_PLAY*2)-(b.ERROR_COUNT*5)))/2) desc) rank
from tbl_player_info a, tbl_hitter_info b
where a.registration_code = b.registration_code

select p.REGISTRATION_CODE, p.name, h.GAME_NUMBERS, h.APPEARANCE, h.HIT_NUMBERS, h.HOME_RUNS,
to_char((((h.HIT_NUMBERS+h.HOME_RUNS)/h.APPEARANCE)*100),'999.99') + h.HOME_RUNS ATK, h.PUT_OUT, h.DOUBLE_PLAY, h.ERROR_COUNT,
(h.PUT_OUT+(h.DOUBLE_PLAY*2)-(h.ERROR_COUNT*5)) DEF
from TBL_PLAYER_INFO p, TBL_HITTER_INFO h
where p.REGISTRATION_CODE = h.REGISTRATION_CODE;


SELECT * FROM tbl_hitter_info

delete from tbl_hitter_info where registration_code ='B006'


