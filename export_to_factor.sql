
SELECT (@type:= c_invbooks.`type`) AS ftype, REPLACE(REPLACE(c_invbooks.`type`, 'INVOICE', 'F'), 'CREDIT_NOTE', 'A'), c_invbooks.`invoice_number`, c_invbooks.`inv_date`, c_invbooks.`tiers_code_display`,
c_invbooks.`prestation_ht`, c_invbooks.`montant_ttc`, IF(@type= 'INVOICE',datediff(c_invbooks.`due_date`, c_invbooks.`inv_date`), NULL), IF(@type='INVOICE',  c_invbooks.`due_date`, NULL), IF(@type='INVOICE',REPLACE(c_invbooks_billing.`billing_medcode`, 'FACTOR', 'VIR'), NULL)
FROM c_invbooks
LEFT JOIN c_invbooks_billing ON c_invbooks.`invoice_id` = c_invbooks_billing.`invoice_id`
WHERE c_invbooks_billing.`billing_medcode` = 'FACTOR'
AND c_invbooks.`invoice_number` > 1703000;