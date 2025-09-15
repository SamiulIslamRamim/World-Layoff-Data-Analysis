-- data cleaning 1st


select *
from layoffs;

create table layoffs_dup
like layoffs;


select *
from layoffs_dup;

select *
from layoffs_dup
where company='casper';

insert layoffs_dup
select *
from layoffs;


-- start

select *,
row_number() over(partition by company, location, industry, total_laid_off, percentage_laid_off,
`date`, stage, country, funds_raised_millions) as row_num
from layoffs_dup ;


with duplicate_cte as
(select *,
row_number() over(partition by company, location, industry, total_laid_off, percentage_laid_off,
`date`, stage, country, funds_raised_millions) as row_num
from layoffs_dup
)
select *
from duplicate_cte 
where row_num>1;



create table layoffs_clean 
like layoffs_dup;


alter table layoffs_clean add row_num int;


select *
from layoffs_clean;


insert into layoffs_clean
select *,
row_number() over(partition by company, location, industry, total_laid_off, percentage_laid_off,
`date`, stage, country, funds_raised_millions) as row_num
from layoffs_dup ;


delete
from layoffs_clean
where row_num>1;


-- satandardizing data

select company, trim(company)
from layoffs_clean
;


update layoffs_clean
set company=trim(company);


select distinct industry
from layoffs_clean
;


update layoffs_clean
set industry= 'Crypto'
where industry like 'Crypto%';


select distinct country
from layoffs_clean
order by 1
;


select distinct country, trim(trailing '.' from country)
from layoffs_clean
order by 1;



select `date`,
STR_TO_DATE(`date`, '%m/%d/%Y')
from layoffs_clean;


update layoffs_clean
set date= str_to_date(`date`, '%m/%d/%Y');



alter table layoffs_clean 
modify column `date` DATE;


select *
from layoffs_clean
where total_laid_off is null
and percentage_laid_off is null;


select *
from layoffs_clean
where industry is null
or industry = '';


update layoffs_clean
set industry= null
where industry='';

select *
from layoffs_clean
where company= 'Airbnb';


select *
from layoffs_clean as t1
join layoffs_clean as t2
	on t1.company=t2.company
    and t1.location=t2.location
where (t1.industry is null or t1.industry='')
and t2.industry is not null;

update layoffs_clean as t1
join layoffs_clean as t2
	on t1.company=t2.company
set t1.industry=t2.industry
where (t1.industry is null or t1.industry='')
and t2.industry is not null;


select *
from layoffs_clean
where company like 'bally%';


delete
from layoffs_clean
where total_laid_off is null
and percentage_laid_off is null;


select *
from layoffs_clean;


alter table layoffs_clean
drop column row_num;