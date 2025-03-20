# GPU-Monitoring-System
In order to extract Graphical Processing Unit (GPU) price and history data from Newegg purchasing websites, a complex web scraping and data management system must be developed. The system effectively obtains real-time data from specific e-commerce sites, including prices, availability, and historical patterns, using several methods. A organized SQL database holds all of the extracted data, providing scalability and allowing smooth data processing and analysis. Effective functions for viewing data, evaluating past pricing trends, and triggering alerts based on preset thresholds for proactive decision-making are available to users. The database is kept up to date with the most recent data thanks to scheduled updates. Convenient access to data visualization capabilities, adjustable scraping parameters, and adaptable analytical elements to meet various business needs are all provided by an easy user interface. 
By Successfully implementing the Web scrapping and data management system, , driven by a SQL Server database, will address operational challenges faced by common people. Our centralized platform streamlines critical information management, reduces manual efforts, and establishes system integrity.

# REQUIREMENT GATHERING:
Requirement gathering for the web scraping and data management system involves identifying and specifying essential functionalities to address operational inefficiencies faced by common people. Key requirements include:
 •	Data Analysts: Require accurate and comprehensive GPU data for analysis.
 •	Developers: Responsible for building and maintaining the system.
 •	Product Managers: Oversee project progress and ensure stakeholder requirements are met.
 •	End Users: Individuals or organizations looking for GPU information, such as gamers, professionals, and researchers

# Functional requirements:
1.Web Scraping
•	Source Selection: Identify and select websites that provide GPU information, such as:
o	E-commerce platforms (e.g., Amazon, Newegg)
o	Review sites (e.g., Tom's Hardware, AnandTech)
o	Manufacturer websites (e.g., NVIDIA, AMD)
•	Data Extraction: Define the data fields to be extracted, including:
o	GPU model
o	Manufacturer (e.g., NVIDIA, AMD)
o	Specifications (e.g., memory size, clock speed, power consumption)
o	Pricing information
o	Availability
o	User reviews and ratings
•	Scraping Frequency: Determine how often the scraping will occur (e.g., daily, weekly).
2.Data Management
•	Database Design: Design a database schema to store scraped data efficiently:
o	Tables for GPUs, manufacturers, prices, specifications, and reviews.
•	Data Storage: Choose a suitable database management system (e.g., MySQL, PostgreSQL, MongoDB).
•	Data Validation: Implement validation rules to ensure data accuracy (e.g., checking for duplicates).
•	Data Update Mechanism: Define how to update existing records (e.g., update prices, specs).
3.Data Analysis
•	Reporting Tools: Integrate reporting tools to visualize data (e.g., dashboards showing price trends, performance metrics).
•	Export Options: Allow users to export data in various formats (e.g., CSV, Excel).

Non-functional requirements:
•	Performance: The scraping process should not overload the target websites, adhering to their robots.txt rules and rate limiting.
•	Scalability: The system should be able to scale to handle an increasing number of sources and data volume.
•	Security: Ensure secure storage and transmission of data, particularly sensitive user information.
•	Usability: The interface for accessing scraped data should be user-friendly and intuitive.

# LOGICAL DESIGN:
ENTITY-RELATIONSHIP DIAGRAM;
	An Entity Relationship (ER) Diagram is a type of flowchart that illustrates how “entities” such as people, objects or concepts relate to each other within a system. ER Diagrams are most often used to design or debug relational databases, several notations and shapes are used to represent the different entities and their relationship in a management system.
ENTITIES AND THEIR ATTRIBUTES ALONG WITH PRIMARY KEY DENOTED BY UNDERLINE:
•	website (rating ,no_of_reviews ,url )
•	sellsGPU (Manufacturer_name ,Product_name ,Serial_number,urL)
•	priceinfo (Product_price,shipping_price,Discount ,Serial_number )
