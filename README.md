# GPU-Monitoring-System
In order to extract Graphical Processing Unit (GPU) price and history data from Newegg purchasing websites, a complex web scraping and data management system must be developed. The system effectively obtains real-time data from specific e-commerce sites, including prices, availability, and historical patterns, using several methods. A organized SQL database holds all of the extracted data, providing scalability and allowing smooth data processing and analysis. Effective functions for viewing data, evaluating past pricing trends, and triggering alerts based on preset thresholds for proactive decision-making are available to users. The database is kept up to date with the most recent data thanks to scheduled updates. Convenient access to data visualization capabilities, adjustable scraping parameters, and adaptable analytical elements to meet various business needs are all provided by an easy user interface. 
By Successfully implementing the Web scrapping and data management system, , driven by a SQL Server database, will address operational challenges faced by common people. Our centralized platform streamlines critical information management, reduces manual efforts, and establishes system integrity.

# REQUIREMENT GATHERING

Requirement gathering for the web scraping and data management system involves identifying and specifying essential functionalities to address operational inefficiencies faced by common people. Key requirements include:

- **Data Analysts**: Require accurate and comprehensive GPU data for analysis.
- **Developers**: Responsible for building and maintaining the system.
- **Product Managers**: Oversee project progress and ensure stakeholder requirements are met.
- **End Users**: Individuals or organizations looking for GPU information, such as gamers, professionals, and researchers.

## Functional Requirements

### 1. Web Scraping

- **Source Selection**: Identify and select websites that provide GPU information, such as:
  - E-commerce platforms (e.g., Amazon, Newegg)
  - Review sites (e.g., Tom's Hardware, AnandTech)
  - Manufacturer websites (e.g., NVIDIA, AMD)
- **Data Extraction**: Define the data fields to be extracted, including:
  - GPU model
  - Manufacturer (e.g., NVIDIA, AMD)
  - Specifications (e.g., memory size, clock speed, power consumption)
  - Pricing information
  - Availability
  - User reviews and ratings
- **Scraping Frequency**: Determine how often the scraping will occur (e.g., daily, weekly).

### 2. Data Management

- **Database Design**: Design a database schema to store scraped data efficiently:
  - Tables for GPUs, manufacturers, prices, specifications, and reviews.
- **Data Storage**: Choose a suitable database management system (e.g., MySQL, PostgreSQL, MongoDB).
- **Data Validation**: Implement validation rules to ensure data accuracy (e.g., checking for duplicates).
- **Data Update Mechanism**: Define how to update existing records (e.g., update prices, specs).

### 3. Data Analysis

- **Reporting Tools**: Integrate reporting tools to visualize data (e.g., dashboards showing price trends, performance metrics).
- **Export Options**: Allow users to export data in various formats (e.g., CSV, Excel).

## Non-Functional Requirements

- **Performance**: The scraping process should not overload the target websites, adhering to their robots.txt rules and rate limiting.
- **Scalability**: The system should be able to scale to handle an increasing number of sources and data volume.
- **Security**: Ensure secure storage and transmission of data, particularly sensitive user information.
- **Usability**: The interface for accessing scraped data should be user-friendly and intuitive.

# LOGICAL DESIGN

## Entity-Relationship Diagram

An Entity Relationship (ER) Diagram is a type of flowchart that illustrates how entities such as people, objects, or concepts relate to each other within a system. ER Diagrams are most often used to design or debug relational databases. Several notations and shapes are used to represent different entities and their relationships in a management system.

### Entities and Their Attributes (Primary Keys Underlined):

- **website** (*rating*, *no_of_reviews*, *url*)
- **sellsGPU** (*Manufacturer_name*, *Product_name*, *Serial_number*, *url*)
- **priceinfo** (*Product_price*, *shipping_price*, *Discount*, *Serial_number*)

# TECH STACK USED FOR THE PROJECT

## FRONTEND:

### FLASK:
Flask is an API of Python that allows us to build web applications.

### RENDER_TEMPLATE:
In Python, a render template is a process where a template engine, such as Jinja2, takes a template file and replaces placeholders with actual data to generate a final HTML or text output.

### REQUEST:
The request module in Python is a lightweight and intuitive library for making HTTP requests. It provides a simple and easy-to-use interface for sending and receiving data from websites, simplifying the process of working with HTTP requests and responses.

## BACKEND:

### WEB SCRAPING:
Web scraping, web harvesting, or web data extraction is data scrapping used for extracting data from websites. Web scraping software may directly access the World Wide Web using HTTP or a web browser.

### BEAUTIFUL SOUP:
Beautiful Soup is a library that makes it easy to scrape information from web pages. It sits atop an HTML or XML parser, providing Pythonic idioms for iterating, searching, and modifying the parse tree.

### STRUCTURED QUERY LANGUAGE:
SQL is used to store all the data that has been collected from the different websites and all the procedures, queries help us to find the required information for the user using that collected database.
The database is set to be updated every 10 minutes to ensure that our website shows users the most recent data and discounts available in the market.

