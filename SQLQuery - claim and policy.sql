SELECT 
	mocked_data_claim.claim_no,
	mocked_data_claim.policy_no,
	mocked_data_claim.claim_net_loss,
	mocked_data_claim.claim_rightwrong_flag,
	mocked_data_policy.motor_policy_type, 
	mocked_data_policy.subclass_desc_thai,
	mocked_data_policy.uw_year,
	mocked_data_policy.net_premium,
	mocked_data_policy.vehicle_master_model_brand_cleaned,
	mocked_data_policy.vehicle_body_type_category,
	(mocked_data_claim.claim_net_loss / mocked_data_policy.net_premium) as "Loss Ratio" 
FROM mocked_data_claim 
inner JOIN mocked_data_policy -- keep only the records which the policy numbers in each table match each other
ON mocked_data_policy.policy_no = mocked_data_claim.policy_no and mocked_data_policy.net_premium != 0