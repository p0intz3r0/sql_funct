 
SELECT  c_invbooks.invoice_number, REPLACE(REPLACE(c_invbooks.type,'INVOICE','FATO'),'CREDIT_NOTE', 'AATO'),c_invbooks_lines.order_title,  c_invbooks.tiers_code_display, c_invbooks.inv_date, c_invbooks.period, c_invbooks.type_prestation, c_invbooks_lines.ht_unit, c_invbooks_lines.unit, c_invbooks.prestation_ht, c_invbooks.montant_ttc, c_invbooks.pay_status, REPLACE(c_invbooks_lines.order_code,'-',''), c_invbooks_lines.descr, datediff(c_invbooks.due_date ,c_invbooks.inv_date), c_invbooks_lines.user_id
FROM c_invbooks
LEFT JOIN c_invbooks_billing ON c_invbooks.invoice_id = c_invbooks_billing.invoice_id
                LEFT JOIN c_invbooks_lines ON c_invbooks.invoice_id = c_invbooks_lines.invoice_id
                               WHERE c_invbooks.invoice_number > 1702006; /* Numero de facture a partir duquel la requete se fait */