local L0_1, L1_1, L2_1, L3_1, L4_1
L0_1 = RegisterNUICallback
L1_1 = "twitterLogin"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2
  L2_2 = Config
  L2_2 = L2_2.FrameworkFunctions
  L2_2 = L2_2.triggerCallback
  L3_2 = "high_phone:twitterLogin"
  function L4_2(A0_3)
    local L1_3, L2_3
    L1_3 = A1_2
    L2_3 = A0_3
    L1_3(L2_3)
  end
  L5_2 = A0_2.email
  L6_2 = A0_2.password
  L2_2(L3_2, L4_2, L5_2, L6_2)
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNUICallback
L1_1 = "twitterRegister"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L2_2 = Config
  L2_2 = L2_2.FrameworkFunctions
  L2_2 = L2_2.triggerCallback
  L3_2 = "high_phone:twitterRegister"
  function L4_2(A0_3)
    local L1_3, L2_3
    L1_3 = A1_2
    L2_3 = A0_3
    L1_3(L2_3)
  end
  L5_2 = A0_2.nickname
  L6_2 = A0_2.email
  L7_2 = A0_2.password
  L2_2(L3_2, L4_2, L5_2, L6_2, L7_2)
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNUICallback
L1_1 = "sendResetCode"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  L2_2 = TriggerServerEvent
  L3_2 = "high_phone:sendResetCode"
  L4_2 = A0_2.email
  L2_2(L3_2, L4_2)
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNUICallback
L1_1 = "resetTwitterAccount"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L2_2 = Config
  L2_2 = L2_2.FrameworkFunctions
  L2_2 = L2_2.triggerCallback
  L3_2 = "high_phone:resetTwitterAccount"
  function L4_2(A0_3)
    local L1_3, L2_3
    L1_3 = A1_2
    L2_3 = A0_3
    L1_3(L2_3)
  end
  L5_2 = A0_2.email
  L6_2 = A0_2.code
  L7_2 = A0_2.password
  L2_2(L3_2, L4_2, L5_2, L6_2, L7_2)
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNUICallback
L1_1 = "twitterLogout"
function L2_1(A0_2)
  local L1_2, L2_2
  L1_2 = TriggerServerEvent
  L2_2 = "high_phone:twitterLogout"
  L1_2(L2_2)
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNUICallback
L1_1 = "likeTweet"
function L2_1(A0_2)
  local L1_2, L2_2, L3_2
  L1_2 = TriggerServerEvent
  L2_2 = "high_phone:likeTweet"
  L3_2 = A0_2.id
  L1_2(L2_2, L3_2)
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNUICallback
L1_1 = "viewTweets"
function L2_1(A0_2)
  local L1_2, L2_2
  L1_2 = TriggerServerEvent
  L2_2 = "high_phone:viewTweets"
  L1_2(L2_2)
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNUICallback
L1_1 = "updateTweets"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2
  L2_2 = TriggerEvent
  L3_2 = "high_phone:updateTweets"
  L2_2(L3_2)
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNUICallback
L1_1 = "updateTwitterUserData"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2
  L2_2 = TriggerEvent
  L3_2 = "high_phone:updateTwitterUserData"
  L2_2(L3_2)
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNUICallback
L1_1 = "postTweet"
L2_1 = Config
L2_1 = L2_1.CustomCallbacks
L2_1 = L2_1.postTweet
L0_1(L1_1, L2_1)
L0_1 = RegisterNUICallback
L1_1 = "postReply"
L2_1 = Config
L2_1 = L2_1.CustomCallbacks
L2_1 = L2_1.postReply
L0_1(L1_1, L2_1)
L0_1 = RegisterNUICallback
L1_1 = "deleteTweet"
L2_1 = Config
L2_1 = L2_1.CustomCallbacks
L2_1 = L2_1.deleteTweet
L0_1(L1_1, L2_1)
L0_1 = RegisterNUICallback
L1_1 = "reportTweet"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2
  L2_2 = TriggerServerEvent
  L3_2 = "high_phone:reportTweet"
  L4_2 = A0_2.id
  L2_2(L3_2, L4_2)
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNUICallback
L1_1 = "twittersaveSettings"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L2_2 = Config
  L2_2 = L2_2.FrameworkFunctions
  L2_2 = L2_2.triggerCallback
  L3_2 = "high_phone:twittersaveSettings"
  function L4_2(A0_3)
    local L1_3, L2_3
    L1_3 = A1_2
    L2_3 = A0_3
    L1_3(L2_3)
  end
  L5_2 = A0_2.nickname
  L6_2 = A0_2.password
  L7_2 = A0_2.image
  L2_2(L3_2, L4_2, L5_2, L6_2, L7_2)
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNetEvent
L1_1 = "high_phone:addTweet"
L0_1(L1_1)
L0_1 = AddEventHandler
L1_1 = "high_phone:addTweet"
function L2_1(A0_2)
  local L1_2, L2_2
  L1_2 = SendNUIMessage
  L2_2 = {}
  L2_2.action = "newTweet"
  L2_2.tweet = A0_2
  L1_2(L2_2)
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNetEvent
L1_1 = "high_phone:deleteTweet"
L0_1(L1_1)
L0_1 = AddEventHandler
L1_1 = "high_phone:deleteTweet"
function L2_1(A0_2)
  local L1_2, L2_2
  L1_2 = SendNUIMessage
  L2_2 = {}
  L2_2.action = "deleteTweet"
  L2_2.tweetId = A0_2
  L1_2(L2_2)
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNetEvent
L1_1 = "high_phone:addReply"
L0_1(L1_1)
L0_1 = AddEventHandler
L1_1 = "high_phone:addReply"
function L2_1(A0_2, A1_2)
  local L2_2, L3_2
  L2_2 = SendNUIMessage
  L3_2 = {}
  L3_2.action = "newReply"
  L3_2.tweetId = A0_2
  L3_2.reply = A1_2
  L2_2(L3_2)
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNetEvent
L1_1 = "high_phone:updateTwitterUserData"
L0_1(L1_1)
L0_1 = AddEventHandler
L1_1 = "high_phone:updateTwitterUserData"
function L2_1()
  local L0_2, L1_2, L2_2
  L0_2 = Config
  L0_2 = L0_2.FrameworkFunctions
  L0_2 = L0_2.triggerCallback
  L1_2 = "high_phone:getTwitterUserData"
  function L2_2(A0_3)
    local L1_3, L2_3
    L1_3 = SendNUIMessage
    L2_3 = {}
    L2_3.action = "updateTwitterUserData"
    L2_3.player = A0_3
    L1_3(L2_3)
  end
  L0_2(L1_2, L2_2)
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNetEvent
L1_1 = "high_phone:updateTweets"
L0_1(L1_1)
L0_1 = AddEventHandler
L1_1 = "high_phone:updateTweets"
function L2_1()
  local L0_2, L1_2, L2_2
  L0_2 = Config
  L0_2 = L0_2.FrameworkFunctions
  L0_2 = L0_2.triggerCallback
  L1_2 = "high_phone:getTweets"
  function L2_2(A0_3)
    local L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3
    L1_3 = ipairs
    L2_3 = A0_3.tweets
    L1_3, L2_3, L3_3, L4_3 = L1_3(L2_3)
    for L5_3, L6_3 in L1_3, L2_3, L3_3, L4_3 do
      L7_3 = L6_3.authorrank
      if nil ~= L7_3 then
        L7_3 = Config
        L7_3 = L7_3.TwitterRanks
        L8_3 = L6_3.authorrank
        L7_3 = L7_3[L8_3]
        if L7_3 then
          goto lbl_17
        end
      end
      L7_3 = Config
      L7_3 = L7_3.TwitterRanks
      L7_3 = L7_3.default
      ::lbl_17::
      L6_3.authorrank = L7_3
      L7_3 = A0_3.userData
      if nil ~= L7_3 then
        L7_3 = has_value
        L8_3 = json
        L8_3 = L8_3.decode
        L9_3 = L6_3.likers
        L8_3 = L8_3(L9_3)
        L9_3 = A0_3.userData
        L9_3 = L9_3.email
        L7_3 = L7_3(L8_3, L9_3)
        L6_3.liked = L7_3
      end
      L7_3 = {}
      L6_3.replies = L7_3
      L7_3 = ipairs
      L8_3 = A0_3.tweets
      L7_3, L8_3, L9_3, L10_3 = L7_3(L8_3)
      for L11_3, L12_3 in L7_3, L8_3, L9_3, L10_3 do
        L13_3 = L12_3.reply
        if L13_3 then
          L13_3 = L12_3.reply
          L14_3 = L6_3.id
          if L13_3 == L14_3 then
            L13_3 = L12_3.authorrank
            if nil ~= L13_3 then
              L13_3 = Config
              L13_3 = L13_3.TwitterRanks
              L14_3 = L12_3.authorrank
              L13_3 = L13_3[L14_3]
              if L13_3 then
                goto lbl_56
              end
            end
            L13_3 = Config
            L13_3 = L13_3.TwitterRanks
            L13_3 = L13_3.default
            ::lbl_56::
            L12_3.authorrank = L13_3
            L13_3 = A0_3.userData
            if nil ~= L13_3 then
              L13_3 = has_value
              L14_3 = json
              L14_3 = L14_3.decode
              L15_3 = L12_3.likers
              L14_3 = L14_3(L15_3)
              L15_3 = A0_3.userData
              L15_3 = L15_3.email
              L13_3 = L13_3(L14_3, L15_3)
              L12_3.liked = L13_3
            end
            L13_3 = table
            L13_3 = L13_3.insert
            L14_3 = L6_3.replies
            L15_3 = L12_3
            L13_3(L14_3, L15_3)
          end
        end
      end
      L7_3 = table
      L7_3 = L7_3.sort
      L8_3 = L6_3.replies
      function L9_3(A0_4, A1_4)
        local L2_4, L3_4
        L2_4 = A0_4.time
        L3_4 = A1_4.time
        L2_4 = L2_4 < L3_4
        return L2_4
      end
      L7_3(L8_3, L9_3)
    end
    L1_3 = table
    L1_3 = L1_3.sort
    L2_3 = A0_3.tweets
    function L3_3(A0_4, A1_4)
      local L2_4, L3_4
      L2_4 = A0_4.time
      L3_4 = A1_4.time
      L2_4 = L2_4 > L3_4
      return L2_4
    end
    L1_3(L2_3, L3_3)
    L1_3 = SendNUIMessage
    L2_3 = {}
    L2_3.action = "updateTweets"
    L3_3 = A0_3.tweets
    L2_3.tweets = L3_3
    L1_3(L2_3)
  end
  L0_2(L1_2, L2_2)
