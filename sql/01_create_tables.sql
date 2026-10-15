-- PostgreSQL 18 | Warner Bros. Discovery streaming performance
-- Run in the streaming_analysis database using pgAdmin 4 Query Tool.
CREATE TABLE IF NOT EXISTS streaming_performance (
    id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    year INTEGER NOT NULL,
    quarter INTEGER NOT NULL CHECK (quarter BETWEEN 1 AND 4),
    subscribers_millions NUMERIC(12, 2),
    streaming_revenue_millions NUMERIC(14, 2),
    UNIQUE (year, quarter)
);
