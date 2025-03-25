select * from shopping_behavior_update;

-- 1.Who purchaes more male or female 
SELECT Gender , SUM(Purchase_Amount_USD) AS Total_Purchased_Amount 
FROM shopping_behavior_update
GROUP BY Gender
ORDER BY Total_Purchased_Amount ASC;

-- 2. Find average purchase amount based age_range 
Select 
	case 
		WHEN Age Between 18 AND 19 THEN '18-19'
        WHEN Age Between 20 AND 30 THEN '20-30'
        WHEN Age Between 10 AND 60 THEN '31-60'
        WHEN Age >= 61 THEN '61+' 
	END AS Age_Range,
    AVG(Purchase_Amount_USD) AS Ave_Purchase_Amount 
FROM shopping_behavior_update
group by Age_Range
Order by Age_Range;

-- 3. Find which age_ranges purchase frequency 
Select 
	case 
		WHEN Age Between 18 AND 19 THEN '18-19'
        WHEN Age Between 20 AND 30 THEN '20-31'
        WHEN Age Between 31 AND 60 THEN '30-60'
        WHEN Age >= 61 THEN '61+' 
	END AS Age_Range,
	AVG (
		case 
		WHEN Frequency_of_Purchases = 'Weekly' THEN 4
        WHEN Frequency_of_Purchases = 'Bi -Weekly' THEN 2
        WHEN Frequency_of_Purchases = 'Monthly' THEN 1
        WHEN Frequency_of_Purchases = 'Annually' THEN 1/12
        END 
        )AS Average_Purchase_Frequency 
        FROM shopping_behavior_update
        GROUP BY Age_Range
        ORDER BY Age_Range;
        
-- 4. Which state(Location) Average Purchase 
Select Location, AVG(Purchase_Amount_USD) AS Avergae_Purchase_Amount 
FROM shopping_behavior_update
GROUP BY Location 
ORDER BY Location;

-- 5. Review Rating Average in each location
SELECT Location ,AVG(Review_Rating) AS Avergae_Review_Rating
FROM shopping_behavior_update
group by  Location
Order by Location ASC;
        
-- 6. Which season makes the most Revenue 
SELECT Season, SUM(Purchase_Amount_USD) AS Total_Revenue 
From shopping_behavior_update
GROUP BY Season 
ORDER BY Total_Revenue ASC ;