end
L0_1(L1_1, L2_1)
L0_1 = RegisterNetEvent
L1_1 = "high_phone:updateTwitter"
L0_1(L1_1)
L0_1 = AddEventHandler
L1_1 = "high_phone:updateTwitter"
function L2_1()
  local L0_2, L1_2
  L0_2 = TriggerEvent
  L1_2 = "high_phone:updateTwitterUserData"
  L0_2(L1_2)
  L0_2 = TriggerEvent
  L1_2 = "high_phone:updateTweets"
  L0_2(L1_2)
end
L0_1(L1_1, L2_1)
L0_1 = Config
L0_1 = L0_1.Commands
L0_1 = L0_1.twitter_rank
L0_1 = L0_1.enabled
if L0_1 then
  L0_1 = TriggerEvent
  L1_1 = "chat:addSuggestion"
  L2_1 = "/"
  L3_1 = Config
  L3_1 = L3_1.Commands
  L3_1 = L3_1.twitter_rank
  L3_1 = L3_1.name
  L2_1 = L2_1 .. L3_1
  L3_1 = Config
  L3_1 = L3_1.Commands
  L3_1 = L3_1.twitter_rank
  L3_1 = L3_1.suggestion_label
  L4_1 = Config
  L4_1 = L4_1.Commands
  L4_1 = L4_1.twitter_rank
  L4_1 = L4_1.args
  L0_1(L1_1, L2_1, L3_1, L4_1)
end
