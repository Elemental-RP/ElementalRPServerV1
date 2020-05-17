RegisterNetEvent("xenknight:twitter_getTweets")
AddEventHandler("xenknight:twitter_getTweets", function(tweets)
  SendNUIMessage({event = 'twitter_tweets', tweets = tweets})
end)

RegisterNetEvent("xenknight:twitter_getFavoriteTweets")
AddEventHandler("xenknight:twitter_getFavoriteTweets", function(tweets)
  SendNUIMessage({event = 'twitter_favoritetweets', tweets = tweets})
end)

RegisterNetEvent("xenknight:twitter_newTweets")
AddEventHandler("xenknight:twitter_newTweets", function(tweet)
  SendNUIMessage({event = 'twitter_newTweet', tweet = tweet})
end)

RegisterNetEvent("xenknight:twitter_updateTweetLikes")
AddEventHandler("xenknight:twitter_updateTweetLikes", function(tweetId, likes)
  SendNUIMessage({event = 'twitter_updateTweetLikes', tweetId = tweetId, likes = likes})
end)

RegisterNetEvent("xenknight:twitter_setAccount")
AddEventHandler("xenknight:twitter_setAccount", function(username, password, avatarUrl)
  SendNUIMessage({event = 'twitter_setAccount', username = username, password = password, avatarUrl = avatarUrl})
end)

RegisterNetEvent("xenknight:twitter_createAccount")
AddEventHandler("xenknight:twitter_createAccount", function(account)
  SendNUIMessage({event = 'twitter_createAccount', account = account})
end)

RegisterNetEvent("xenknight:twitter_showError")
AddEventHandler("xenknight:twitter_showError", function(title, message)
  SendNUIMessage({event = 'twitter_showError', message = message, title = title})
end)

RegisterNetEvent("xenknight:twitter_showSuccess")
AddEventHandler("xenknight:twitter_showSuccess", function(title, message)
  SendNUIMessage({event = 'twitter_showSuccess', message = message, title = title})
end)

RegisterNetEvent("xenknight:twitter_setTweetLikes")
AddEventHandler("xenknight:twitter_setTweetLikes", function(tweetId, isLikes)
  SendNUIMessage({event = 'twitter_setTweetLikes', tweetId = tweetId, isLikes = isLikes})
end)



RegisterNUICallback('twitter_login', function(data, cb)
  TriggerServerEvent('xenknight:twitter_login', data.username, data.password)
end)
RegisterNUICallback('twitter_changePassword', function(data, cb)
  TriggerServerEvent('xenknight:twitter_changePassword', data.username, data.password, data.newPassword)
end)


RegisterNUICallback('twitter_createAccount', function(data, cb)
  TriggerServerEvent('xenknight:twitter_createAccount', data.username, data.password, data.avatarUrl)
end)

RegisterNUICallback('twitter_getTweets', function(data, cb)
  TriggerServerEvent('xenknight:twitter_getTweets', data.username, data.password)
end)

RegisterNUICallback('twitter_getFavoriteTweets', function(data, cb)
  TriggerServerEvent('xenknight:twitter_getFavoriteTweets', data.username, data.password)
end)

RegisterNUICallback('twitter_postTweet', function(data, cb)
  TriggerServerEvent('xenknight:twitter_postTweets', data.username or '', data.password or '', data.message)
end)

RegisterNUICallback('twitter_toggleLikeTweet', function(data, cb)
  TriggerServerEvent('xenknight:twitter_toogleLikeTweet', data.username or '', data.password or '', data.tweetId)
end)

RegisterNUICallback('twitter_setAvatarUrl', function(data, cb)
  TriggerServerEvent('xenknight:twitter_setAvatarUrl', data.username or '', data.password or '', data.avatarUrl)
end)
