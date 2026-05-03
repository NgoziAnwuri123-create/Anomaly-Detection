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
-- Environmental Risk Factors
-- Strong correlations observed with:
-- Pesticide exposure (223 cases)
-- Alcohol consumption (138 cases)
-- Smoking (62 cases)
-- Surprisingly higher counts in areas with:
-- Piped water (306)
-- Sewage systems (273) 
-- Suggests potential urban/environmental exposure patterns, not just hygiene access

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
-- Highest risk age group: 60–74 (82 cases)
-- Followed closely by:
-- 45–59 (77 cases)
-- 75+ (43 cases)
-- Geographical ancestry (parental background):
-- Strong clustering in Pomerania & Germany (80+ cases)
-- Indicates possible genetic or regional susceptibility trends


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

-- Clear early warning patterns identified:
-- Lesion Behaviour Indicators (Clinical Signals)
-- Itching lesions → 163 cancer cases
-- Growing lesions → 135 cases
-- Painful lesions → 162 cases
-- Lesion Characteristics
-- Cancer likelihood increases with larger lesion diameters
-- Certain body regions show higher concentration of cases
-- Supports targeted screening focus areas