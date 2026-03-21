-- 1.Tech Giants with highest layoffs in 2026 that received a positive stock reaction

SELECT 
    company,
    jobs_cut,
    revenue_2025,
    layoff_size_category
FROM layoffs
WHERE stock_reaction = 'Positive' AND jobs_cut > 2000
ORDER BY jobs_cut DESC;


-- 2.Sectors most affected by layoffs

SELECT sector,SUM(jobs_cut) AS total_layoffs
FROM layoffs
GROUP BY sector
ORDER BY total_layoffs DESC
LIMIT 5;


-- 3.Countries with highest layoffs

SELECT 
    country,
    SUM(jobs_cut) AS total_layoffs
FROM layoffs
GROUP BY country
ORDER BY total_layoffs DESC
LIMIT 3;

-- 4.Which companies laid off more than 30% of their workforce?

SELECT 
    company,
    pct_workforce_cut AS perc_laid_off
FROM layoffs
WHERE pct_workforce_cut > 30;

-- 5.Is AI a major reason for layoffs?

SELECT 
    CASE 
        WHEN ai_cited = 'TRUE' THEN 'YES'
    ELSE 'NO'
    END AS `AI cited`,
    COUNT(*) AS company_count,
    AVG(pct_workforce_cut) Avg_perc_laid_off,
    SUM(jobs_cut) Total_layoffs,
    SUM(ai_investment) Total_ai_investment
FROM layoffs
GROUP BY `AI cited`;

-- 6.Companies that reported no layoffs in 2024 or 2025, but underwent significant reductions in 2026

SELECT 
    company,
    jobs_cut,
    pct_workforce_cut AS perc_layoff
FROM layoffs
WHERE layoffs_2024 = 0 AND layoffs_2025 = 0
ORDER BY perc_layoff DESC;


-- 7.Does the stock market react more positively to layoffs when the company "Cites AI"?

SELECT ai_cited, stock_reaction, COUNT(*) AS count
FROM layoffs
GROUP BY 1,2;