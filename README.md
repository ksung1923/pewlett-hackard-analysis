# Pewlett Hackard Analysis

## Overview of Pewlett Hackard Analysis
Pewlett Hackard is a large company that has been around for a long time. As Baby-Boomers begin to retire at a rapid rate, Pewlett Hackard is looking toward the future in two ways. First, it is offering retirement packages for those that meet certain criterias. Second, Pewlett Hackard is starting to think about which positions will need to be filled in the near future. Bobby has been tasks to do employee reserach and asked for my assistance. The reserach will help answer two questions: 
1. Who will be retiring? 
2. How many positions will Pewlett Hackard need to fill? 

Pewlett Hackard has upgraded to now use SQL and I assisted Bobby in creating an employee database on SQL. From the database, I helped determine the number of retiring employees per title, and identified employees who are eligible to participate in a mentorship program. The analysis will help Bobby's mangager prepare for the "silver tsunami" as many current employees reach retirement age. 

## Resources and Software
-SQL

-Data Sources: 
    - [departments.csv](https://github.com/ksung1923/pewlett-hackard-analysis/blob/f264538afb9fb4e9e08b735ad7fe2116dec63253/Analysis%20Projects%20Folder/Pewlett-Hackard-Analysis%20Folder/Data/departments.csv)
    - [dept_emp.csv](https://github.com/ksung1923/pewlett-hackard-analysis/blob/f264538afb9fb4e9e08b735ad7fe2116dec63253/Analysis%20Projects%20Folder/Pewlett-Hackard-Analysis%20Folder/Data/dept_emp.csv)
    - [dept_manager.csv](https://github.com/ksung1923/pewlett-hackard-analysis/blob/f264538afb9fb4e9e08b735ad7fe2116dec63253/Analysis%20Projects%20Folder/Pewlett-Hackard-Analysis%20Folder/Data/dept_manager.csv)
    - [employees.csv](https://github.com/ksung1923/pewlett-hackard-analysis/blob/f264538afb9fb4e9e08b735ad7fe2116dec63253/Analysis%20Projects%20Folder/Pewlett-Hackard-Analysis%20Folder/Data/employees.csv)
    - [salaries.csv](https://github.com/ksung1923/pewlett-hackard-analysis/blob/f264538afb9fb4e9e08b735ad7fe2116dec63253/Analysis%20Projects%20Folder/Pewlett-Hackard-Analysis%20Folder/Data/salaries.csv)
    - [titles.csv](https://github.com/ksung1923/pewlett-hackard-analysis/blob/f264538afb9fb4e9e08b735ad7fe2116dec63253/Analysis%20Projects%20Folder/Pewlett-Hackard-Analysis%20Folder/Data/titles.csv)


## Results 
From the data sources provided by Pewlett Hackard, I created a SQL employee database to run the following analysis. 

1. Determine the number of retiring employees per title. 
2. Identify employees who are eligible to participate in a mentorship program. 

The following are major points from my analysis: 

1. There are a total of 90,398 employees eligible for the retirement package. 
2. The top 3 titles with the most employees eligible for retirement is Senior Engineer, Senior Staff, and Engineer. Please see the spreadsheet for the complete list of retiring employees per title. 
[retiring_titles.csv](https://github.com/ksung1923/pewlett-hackard-analysis/blob/8187b496c22cb4fd31df1571116aa2c72a786442/Analysis%20Projects%20Folder/Pewlett-Hackard-Analysis%20Folder/Data/retiring_titles.csv)

3. There are a total of 1,549 employees who are eligible to participate in a mentorship program. 
4. The top 3 titles with the most employees eligible for a mentorship program is the same as the top 3 titles of employees eligible for retirement. The top 3 titles ares Senior Engineer, Engineer and Senior Staff.

## Summary  
The analysis helped provide more insight into the upcoming "silver tsunami" by answering the following two questions: 

1. How many roles will need to be filled as the "silver tsunami" begins to make an impact? 

We saw a total of 90,398 employees eligible for the retirement package. When we group by department, we find there are seven roles that have employees eligible for retirement packages. I used the following code to determine the roles that will be impacted by the "silver tsunami". 

```
--CREATE retiring_titles tables 
SELECT COUNT(*) AS count, title
INTO retiring_titles
FROM retirement_titles_distinct
GROUP BY title
ORDER BY COUNT(*) DESC; 
--7
```

Here are the seven departments that will be impacted by the "silver tsunami". 

![Retiring_Title](https://github.com/ksung1923/pewlett-hackard-analysis/blob/e3e7535d38ee274f810f338630e24a82b46f03c0/Analysis%20Projects%20Folder/Pewlett-Hackard-Analysis%20Folder/Retiring_Title.PNG)

2. Are there enough qualified, retirement-ready employees in the departments to mentor the next generation of Pewlett Hackard employees? 
When looking at the 1,549 employees who are eligible to participate in a mentorship program, we only find six departments among the employees qualified and retirement-ready to mentor the next generation of Pewlett Hackard employees. To determine all the departments with employees in a position to mentor, I used the following code. 

```
--mentorship_eligibilty by title
SELECT COUNT(*) AS count, title
FROM mentorship_eligibilty
GROUP BY title
ORDER BY COUNT(*) DESC; 
--6
```

The six deparments that have qualified, retirement-ready employees to mentor the next generation of employees are: 

![Mentorship_Title](https://github.com/ksung1923/pewlett-hackard-analysis/blob/e3e7535d38ee274f810f338630e24a82b46f03c0/Analysis%20Projects%20Folder/Pewlett-Hackard-Analysis%20Folder/Mentorship_Title.PNG)

The one department that does not have employees eligible for the mentorship program is "Manager". Since Pewlett Hackard is expected two Managers to retire in the upcoming "silver tsunami", a recommendation would be to ask managers younger than current employees born in 1965 to start mentoring the next generation. That will be critical for the future of the "Manager" department. 
