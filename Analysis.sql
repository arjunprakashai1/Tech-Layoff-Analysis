-- 1.Tech Giants with highest layoffs in 2026 that received a positive stock reaction

SELECT 
    company,
    jobs_cut,
    revenue_2025,
    layoff_size_category
FROM layoffs
WHERE stock_reaction = 'Positive' AND jobs_cut > 2000
ORDER BY jobs_cut DESC;

/*
- Oracle is cutting 30,000 staff on just $52.9B revenue—nearly double Amazon’s layoffs despite having less than 10% of Amazon's total revenue.
- Giants like Amazon ($716B) and Meta ($164B) are cutting the exact same number of jobs (16,000), showing that layoffs in this tier are about structural shifting rather than financial survival.
- Workday and Telefonica represent the "High-Risk" mid-tier, with significant cuts (2K–5K) occurring on much smaller revenue bases ($8B–$44B).
*/

-- 2.Sectors most affected by layoffs

SELECT sector,SUM(jobs_cut) AS total_layoffs
FROM layoffs
GROUP BY sector
ORDER BY total_layoffs DESC
LIMIT 5;

/*
- Enterprise Software Dominates with 31,600 layoffs—nearly double the impact of any other single category.
- E-Commerce/Cloud and Social Media/AI are perfectly mirrored at 16,000 cuts each, suggesting a synchronized "right-sizing" across major digital platforms.
- Telecommunications and Cybersecurity show significantly lower layoff volumes (under 7K), indicating these foundational sectors are more stable than consumer-facing or software-heavy industries
*/

-- 3.Countries with highest layoffs

SELECT 
    country,
    SUM(jobs_cut) AS total_layoffs
FROM layoffs
GROUP BY country
ORDER BY total_layoffs DESC
LIMIT 3;


/*
- The USA accounts for over 83,000 layoffs—more than 16 times the impact of Spain and Australia combined.
- While the USA shows massive "Mega-scale" reductions, Spain and Australia remain in the "Large" category (under 5K), suggesting the 2026 layoff wave is heavily concentrated in North American tech hubs
*/

-- 4.Which companies laid off more than 30% of their workforce?

SELECT 
    company,
    pre_layoff_headcount,
    pct_workforce_cut AS perc_laid_off
FROM layoffs
WHERE pct_workforce_cut > 30;

/*
- Both companies are executing deep cuts exceeding 35% of their total staff, which is significantly higher than the ~12% average seen in other AI-citing firms.
- While the percentages are similar, the absolute impact at Block (4,000 jobs) is four times larger than at SK Battery America, demonstrating how aggressive downsizing scales with company size.
*/

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

/*
- Companies citing AI are cutting 24% more of their workforce on average (11.79% vs. 9.50%) compared to those that do not.
- Despite having the same sample size (14 companies each), the AI-citing group accounts for 22,904 more total layoffs, showing that the AI pivot is concentrated in the largest enterprises.
- The AI-citing group is investing 2.7x more capital in AI technology ($287M vs. $106M), confirming a direct trade-off between human headcount and AI infrastructure.
*/

-- 6.Companies that reported no layoffs in 2024 or 2025, but underwent significant reductions in 2026

SELECT 
    company,
    layoffs_2024,
    layoffs_2025,
    jobs_cut,
    pct_workforce_cut AS perc_layoff
FROM layoffs
WHERE layoffs_2024 = 0 AND layoffs_2025 = 0
ORDER BY perc_layoff DESC;

/*
- After two years of stability, companies like SK Battery America (37%) and Meta Platforms (20%) are implementing aggressive cuts, suggesting a rapid transition from workforce retention to significant downsizing.
- Meta Platforms dominates this group by volume, with 16,000 jobs cut—more than all other companies in this specific list combined, marking a massive strategic pivot following a period of zero layoffs.
- There is a clear divide between "restructuring" firms cutting 20% or more of their staff and "optimizing" firms like xAI and ASML, which are performing minor, targeted trims of <= 3%
*/

-- 7.Does the stock market react more positively to layoffs when the company "Cites AI"?

SELECT ai_cited, stock_reaction, COUNT(*) AS count
FROM layoffs
GROUP BY ai_cited, stock_reaction;

/*
- Companies citing AI see a 78.6% positive stock reaction (11 out of 14), suggesting that investors interpret AI-driven layoffs as strategic "future-proofing" rather than financial distress.
- In contrast, layoffs without an AI narrative result in a negative reaction the majority of the time (57%), with no negative reactions recorded for companies that explicitly cited AI in this dataset.
- The market shows a clear preference for the "AI Pivot", rewarding firms that reallocate capital toward automation while penalizing traditional workforce reductions.
*/


