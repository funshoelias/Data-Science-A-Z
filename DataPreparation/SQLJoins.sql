USE DSTraining
Go
SELECT *
  FROM [ListOfOrders] A
  LEFT JOIN [OrderBreakdown] B
  ON A.[Order ID] = B.[Order ID]