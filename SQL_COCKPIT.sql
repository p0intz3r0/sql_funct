SELECT c_user_hr_infos.registration_number,c_orders_details.user_id, c_user_hr_infos.starting_date,  c_services_tiers.main_name, c_user.firstname, c_user.lastname,
  c_orders.tab_title ,c_orders_details.start_date, c_orders_details.end_date, c_orders_details.ht_unit,
  c_user_hr_pay_month_closing_summary.salaries_amount + c_user_hr_bonus.amount,  c_reporting_user_prj.cost_for_current_month/218 , /* -- Variable du nb de jours (218/Coeff K) -- */
  c_user_hr_pay_month_closing_infos.nb_worked_days, 
  c_orders_details.ht_unit * c_user_hr_pay_month_closing_infos.nb_worked_days,  round((c_reporting_user_prj.cost_for_current_month/218) * c_user_hr_pay_month_closing_infos.nb_worked_days)
 FROM c_orders_details 
	LEFT JOIN c_orders ON c_orders_details.order_id = c_orders.order_id
		LEFT JOIN c_user ON c_user.user_id = c_orders_details.user_id 
			INNER JOIN c_services_tiers ON c_services_tiers.code = c_orders.tiers_code 
				LEFT JOIN c_user_hr_infos ON c_user_hr_infos.user_id = c_user.user_id
					LEFT JOIN c_user_hr_pay_month_closing_summary ON c_user_hr_pay_month_closing_summary.user_id = c_orders_details.user_id 
						LEFT JOIN c_user_hr_bonus ON c_user_hr_bonus.user_id = c_orders_details.user_id 
							 JOIN c_user_hr_pay_month_closing_infos ON c_user_hr_pay_month_closing_infos.user_id = c_orders_details.user_id
							LEFT JOIN c_reporting_user_prj ON c_reporting_user_prj.user_id = c_orders_details.user_id  
								WHERE c_user_hr_bonus.bonus_date BETWEEN '2017-03-01' AND '2017-03-31' /* -- A modifier selon mois -- */ 
									AND c_reporting_user_prj.year = 2017 AND c_reporting_user_prj.month = 3  /* -- Année et mois à modifier -- */
										AND c_user_hr_pay_month_closing_infos.pay_closing_id = 73 /*-- pay_closing_id à chercher pour chaque mois --*/
										GROUP BY c_orders_details.line_common_key;