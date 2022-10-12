TEAMS_CARD=$(cat << EOF
{
"type":"message",
"attachments":[
	{
		"contentType":"application/vnd.microsoft.card.adaptive",
		"contentUrl":null,
		"content": {
			"type": "AdaptiveCard",
			"\$schema": "http://adaptivecards.io/schemas/adaptive-card.json",
			"version": "1.4",
			"body": [
				{
					"type": "Container",
					"items": [
						{
							"type": "TextBlock",
							"text": "New release",
							"wrap": true,
							"size": "Medium",
							"weight": "Bolder"
						},
						{
							"type": "TextBlock",
							"text": "$TAG",
							"wrap": true,
							"size": "Large",
							"weight": "Bolder",
							"color": "Accent"
						}
					],
					"style": "warning"
				},
				{
					"type": "Container",
					"items": [
						{
							"type": "TextBlock",
							"text": "$CONTENT",
							"wrap": true
						}
					],
					"style": "emphasis"
				}
			]
		}
	}
]
}
EOF
)

curl -H "Content-Type: application/json" -d "$TEAMS_CARD" "$TEAMS_WEBHOOK"

