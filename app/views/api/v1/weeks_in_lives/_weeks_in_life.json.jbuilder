json.extract! weeks_in_life, :id, :start_date, :end_date, :week_number, :year, :memo, :total_score,
              :score_satisfaction, :score_emotional_balance, :score_productivity, :score_relationships,
              :score_values_alignment,  :account_id, :created_at, :updated_at
json.url api_v1_weeks_in_life_url(weeks_in_life, format: :json)
