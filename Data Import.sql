-- creating a new database
CREATE DATABASE layoffs;

USE layoffs;

-- creating layoffs column
CREATE TABLE layoffs(
	company VARCHAR(50),
    layoff_date VARCHAR(20),
    jobs_cut INT,
    pct_workforce_cut INT,
    sector VARCHAR(50),
    country VARCHAR(50),
    ai_cited VARCHAR(10),
    revenue_2025 DEC(10,2),
    pre_layoff_headcount INT,
    ai_investment DEC(10,2),
    layoffs_2024 INT,
    layoffs_2025 INT,
    region VARCHAR(50),
    layoff_size_category VARCHAR(50),
    stock_reaction VARCHAR(10)
);

-- finding the location to export the data to load safely into the table
SHOW VARIABLES LIKE "secure_file_priv";

SET GLOBAL local_infile = 1;

-- Loading the data
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/tech_layoffs_2026_tracker.csv'
INTO TABLE layoffs
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

-- converting the data type of layoff_date from string to date
ALTER TABLE layoffs
MODIFY COLUMN layoff_date DATE;


