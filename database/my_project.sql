
 -- Description of the tables 

describe laboratory;
describe scientist;
describe experiment;
describe equipment;



-- display the tables

SELECT * FROM laboratory;
SELECT * FROM scientist;
SELECT * FROM experiment;
SELECT * FROM equipment;



-- 1) creation of a demo table

create table Demo(
         id integer,
         col_1 varchar(250)
         );


-- 2) Drop Demo

drop table Demo;       


-- DDL
-- 3) Add Column 

alter table laboratory add investment integer; 



-- 4) Modify Column Definition 

alter table laboratory modify location varchar(200);



-- 5) Rename Column Name 

alter table scientist rename column specialization to expertise;



-- 6) Drop The Column From Table 

alter table laboratory drop column investment;



-- DML
-- 7) Insert a new Scientist into a library

-- Insert lab_id '6' into the laboratory table to make enough place to insert a scientist there 
INSERT INTO laboratory (lab_id, lab_name, location) VALUES (6, 'Chemistry Lab', 'KUET');
 -- Insert data into the scientist table
INSERT INTO scientist (scientist_id, lab_id, scientist_name, expertise) VALUES (6, 6, 'Alex Donald', 'Chemistry');



-- 8) Update Data From A Table 

update scientist set scientist_name='Alvee mackson' where lab_id = 6;




-- 9) Delete Row From Table 

delete from laboratory where lab_id = 6;




-- 10) Find the total number of equipments using with clause

WITH LabEquipment AS (SELECT lab_id,( SELECT lab_name FROM laboratory WHERE lab_id = s.lab_id )
 AS lab_name,( SELECT location FROM laboratory WHERE lab_id = s.lab_id ) AS location,( SELECT SUM(quantity)
 FROM equipment WHERE lab_id = s.lab_id ) AS total_quantity FROM scientist s) SELECT 
  specialization,lab_name,location, total_quantity FROM  LabEquipment;
 



-- 11) how many row exist in experience table

select count(*) from experience;



-- 12) How many distinct lab_id in laboratory table

select count(distinct lab_id) as Num_laboratory from laboratory;



-- 13) What min quantity of equipments have been supplied

SELECT MIN(quantity) FROM equipment;



-- 14) Show the average quantity of unique equipments

SELECT  lab_id, AVG(quantity) AS avg_quantity FROM equipment GROUP BY lab_id HAVING AVG(quantity) > 5;
   



-- 15) Show all the details of scientists associated with experiments using Nested Subquery 

SELECT * FROM scientist WHERE scientist_id IN (SELECT lab_id FROM equipment WHERE equipment_id IN( SELECT equipment_id
FROM experiment  WHERE amount = 7));



-- 16) Set Membership AND : Show Scientist who have name Alice and uses equipment Bunsen Burner 

SELECT * FROM scientist WHERE scientist_name LIKE '%Johnson' AND scientist_id IN (SELECT scientist_id FROM experiment
 WHERE equipment_id IN (SELECT equipment_id  FROM equipment  WHERE equipment_name LIKE '%Burner'));



--  17) Set Membership OR : Matches a string with Burner equipment

SELECT * FROM scientist WHERE scientist_name LIKE '%Johnson' OR scientist_id IN (SELECT scientist_id FROM experiment
 WHERE equipment_id IN (SELECT equipment_id  FROM equipment  WHERE equipment_name LIKE '%Burner'));



-- 18) Set Membership NOT : Not Show which string matches 

SELECT * FROM scientist WHERE NOT (scientist_name LIKE '%to_D%' OR scientist_id IN (SELECT scientist_id FROM experiment WHERE equipment_id IN (
  SELECT equipment_id FROM equipment WHERE equipment_name LIKE '%Card')));




--19) String Operations 

select * from laboratory where lab_name like '%y';



-- 20) Natural Join 

select * from equipment natural join experiment where equipment.quantity < 5;



-- 21) inner Join 

select * from scientist inner join laboratory on scientist.scientist_id = laboratory.lab_id;


-- 22) Right Join Or Right Outer Join Table 

select * from laboratory right outer Join experiment on laboratory.lab_id = experiment.experiment_id;


-- 22) Left Join Or Left Outer Join Table

select * from scientist left outer Join equipment on scientist.scientist_id = equipment.equipment_id;



-- 23) PL/SQL variable declaration & dispaly data


set serveroutput on;
declare
    a_lab_id laboratory.lab_id%TYPE; 
    a_lab_name laboratory.lab_name%TYPE;
    a_location  laboratory.location%TYPE;
    
begin
        select lab_id, lab_name, location 
        into a_lab_id, a_lab_name, a_location  from laboratory
        where lab_id = 3;
        
        -- Display the data 
        DBMS_OUTPUT.PUT_LINE('Lab ID: ' || a_lab_id);
        DBMS_OUTPUT.PUT_LINE('Lab Name: ' || a_lab_name);
        DBMS_OUTPUT.PUT_LINE('Location: ' || a_location); 
        
end;
/ 



-- 24) (PL/SQL)Insert and set default value

set serveroutput on;
declare
    a_lab_id laboratory.lab_id%TYPE:= 7; 
    a_lab_name laboratory.lab_name%TYPE:='Solid Mechanics Lab';
   a_location laboratory.location%TYPE:='KUET,ME';
begin
        insert into laboratory values(a_lab_id, a_lab_name,a_location);
END;
/ 



--25)(PL/SQL) Row type

set serveroutput on;
declare
    lab_row laboratory%rowtype;
begin
        select lab_id, lab_name, location
        into lab_row.lab_id, lab_row.lab_name, lab_row.location from laboratory
        where lab_id = 5;
        
        -- Display the data 
        DBMS_OUTPUT.PUT_LINE('Lab Name: ' || lab_row.lab_name);
        DBMS_OUTPUT.PUT_LINE('Location: ' || lab_row.location); 
