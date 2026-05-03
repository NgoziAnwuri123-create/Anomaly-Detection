--- Identify environmental and demographic risk factors that correlate with specific skin lesions--- 

-- 1a) Environment Risk factors --

Select smoke, count(skin_cancer_history) as "Skin Cancer"
from table1
group by smoke;

Select drink, count(skin_cancer_history) as "Skin Cancer", count(cancer_history) as "Cancer History"
from table1
group by drink;

Select pesticide, count(skin_cancer_history) as "Skin Cancer", count(cancer_history) as "Cancer History"
from table1
group by pesticide;

Select has_piped_water, count(skin_cancer_history) as "Skin Cancer", count(cancer_history) as "Cancer History"
from table1
group by has_piped_water;

Select has_sewage_system, count(skin_cancer_history) as "Skin Cancer", count(cancer_history) as "Cancer History"
from table1
group by has_sewage_system;

-- Key insights environmental factors with the higher count of skin cancer --
-- 1) has sewage systems 273
-- 2) has piped water 306
-- 3) pesticide 223 
-- 4) drink 138 
-- 5) smoke 62

-- 1b) Demographic factors -- 

Select background_father, count(skin_cancer_history) as "Skin Cancer"
from table1
where skin_cancer_history = true
group by background_father
order by "Skin Cancer" desc;


Select background_mother, count(skin_cancer_history) as "Skin Cancer", count(cancer_history) as "Cancer History"
from table1
where skin_cancer_history = true
group by background_mother
order by "Skin Cancer" desc;

Select gender, count(skin_cancer_history) as "Skin Cancer"
from table1
where skin_cancer_history = true
group by gender
order by "Skin Cancer" desc;

Select gender, count(skin_cancer_history) as "Skin Cancer"
from table1
group by gender
order by "Skin Cancer" desc;


select age, 
 	case 
	 when age < 15 then '0 - 14'
	 when age between 15 and 29 then '15 - 29'
	 when age between 30 and 44 then '30 - 44'
	 when age between 45 and 59 then '45 - 59'
	 when age between 60 and 74 then '60 - 74'
	 when age > 74 then '75 plus'
	 else 'unknown'
	 end as "Age group"
	 from table1;

select count(age) as "Age Count", count(skin_cancer_history) as "Skin Cancer",
 	case 
	 when age < 15 then '0 - 14'
	 when age between 15 and 29 then '15 - 29'
	 when age between 30 and 44 then '30 - 44'
	 when age between 45 and 59 then '45 - 59'
	 when age between 60 and 74 then '60 - 74'
	 when age > 74 then '75 plus'
	 else 'unknown'
	 end as "Age_group"
	 from table1
	 where skin_cancer_history = true
	 group by  "Age_group"
	 order by "Skin Cancer" desc

-- Insights demographic factors contributing to skin cancer 
-- higher chance in the 60 to 74 year old af 82
-- compared to 45 to 59 year old of 77 
-- the older population of 75+ at 43 
-- permonia and germany are quite high of 88 and 84 for mothers backgroung
-- pomerania and germany are quite high for fathers background of 86 and 83 

-- 2) Analyze lesion characteristics to find patterns that indicate cancerous vs. benign lesions.

select region, count(skin_cancer_history) as "skin cancer"
from table2
join table1 on table1.patient_id = table2.patient_id
where table1.skin_cancer_history = true
group by region
order by "skin cancer" desc

select diameter_1, count(skin_cancer_history) as "skin cancer"
from table2
join table1 on table1.patient_id = table2.patient_id
where table1.skin_cancer_history = true
group by diameter_1
order by "skin cancer" desc







select region , count(table1.skin_cancer_history) as "Skin_Cancer"
from table2
join table1 on table1.patient_id = table2.patient_id
where table1.skin_cancer_history = true
group by region
order by "Skin_Cancer" desc


 select diameter_1 , count(table1.skin_cancer_history) as "Skin_Cancer"
from table2
join table1 on table1.patient_id = table2.patient_id
where table1.skin_cancer_history = true
group by diameter_1
order by "Skin_Cancer" desc

select min(diameter_1), max(diameter_1)
from table2

 select diameter_2 , count(table1.skin_cancer_history) as "Skin_Cancer"
from table2
join table1 on table1.patient_id = table2.patient_id
where table1.skin_cancer_history = true
group by diameter_2
order by "Skin_Cancer" desc

 select diagnostic, count(table1.skin_cancer_history) as "Skin_Cancer"
from table2
join table1 on table1.patient_id = table2.patient_id
where table1.skin_cancer_history = true
group by diagnostic
order by "Skin_Cancer" desc
-- cancer conditions -- 

 select itch, count(table1.skin_cancer_history) as "Skin_Cancer"
from table2
join table1 on table1.patient_id = table2.patient_id
where table1.skin_cancer_history = true
group by itch
order by "Skin_Cancer" desc
-- 163 positive counts of cancer

 select grew, count(table1.skin_cancer_history) as "Skin_Cancer"
from table2
join table1 on table1.patient_id = table2.patient_id
where table1.skin_cancer_history = true
group by grew
order by "Skin_Cancer" desc
-- 135 counts of cancer

 select hurt, count(table1.skin_cancer_history) as "Skin_Cancer"
from table2
join table1 on table1.patient_id = table2.patient_id
where table1.skin_cancer_history = true
group by hurt
order by "Skin_Cancer" desc
--162 counts of cancer

 select changed, count(table1.skin_cancer_history) as "Skin_Cancer"
from table2
join table1 on table1.patient_id = table2.patient_id
where table1.skin_cancer_history = true
group by changed
order by "Skin_Cancer" desc
--- 35 counts of cancer 

 select bleed, count(table1.skin_cancer_history) as "Skin_Cancer"
from table2
join table1 on table1.patient_id = table2.patient_id
where table1.skin_cancer_history = true
group by bleed
order by "Skin_Cancer" desc
-- 87 counts of cancer 

 select elevation, count(table1.skin_cancer_history) as "Skin_Cancer"
from table2
join table1 on table1.patient_id = table2.patient_id
where table1.skin_cancer_history = true
group by elevation
order by "Skin_Cancer" desc

-- 158 counts of cancer 

 select biopsed, count(table1.skin_cancer_history) as "Skin_Cancer"
from table2
join table1 on table1.patient_id = table2.patient_id
where table1.skin_cancer_history = true
group by biopsed
order by "Skin_Cancer" desc

-- 199 biopsed count
