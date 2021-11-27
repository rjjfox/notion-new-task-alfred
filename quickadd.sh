# The database_id and secret_key should be set using the environment variables

# This captures the task input after the keyword trigger
query=$@

curl 'https://api.notion.com/v1/pages' \
  -H 'Authorization: Bearer '$secret_key'' \
  -H 'Content-Type: application/json' \
  -H 'Notion-Version: 2021-08-16' \
  --data '{
	"parent": { "database_id": "'$database_id'" },
	"properties": {
		"'$name_field'": {
			"title": [
				{
					"text": {
						"content": "'"$query"'"
					}
				}
			]
		}
	}
}'