END;
/ 





-- 26)Showing scientist's details using cursor and while loop

set serveroutput on;
declare
    scientist_row scientist%ROWTYPE;
    cursor scientist_cursor is select * from scientist;
begin
    open scientist_cursor; 
    fetch scientist_cursor into scientist_row; 
    
    while scientist_cursor%found  LOOP 
    
        DBMS_OUTPUT.PUT_LINE('Scientist Name: ' || scientist_row.scientist_name);
        FETCH scientist_cursor INTO scientist_row; 
        
    end loop;
 
    close scientist_cursor;
END;
/





-- 27)Show Name Of scientist (For Loop and Array with extend function)


set serveroutput on
declare 
  counter number;
  s_name scientist.scientist_name%type;
  
  TYPE s_array IS VARRAY(5) OF scientist.scientist_name%type;
  total_name s_array:= s_array();
begin
  counter:=1;
  for x in 1..6 
  loop
    select Name into s_name from scientist where scientist_id=x;
    total_name.EXTEND();
     total_name(counter):= s_name;
    counter:=counter+1;
  end loop;
  
  counter:=1;
  WHILE counter <= total_name.COUNT 
    LOOP 
    DBMS_OUTPUT.PUT_LINE(total_name(counter)); 
    counter:=counter+1;
  END LOOP;
end;
/




-- 28)(PL/SQL)Show the equipments' details using IF/ELSEIF/ELSE

DECLARE 
  counter number;
  e_name equipment.equipment_name%type;
  
  type e_array is varray(5) OF equipment.equipment_name%type;
  t_name e_array:=e_array('e1', 'e2', 'e3', 'e4', 'e5');  
BEGIN
   counter := 1;
   FOR x IN 1..5  
   LOOP
      select name into e_name from equipment where equipment_id=x;
      if e_name='Microscope' 
        then
        dbms_output.put_line('The 1st equipment is'|| e_name);
      elsif e_name='Bunsen Burner'  
        then
        dbms_output.put_line('The 2nd equipment is'|| e_name);
      elsif e_name='Particle Accelerator'
        then
        dbms_output.put_line('The 3rd equipment is'|| e_name);
      else
        dbms_output.put_line('The other equipment is'|| e_name);
        end if;
   END LOOP;
END;



-- 29) Count Total number of equipments of each scientists using function

CREATE OR REPLACE FUNCTION count_equipment_per_scientist
RETURN SYS_REFCURSOR IS  e_count_cursor SYS_REFCURSOR;  
BEGIN

OPEN e_count_cursor FOR
SELECT scientist_id, scientist_name, (SELECT COUNT(*) FROM experiment WHERE scientist_id = s.scientist_id) AS equipment_count
FROM scientist s;

    RETURN e_count_cursor;

END;
/


-- Calling Functions

SET SERVEROUTPUT ON;
DECLARE
    e_count_cursor SYS_REFCURSOR;
    scientist_id scientist.scientist_id%TYPE;
    scientist_name scientist.scientist_name%TYPE;
    equipment_count NUMBER;
BEGIN
    e_count_cursor := count_equipment_per_scientist;
    LOOP
        FETCH e_count_cursor INTO scientist_id, scientist_name, equipment_count;
        EXIT WHEN e_count_cursor%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('Scientist ID: ' || scientist_id || ', Scientist Name: ' || scientist_name || ', Equipment Count: ' || equipment_count);
    END LOOP;
    CLOSE e_count_cursor;
END;
/


-- 30)Make a procedure so that the number of equipments used by each scientist will be counted

CREATE OR REPLACE PROCEDURE count_e_per_s_proc
IS
    equipment_count_cursor SYS_REFCURSOR;
    scientist_id scientist.scientist_id%TYPE;
    scientist_name scientist.scientist_name%TYPE;
    equipment_count NUMBER;
BEGIN
    OPEN equipment_count_cursor FOR
        SELECT scientist_id, scientist_name,
               (SELECT COUNT(*) 
                FROM experiment 
                WHERE scientist_id = s.scientist_id) AS equipment_count
        FROM scientist s;
    
    LOOP
        FETCH equipment_count_cursor INTO scientist_id, scientist_name, equipment_count;
        EXIT WHEN equipment_count_cursor%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('Scientist ID: ' || scientist_id || ', Scientist Name: ' || scientist_name || ', Equipment Count: ' || equipment_count);
    END LOOP;
    
    CLOSE equipment_count_cursor;
END count_e_per_s_proc;
/

set serveroutput on
BEGIN
    count_e_per_s_proc;
END;
/




-- 31) Use a trigger to update equipment after insertion

CREATE OR REPLACE TRIGGER add_new_column
AFTER INSERT ON equipment
FOR EACH ROW
DECLARE
new_equioment VARCHAR2(100);
BEGIN 
   new_equioment := 'RECENT_EQUIPMENT_' || TO_CHAR(SYSDATE, 'YYYYMMDDHH24MISS') || '_' || DBMS_RANDOM.STRING('A', 5);
    BEGIN
        EXECUTE IMMEDIATE 'SELECT ' ||  new_equioment  || ' FROM laboratory WHERE 1 = 2';
    EXCEPTION
        WHEN OTHERS THEN
            EXECUTE IMMEDIATE 'ALTER TABLE laboratory ADD ' ||  new_equioment || ' VARCHAR2(255)';
    END;
    EXECUTE IMMEDIATE 'UPDATE laboratory SET ' ||  new_equioment || ' = :1 WHERE lab_id = :2'
        USING :new.equipment_name, :new.lab_id;
    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        NULL;
END;
/





