 SELECT c_user_hr_infos.starting_date, c_services_tiers.main_name, c_user.firstname, c_user.lastname,  
 c_orders.tab_title ,c_orders_details.start_date, c_orders_details.end_date, c_orders_details.ht_unit,
 c_user_hr_pay_month_closing_summary.salaries_amount, c_user_hr_pay_month_closing_bonus.amount, 
 c_user_hr_pay_month_closing_infos.nb_worked_days, c_user_hr_pay_month_closing_infos.nb_sickness_days,
 c_orders_stats.total_ca_prod, c_orders_stats.total_cost_prev
FROM c_orders_details LEFT JOIN c_orders ON c_orders_details.order_id = c_orders.order_id
LEFT JOIN c_user ON c_user.user_id = c_orders_details.user_id 
INNER JOIN c_services_tiers ON c_services_tiers.code = c_orders.tiers_code 
LEFT JOIN c_user_hr_infos ON c_user_hr_infos.user_id = c_user.user_id
LEFT JOIN c_user_hr_pay_month_closing_summary ON c_user_hr_pay_month_closing_summary.user_id = c_orders_details.user_id 
 LEFT JOIN c_user_hr_pay_month_closing_bonus ON c_user_hr_pay_month_closing_bonus.user_id = c_orders_details.user_id 
  LEFT JOIN c_user_hr_pay_month_closing_infos ON c_user_hr_pay_month_closing_infos.user_id = c_orders_details.user_id 
  LEFT JOIN c_orders_stats ON c_orders_stats.order_id = c_orders.order_id
GROUP BY c_orders_details.line_common_key;