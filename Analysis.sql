-- Tech Giants with highest layoffs in 2026 that received a positive stock reaction

SELECT 
    company,
    jobs_cut,
    revenue_2025,
    layoff_size_category
FROM layoffs
WHERE stock_reaction = 'Positive' AND jobs_cut > 2000
ORDER BY jobs_cut DESC;


-- Sectors with highest layoffs

SELECT sector,SUM(jobs_cut) AS total_layoffs
FROM layoffs
GROUP BY sector
ORDER BY total_layoffs DESC
LIMIT 5;


-- Countries with highest layoffs

SELECT country, SUM(jobs_cut) AS total_layoffs
FROM layoffs
GROUP BY country
ORDER BY total_layoffs DESC
LIMIT 3;
