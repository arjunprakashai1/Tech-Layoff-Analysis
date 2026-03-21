# ⚙ Tech Layoffs 2026 — SQL Analysis Project

> *An exploratory SQL project analysing the patterns, drivers, and market reactions behind the 2026 wave of tech layoffs.*

---

## 📌 Overview

This project dives into a dataset of 2026 tech layoffs to answer one central question: **what's really driving companies to cut their workforce, and what does it tell us about where the industry is heading?**

Using MySQL, I explored everything from which sectors are bleeding the most jobs, to whether slapping "AI" on a press release actually makes investors feel better about mass layoffs.

---

## 📁 Project Structure

```
tech-layoffs-2026/
│
├── tech_layoffs_2026_tracker.csv   # Raw dataset
├── Data_Import.sql                 # Database setup & data loading
├── Analysis.sql                    # All 7 analytical queries + findings
└── README.md                       
```

---

## 🗃️ Dataset

**File:** `tech_layoffs_2026_tracker.csv`

Each row represents a single company's layoff event in 2026. Here's what the dataset tracks:

| Column | Description |
|---|---|
| `company` | Company name |
| `layoff_date` | Date of layoff announcement |
| `jobs_cut` | Number of jobs eliminated |
| `pct_workforce_cut` | Percentage of workforce affected |
| `sector` | Industry sector |
| `country` | Country of operation |
| `ai_cited` | Whether AI was cited as a reason (TRUE/FALSE) |
| `revenue_2025` | Company revenue in 2025 (USD) |
| `pre_layoff_headcount` | Employee count before layoffs |
| `ai_investment` | AI-related investment spend (USD) |
| `layoffs_2024` | Jobs cut in 2024 |
| `layoffs_2025` | Jobs cut in 2025 |
| `region` | Geographic region |
| `layoff_size_category` | Categorical scale of the layoff event |
| `stock_reaction` | Market reaction (Positive/Negative/Neutral) |

---

## ⚙️ Setup & Data Import

**File:** `Data_Import.sql`

The setup script handles the full pipeline from scratch:

1. Creates a fresh `layoffs` database
2. Defines the `layoffs` table with appropriate data types (`layoff_date` is initially loaded as `VARCHAR` to avoid import errors, then converted to `DATE` via `ALTER TABLE`)
3. Loads data using `LOAD DATA INFILE` with proper CSV parsing settings
4. Converts the date column to its proper type post-load

> **Note:** You'll need to update the file path in the `LOAD DATA INFILE` statement to match your local MySQL upload directory. Run `SHOW VARIABLES LIKE "secure_file_priv"` to find yours.

---

## 🔍 Analysis Questions

**File:** `Analysis.sql`

Seven business questions were explored, each with a query and a written interpretation of the findings.

---

### 1. Which tech giants cut the most jobs — and still got a thumbs up from the market?

Filtered for companies with a **positive stock reaction** and **more than 2,000 jobs cut**.

**Key finding:** Oracle cut 30,000 jobs on $52.9B in revenue — nearly double Amazon's layoff count despite having less than 10% of Amazon's revenue. Meanwhile, Amazon and Meta both cut exactly 16,000 jobs, suggesting that at this scale, layoffs are about **strategic repositioning**, not survival.

---

### 2. Which sectors were hit hardest?

Aggregated total jobs cut by sector.

**Key finding:** Enterprise Software led with 31,600 layoffs — nearly double any other category. E-Commerce/Cloud and Social Media/AI mirrored each other at exactly 16,000 cuts each. Telecommunications and Cybersecurity remained comparatively stable, hinting that foundational infrastructure roles are more resilient than consumer-facing or platform-driven ones.

---

### 3. Where in the world are the layoffs concentrated?

Total layoffs grouped by country.

**Key finding:** The USA accounts for over 83,000 layoffs — more than 16 times the combined impact of Spain and Australia. This wave is overwhelmingly a **North American phenomenon**, with other countries seeing "Large" scale cuts at most.

---

### 4. Which companies cut more than 30% of their workforce?

Filtered for `pct_workforce_cut > 30`.

**Key finding:** Both companies making cuts this deep exceeded 35% of their workforce — well above the ~12% average for AI-citing firms. Block's absolute impact (4,000 jobs) is four times larger than SK Battery America's, showing how the same percentage translates very differently at different company sizes.

---

### 5. Is AI actually a reason for layoffs — or just a narrative?

Compared companies that cited AI vs. those that didn't, across average workforce cut %, total jobs lost, and AI investment spend.

**Key finding:** AI-citing companies cut **24% more of their workforce on average** (11.79% vs. 9.50%) and account for 22,904 more total layoffs despite being the same sample size. They're also investing **2.7x more in AI** ($287M vs. $106M), confirming a direct trade-off: human headcount is being replaced by AI infrastructure spend.

---

### 6. Which companies had zero layoffs in 2024 and 2025 — then went big in 2026?

Filtered for `layoffs_2024 = 0 AND layoffs_2025 = 0`, sorted by severity.

**Key finding:** Meta Platforms is the standout — after two consecutive years of zero layoffs, it cut 16,000 jobs in 2026, more than all other stable companies in this list combined. A clear divide emerged between "restructuring" firms (cutting 20%+ of staff) and "optimizing" firms like xAI and ASML (targeting ≤3% with surgical precision).

---

### 7. Does citing AI make investors more forgiving?

Cross-tabulated `ai_cited` against `stock_reaction`.

**Key finding:** Companies that cited AI saw a **78.6% positive stock reaction** (11 out of 14). Companies that didn't cite AI received a negative reaction the majority of the time (57%). Not a single AI-citing company in this dataset received a negative market reaction — the market clearly rewards the "AI pivot" narrative, regardless of the human cost behind it.

---

## 🛠️ Tools Used

- **MySQL 8.0** — database, querying, and data transformation
- **MySQL Workbench** — query execution and result visualisation
- **VS Code** — code editor

---

## 💡 Key Takeaways

- The 2026 layoff wave is heavily **US-centric** and concentrated in **Enterprise Software**
- **AI is both a cause and a cover story** — companies invest heavily in AI while using it to justify cutting headcount
- **Investors reward the AI narrative** — citing AI in layoff announcements is strongly correlated with positive stock reactions
- Some of the most aggressive cuts are happening at companies that had **zero layoffs in prior years**, suggesting a delayed reckoning rather than a gradual adjustment
- Revenue size doesn't determine scale of cuts — Oracle's layoffs relative to its revenue are far more aggressive than Amazon's

---

## 🚀 How to Run This Project

```sql
-- Step 1: Run Data_Import.sql to set up the database and load data
-- Step 2: Run Analysis.sql to execute all 7 queries
-- (Update the file path in LOAD DATA INFILE before running Step 1)
```

---

## 👤 Author

Built as a personal SQL mini-project to practise exploratory data analysis on a real-world-style dataset.  
Feel free to fork, extend the analysis, or reach out with questions.

---

*If this sparked any thoughts or you spotted something interesting in the data, I'd love to hear it. Thanks.*