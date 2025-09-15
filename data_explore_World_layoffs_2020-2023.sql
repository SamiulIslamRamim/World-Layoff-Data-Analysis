-- EXPLORE AND ANALYSIS 1
SELECT *
from layoffs_clean;

SELECT max(total_laid_off), max(percentage_laid_off)
from layoffs_clean;

SELECT *
from layoffs_clean
where percentage_laid_off=1
order by total_laid_off desc
;


select company, sum(total_laid_off)
from layoffs_clean
group by company
order by 2 desc;


select min(`date`), max(`date`)
from layoffs_clean;

select industry, sum(total_laid_off)
from layoffs_clean
group by industry
order by 2 desc;

select country, sum(total_laid_off)
from layoffs_clean
group by country
order by 2 desc;

select year(`date`), sum(total_laid_off)
from layoffs_clean
group by year(`date`)
order by 2 desc;


select stage, sum(total_laid_off)
from layoffs_clean
group by s
order by 2 desc;


select substring(`date`,1,7) as `month` , sum(total_laid_off)
from layoffs_clean
where substring(`date`,1,7) is not null
group by `month`
order by 1 asc;


with cte_RL as
(
select substring(`date`,1,7) as `month` , sum(total_laid_off) as tf
from layoffs_clean
where substring(`date`,1,7) is not null
group by `month`
order by 1 asc
)
select `month`, tf,sum(tf) over(order by `month`) as rl
from cte_RL;



select company, sum(total_laid_off)
from layoffs_clean
group by company
order by 2 desc;

select company, year(`date`), sum(total_laid_off)
from layoffs_clean
group by company, year(`date`)
order by 3 desc;


with company_year_l (Company, Years, T_laidoff )as
(
select company, year(`date`), sum(total_laid_off)
from layoffs_clean
group by company, year(`date`)
), company_ranks as
(
select *, 
dense_rank() over(partition by Years order by T_laidoff desc) as Ranks
from company_year_l
where Years is not null
)
select *
from company_ranks
where Ranks <=3
order by ranks asc;
