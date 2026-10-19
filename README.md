<a id="readme-top"></a>

<br />
<div align="center">
  <h3 align="center">Warner Bros. Discovery Streaming Revenue &amp; Subscriber Analysis (2024-2025)</h3>
  <p align="center">
    SQL analysis of whether gaining more streaming subscribers also meant earning more revenue, using eight quarters of public earnings data
    <br />
    <a href="https://github.com/Swikc4/streaming-subscriber-revenue-analysis"><strong>Explore the repo »</strong></a>
  </p>
</div>

<details>
  <summary>Table of Contents</summary>
  <ol>
    <li><a href="#about-the-project">About The Project</a>
      <ul><li><a href="#built-with">Built With</a></li></ul>
    </li>
    <li><a href="#what-i-analyzed">What I Analyzed</a></li>
    <li><a href="#what-i-found">What I Found</a></li>
    <li><a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#installation">Installation</a></li>
      </ul>
    </li>
    <li><a href="#usage">Usage</a></li>
    <li><a href="#dataset">Dataset</a></li>
    <li><a href="#what-i-learned">What I Learned</a></li>
    <li><a href="#acknowledgments">Acknowledgments</a></li>
  </ol>
</details>

## About The Project

For this project, I used SQL to analyze Warner Bros. Discovery's streaming revenue and subscriber growth between 2024 and 2025.

I wanted to understand how the company's streaming business performed over time, especially whether gaining more subscribers also meant earning more revenue.

I worked with quarterly financial data and used PostgreSQL to calculate revenue changes, subscriber growth, and year-over-year performance.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

### Built With

* ![PostgreSQL](https://img.shields.io/badge/PostgreSQL-4169E1?style=for-the-badge&logo=postgresql&logoColor=white)
* ![SQL](https://img.shields.io/badge/SQL-4479A1?style=for-the-badge)
* ![pgAdmin 4](https://img.shields.io/badge/pgAdmin%204-336791?style=for-the-badge)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## What I Analyzed

I focused on four main questions:

1. How much did streaming revenue grow or decline each quarter?
2. Did subscriber growth always lead to higher revenue?
3. How did streaming revenue in 2025 compare with 2024?
4. How much quarterly revenue was generated relative to the number of subscribers?

To answer these questions, I used SQL functions and concepts including `SELECT`, `GROUP BY`, `CASE WHEN`, `LAG()`, `ROUND()`, CTEs, and percentage calculations.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## What I Found

### 1. More subscribers didn't always mean more revenue

One of the most interesting findings was in Q3 2025.

Streaming revenue decreased by **5.73%**, even though the number of subscribers increased by **1.83%**.

This stood out to me because I expected revenue and subscriber growth to move in the same direction.

![Revenue and Subscriber Growth](results/07_revenue_vs_subscriber_growth.png)

### 2. Revenue relative to subscriber count declined

I also calculated quarterly streaming revenue divided by the number of subscribers at the end of each quarter.

The ratio decreased from approximately **$24.70 in Q1 2024 to $21.23 in Q4 2025**.

This doesn't necessarily mean individual customers were spending less. It's a simple ratio based on quarterly revenue and quarter-end subscribers, not the company's official average revenue per user.

![Revenue per Subscriber](results/08_revenue_per_subscriber.png)

### 3. Streaming revenue was generally higher in 2025

When I compared the same quarters in 2024 and 2025, I found that revenue was higher in three of the four quarters in 2025.

Q3 was the exception, with revenue remaining almost unchanged compared with Q3 2024.

![Quarterly Revenue Comparison](results/10_quarterly_revenue_comparison.png)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## Getting Started

### Prerequisites

* PostgreSQL 18 and pgAdmin 4

### Installation

1. Clone the repo
   ```sh
   git clone https://github.com/Swikc4/streaming-subscriber-revenue-analysis.git
   ```
2. Create a database named `streaming_analysis` in PostgreSQL.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## Usage

1. Run `sql/01_create_tables.sql` to create the table.
2. Import `data/wbd_streaming_2024_2025.csv` into the table using pgAdmin. Make sure the CSV header is enabled and leave out the automatically generated `id` column.
3. Run the SQL files in the `sql` folder to reproduce the analysis. If the data has already been imported, there's no need to import it again.

Project files:

- `data/` - dataset and source references
- `sql/` - SQL queries used in the analysis
- `results/` - graphs showing the findings
- `docs/` - additional information about the data

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## Dataset

The project uses eight quarters of Warner Bros. Discovery streaming financial data from 2024 and 2025, collected from publicly available earnings information and SEC filings. `data/wbd_streaming_sources.csv` lists the SEC filing used for each quarter.

The dataset contains the reporting year, quarter, streaming revenue, and subscriber count.

The figures and reporting definitions still need a final check against the original reports. Since this is quarterly company-level data, the analysis focuses on business performance rather than individual customer behavior or churn.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## What I Learned

This project helped me get more comfortable writing SQL queries and understanding how different functions work together.

Before this project, I was mainly practicing SQL commands individually. Here, I got to use them to answer actual business questions.

I also learned that an increase in one metric doesn't always mean another metric will increase. Looking at revenue and subscribers together gave me a better understanding of the company's performance.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## Acknowledgments

* Warner Bros. Discovery investor relations and SEC filings
