﻿$url = "https://api.coinmarketcap.com/v1/ticker/?limit=10"   
$user = Invoke-RestMethod -Uri $url
$user | select name, symbol, rank, price_usd, price_btc, 24h_volume_usd, market_cap_usd, available_supply, total_supply, max_supply, percent_change_1h, percent_change_24h, percent_change_7d, last_updated | Export-Csv -Path c:\temp\cryptocurrency.csv -NoTypeInformation