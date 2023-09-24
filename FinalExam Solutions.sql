##Problem 1: Find the total number of crimes recorded in the CRIME table.
SELECT COUNT(*) FROM final_project.chicagocrimedata;

##Problem 2: List community areas with per capita income less than 11000.
SELECT DISTINCT(COMMUNITY_AREA_NAME) FROM final_project.chicagocensusdata WHERE PER_CAPITA_INCOME<11000;

##Problem 3: List all case numbers for crimes involving minors?
SELECT CASE_NUMBER FROM final_project.chicagocrimedata WHERE DESCRIPTION LIKE "%minor%";

##Problem 4: List all kidnapping crimes involving a child?(children are not considered minors for the purposes of crime analysis)
SELECT * FROM final_project.chicagocrimedata WHERE PRIMARY_TYPE LIKE "%kidnap%";

##Problem 5: What kind of crimes were recorded at schools?
SELECT DISTINCT(PRIMARY_TYPE), LOCATION_DESCRIPTION FROM final_project.chicagocrimedata WHERE LOCATION_DESCRIPTION LIKE "%SCHOOL%";

##Problem 6: List the average safety score for all types of schools.
SELECT AVG(SAFETY_SCORE) FROM final_project.chicagopublicschools GROUP BY 'Elementary, Middle, or High School';

##Problem 7: List 5 community areas with highest % of households below poverty line.
SELECT COMMUNITY_AREA_NAME, PERCENT_HOUSEHOLDS_BELOW_POVERTY FROM final_project.chicagocensusdata ORDER BY PERCENT_HOUSEHOLDS_BELOW_POVERTY DESC LIMIT 5;

##Problem 8: Which community area(number) is most crime prone?
SELECT COMMUNITY_AREA_NUMBER, count(*) AS CNT FROM final_project.chicagocrimedata GROUP BY COMMUNITY_AREA_NUMBER ORDER BY CNT DESC LIMIT 1;

##Problem 9: Use a sub-query to find the name of the community area with highest hardship index.
SELECT COMMUNITY_AREA_NAME FROM final_project.chicagocensusdata WHERE HARDSHIP_INDEX IN (SELECT MAX(HARDSHIP_INDEX) FROM final_project.chicagocensusdata);

##Problem 10: Use a sub-query to determine the Community Area Name with most number of crimes?
SELECT COMMUNITY_AREA_NAME FROM final_project.chicagocensusdata WHERE COMMUNITY_AREA_NUMBER =(SELECT COMMUNITY_AREA_NUMBER FROM final_project.chicagocrimedata GROUP BY COMMUNITY_AREA_NUMBER ORDER BY COUNT(COMMUNITY_AREA_NUMBER) DESC LIMIT 1);