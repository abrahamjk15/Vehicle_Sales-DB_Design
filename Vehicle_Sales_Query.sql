SELECT 
    VM.Model AS Model, 
    COUNT(S.SaleID) AS NumberOfCarsSold 
FROM 
    Sale S 
JOIN 
    Vehicle V ON S.VIN = V.VIN 
JOIN 
    Vehicle_Model_mapping VMM ON V.VIN = VMM.VIN 
JOIN 
    Vehicle_Model VM ON VMM.ModelID = VM.ModelID 
WHERE 
    (MONTH(S.Date) = 8 AND YEAR(S.Date) = 2023) 
    OR 
    (MONTH(S.Date) = 12 AND YEAR(S.Date) = 2023) 
GROUP BY 
    VM.Model 
ORDER BY 
    VM.Model;
