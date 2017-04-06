SELECT  c_user.`lastname`, c_user.firstname, c_user_hr_infos.user_id, personal_address, personal_zipcode, personal_city, personal_phone_number, personal_email, personal_situation_code, personal_address2, c_user_hr_infos.update_date
FROM c_user_hr_infos
LEFT JOIN c_user ON c_user.user_id = c_user_hr_infos.user_id 
WHERE c_user_hr_infos.`update_date` > '2017-03-01'
ORDER BY user_id DESC; 