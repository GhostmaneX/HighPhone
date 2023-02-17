local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1
L0_1 = {}
L1_1 = {}
L2_1 = {}
L3_1 = Config
L3_1 = L3_1.FrameworkFunctions
L3_1 = L3_1.registerCallback
L4_1 = "high_phone:getBankData"
function L5_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L2_2 = Config
  L2_2 = L2_2.FrameworkFunctions
  L2_2 = L2_2.getPlayer
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  L3_2 = Config
  L3_2 = L3_2.TransferType
  if 2 == L3_2 then
    L3_2 = Players
    L4_2 = L2_2.source
    L3_2 = L3_2[L4_2]
    if L3_2 then
      L3_2 = Players
      L4_2 = L2_2.source
      L3_2 = L3_2[L4_2]
      L3_2 = L3_2.iban
      if L3_2 then
        goto lbl_22
      end
    end
  end
  L3_2 = nil
  ::lbl_22::
  L4_2 = MySQL
  L4_2 = L4_2.Async
  L4_2 = L4_2.fetchAll
  L5_2 = "SELECT * FROM phone_transactions WHERE `from` = @identifier OR `to` = @identifier"
  L6_2 = {}
  L7_2 = L2_2.identifier
  L6_2["@identifier"] = L7_2
  function L7_2(A0_3)
    local L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3, L12_3, L13_3, L14_3, L15_3
    L1_3 = {}
    L2_3 = 1
    L3_3 = 5
    L4_3 = 1
    for L5_3 = L2_3, L3_3, L4_3 do
      L6_3 = 6
      L6_3 = L6_3 - L5_3
      L1_3[L6_3] = 0
      L6_3 = pairs
      L7_3 = A0_3
      L6_3, L7_3, L8_3, L9_3 = L6_3(L7_3)
      for L10_3, L11_3 in L6_3, L7_3, L8_3, L9_3 do
        L12_3 = os
        L12_3 = L12_3.date
        L13_3 = "*t"
        L14_3 = os
        L14_3 = L14_3.time
        L14_3 = L14_3()
        L15_3 = L5_3 - 1
        L15_3 = L15_3 * 24
        L15_3 = L15_3 * 60
        L15_3 = L15_3 * 60
        L14_3 = L14_3 - L15_3
        L12_3 = L12_3(L13_3, L14_3)
        L12_3 = L12_3.day
        L13_3 = os
        L13_3 = L13_3.date
        L14_3 = "*t"
        L15_3 = L11_3.time
        L13_3 = L13_3(L14_3, L15_3)
        L13_3 = L13_3.day
        if L13_3 == L12_3 then
          L13_3 = 6
          L13_3 = L13_3 - L5_3
          L14_3 = 6
          L14_3 = L14_3 - L5_3
          L14_3 = L1_3[L14_3]
          L15_3 = L11_3.amount
          L14_3 = L14_3 + L15_3
          L1_3[L13_3] = L14_3
        end
      end
    end
    L2_3 = L2_2.getIdentity
    L2_3 = L2_3()
    L3_3 = A1_2
    L4_3 = {}
    L5_3 = {}
    L6_3 = {}
    L6_3.id = 1
    L7_3 = L2_3.firstname
    L8_3 = " "
    L9_3 = L2_3.lastname
    L7_3 = L7_3 .. L8_3 .. L9_3
    L6_3.holder = L7_3
    L6_3.number = "1234 5678 9123 4567"
    L6_3.date = "01/25"
    L5_3[1] = L6_3
    L4_3.cards = L5_3
    L4_3.statement = L1_3
    L5_3 = L3_2
    L4_3.iban = L5_3
    L5_3 = L2_2.money
    L5_3 = L5_3.bank
    L4_3.balance = L5_3
    L3_3(L4_3)
  end
  L4_2(L5_2, L6_2, L7_2)
end
L3_1(L4_1, L5_1)
L3_1 = Config
L3_1 = L3_1.FrameworkFunctions
L3_1 = L3_1.registerCallback
L4_1 = "high_phone:getInvoices"
function L5_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2
  L2_2 = Config
  L2_2 = L2_2.FrameworkFunctions
  L2_2 = L2_2.getPlayer
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  L3_2 = Config
  L3_2 = L3_2.Invoices
  L3_2 = L3_2.enabled
  if L3_2 then
    L3_2 = MySQL
    L3_2 = L3_2.Async
    L3_2 = L3_2.fetchAll
    L4_2 = "SELECT * FROM "
    L5_2 = Config
    L5_2 = L5_2.Invoices
    L5_2 = L5_2.table
    L6_2 = " WHERE `"
    L7_2 = Config
    L7_2 = L7_2.Invoices
    L7_2 = L7_2.columns
    L7_2 = L7_2.owner
    L8_2 = "` = @identifier ORDER BY `"
    L9_2 = Config
    L9_2 = L9_2.Invoices
    L9_2 = L9_2.columns
    L9_2 = L9_2.id
    L10_2 = "` DESC"
    L4_2 = L4_2 .. L5_2 .. L6_2 .. L7_2 .. L8_2 .. L9_2 .. L10_2
    L5_2 = {}
    L6_2 = L2_2.identifier
    L5_2["@identifier"] = L6_2
    function L6_2(A0_3)
      local L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3
      L1_3 = {}
      L2_3 = pairs
      L3_3 = A0_3
      L2_3, L3_3, L4_3, L5_3 = L2_3(L3_3)
      for L6_3, L7_3 in L2_3, L3_3, L4_3, L5_3 do
        L8_3 = table
        L8_3 = L8_3.insert
        L9_3 = L1_3
        L10_3 = {}
        L11_3 = Config
        L11_3 = L11_3.Invoices
        L11_3 = L11_3.columns
        L11_3 = L11_3.id
        L11_3 = L7_3[L11_3]
        L10_3.id = L11_3
        L11_3 = Config
        L11_3 = L11_3.Invoices
        L11_3 = L11_3.columns
        L11_3 = L11_3.label
        L11_3 = L7_3[L11_3]
        L10_3.title = L11_3
        L11_3 = Config
        L11_3 = L11_3.Invoices
        L11_3 = L11_3.columns
        L11_3 = L11_3.amount
        L11_3 = L7_3[L11_3]
        L10_3.amount = L11_3
        L11_3 = Config
        L11_3 = L11_3.EnableBillCancelling
        L10_3.cancellable = L11_3
        L8_3(L9_3, L10_3)
      end
      L2_3 = A1_2
      L3_3 = json
      L3_3 = L3_3.encode
      L4_3 = L1_3
      L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3 = L3_3(L4_3)
      L2_3(L3_3, L4_3, L5_3, L6_3, L7_3, L8_3, L9_3, L10_3, L11_3)
    end
    L3_2(L4_2, L5_2, L6_2)
  else
    L3_2 = A1_2
    L4_2 = "[]"
    L3_2(L4_2)
  end
end
L3_1(L4_1, L5_1)
L3_1 = Config
L3_1 = L3_1.FrameworkFunctions
L3_1 = L3_1.registerCallback
L4_1 = "high_phone:acceptRequest"
function L5_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2
  L3_2 = Config
  L3_2 = L3_2.FrameworkFunctions
  L3_2 = L3_2.getPlayer
  L4_2 = A0_2
  L3_2 = L3_2(L4_2)
  L4_2 = L2_1
  L4_2 = L4_2[A2_2]
  if not L4_2 then
    L4_2 = A1_2
    L5_2 = Config
    L5_2 = L5_2.Languages
    L6_2 = Config
    L6_2 = L6_2.Language
    L5_2 = L5_2[L6_2]
    L5_2 = L5_2.notifications
    L5_2 = L5_2.requestdoesntexist
    return L4_2(L5_2)
  end
  L4_2 = Config
  L4_2 = L4_2.FrameworkFunctions
  L4_2 = L4_2.getPlayer
  L5_2 = L2_1
  L5_2 = L5_2[A2_2]
  L5_2 = L5_2.senderId
  L4_2 = L4_2(L5_2)
  if not L4_2 then
    L5_2 = A1_2
    L6_2 = Config
    L6_2 = L6_2.Languages
    L7_2 = Config
    L7_2 = L7_2.Language
    L6_2 = L6_2[L7_2]
    L6_2 = L6_2.notifications
    L6_2 = L6_2.playernotonlineanymore
    return L5_2(L6_2)
  end
  L5_2 = L3_2.money
  L5_2 = L5_2.bank
  L6_2 = L2_1
  L6_2 = L6_2[A2_2]
  L6_2 = L6_2.amount
  if L5_2 >= L6_2 then
    L5_2 = L3_2.removeBankMoney
    L6_2 = L2_1
    L6_2 = L6_2[A2_2]
    L6_2 = L6_2.amount
    L5_2(L6_2)
    L5_2 = L4_2.addBankMoney
    L6_2 = L2_1
    L6_2 = L6_2[A2_2]
    L6_2 = L6_2.amount
    L5_2(L6_2)
    L5_2 = MySQL
    L5_2 = L5_2.Async
    L5_2 = L5_2.execute
    L6_2 = "INSERT INTO phone_transactions (`from`, `to`, `amount`, `time`, `reason`) VALUES (@from, @to, @amount, @time, @reason)"
    L7_2 = {}
    L8_2 = L3_2.identifier
    L7_2["@from"] = L8_2
    L8_2 = L4_2.identifier
    L7_2["@to"] = L8_2
    L8_2 = L2_1
    L8_2 = L8_2[A2_2]
    L8_2 = L8_2.amount
    L7_2["@amount"] = L8_2
    L8_2 = os
    L8_2 = L8_2.time
    L8_2 = L8_2()
    L7_2["@time"] = L8_2
    L8_2 = L2_1
    L8_2 = L8_2[A2_2]
    L8_2 = L8_2.reason
    L7_2["@reason"] = L8_2
    function L8_2()
      local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3, L8_3
      L0_3 = Config
      L0_3 = L0_3.TransactionWebhooks
      if L0_3 then
        L0_3 = Config
        L0_3 = L0_3.SendWebhook
        L1_3 = Config
        L1_3 = L1_3.TransactionWebhook
        L2_3 = Config
        L2_3 = L2_3.Languages
        L3_3 = Config
        L3_3 = L3_3.Language
        L2_3 = L2_3[L3_3]
        L2_3 = L2_3.newtransactionwebhook
        L2_3 = L2_3.title
        L3_3 = replace_vars
        L4_3 = Config
        L4_3 = L4_3.Languages
        L5_3 = Config
        L5_3 = L5_3.Language
        L4_3 = L4_3[L5_3]
        L4_3 = L4_3.newtransactionwebhook
        L4_3 = L4_3.description
        L5_3 = {}
        L6_3 = GetPlayerName
        L7_3 = A0_2
        L6_3 = L6_3(L7_3)
        L5_3.senderName = L6_3
        L6_3 = A0_2
        L5_3.senderId = L6_3
        L6_3 = GetPlayerName
        L8_3 = A2_2
        L7_3 = L2_1
        L7_3 = L7_3[L8_3]
        L7_3 = L7_3.senderId
        L6_3 = L6_3(L7_3)
        L5_3.receiverName = L6_3
        L7_3 = A2_2
        L6_3 = L2_1
        L6_3 = L6_3[L7_3]
        L6_3 = L6_3.senderId
        L5_3.receiverId = L6_3
        L7_3 = A2_2
        L6_3 = L2_1
        L6_3 = L6_3[L7_3]
        L6_3 = L6_3.reason
        L5_3.reason = L6_3
        L7_3 = A2_2
        L6_3 = L2_1
        L6_3 = L6_3[L7_3]
        L6_3 = L6_3.amount
        L5_3.amount = L6_3
        L3_3 = L3_3(L4_3, L5_3)
        L4_3 = 2067276
        L5_3 = image
        L6_3 = Config
        L6_3 = L6_3.Languages
        L7_3 = Config
        L7_3 = L7_3.Language
        L6_3 = L6_3[L7_3]
        L6_3 = L6_3.newtransactionwebhook
        L6_3 = L6_3.footer
        L0_3(L1_3, L2_3, L3_3, L4_3, L5_3, L6_3)
      end
    end
    L5_2(L6_2, L7_2, L8_2)
    L5_2 = TriggerClientEvent
    L6_2 = "high_phone:updateBank"
    L7_2 = A0_2
    L5_2(L6_2, L7_2)
    L5_2 = TriggerClientEvent
    L6_2 = "high_phone:updateBank"
    L7_2 = L2_1
    L7_2 = L7_2[A2_2]
    L7_2 = L7_2.senderId
    L5_2(L6_2, L7_2)
    L5_2 = TriggerClientEvent
    L6_2 = "high_phone:sendNotification"
    L7_2 = L2_1
    L7_2 = L7_2[A2_2]
    L7_2 = L7_2.senderId
    L8_2 = "Bank"
    L9_2 = replace_vars
    L10_2 = Config
    L10_2 = L10_2.Languages
    L11_2 = Config
    L11_2 = L11_2.Language
    L10_2 = L10_2[L11_2]
    L10_2 = L10_2.notifications
    L10_2 = L10_2.receivedmoney
    L11_2 = {}
    L12_2 = L2_1
    L12_2 = L12_2[A2_2]
    L12_2 = L12_2.amount
    L11_2.amount = L12_2
    L11_2.senderId = A0_2
    L12_2 = L2_1
    L12_2 = L12_2[A2_2]
    L12_2 = L12_2.reason
    L11_2.reason = L12_2
    L9_2 = L9_2(L10_2, L11_2)
    L10_2 = 3000
    L5_2(L6_2, L7_2, L8_2, L9_2, L10_2)
    L5_2 = A1_2
    L6_2 = "SUCCESS"
    L5_2(L6_2)
  else
    L5_2 = A1_2
    L6_2 = Config
    L6_2 = L6_2.Languages
    L7_2 = Config
    L7_2 = L7_2.Language
    L6_2 = L6_2[L7_2]
    L6_2 = L6_2.notifications
    L6_2 = L6_2.notenoughmoney
    L5_2(L6_2)
  end
end
L3_1(L4_1, L5_1)
L3_1 = Config
L3_1 = L3_1.FrameworkFunctions
L3_1 = L3_1.registerCallback
L4_1 = "high_phone:requestMoney"
function L5_1(A0_2, A1_2, A2_2, A3_2, A4_2)
  local L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2
  L5_2 = L0_1
  L5_2 = L5_2[A0_2]
  if nil == L5_2 then
    if A0_2 == A2_2 then
      L5_2 = A1_2
      L6_2 = Config
      L6_2 = L6_2.Languages
      L7_2 = Config
      L7_2 = L7_2.Language
      L6_2 = L6_2[L7_2]
      L6_2 = L6_2.notifications
      L6_2 = L6_2.selfrequest
      return L5_2(L6_2)
    end
    if A3_2 < 0 then
      return
    end
    L5_2 = Config
    L5_2 = L5_2.FrameworkFunctions
    L5_2 = L5_2.getPlayer
    L6_2 = A0_2
    L5_2 = L5_2(L6_2)
    L6_2 = Config
    L6_2 = L6_2.FrameworkFunctions
    L6_2 = L6_2.getPlayer
    L7_2 = A2_2
    L6_2 = L6_2(L7_2)
    if L6_2 then
      L7_2 = math
      L7_2 = L7_2.randomseed
      L8_2 = os
      L8_2 = L8_2.time
      L8_2 = L8_2()
      L8_2 = A0_2 + L8_2
      L7_2(L8_2)
      L7_2 = "REQ-"
      L8_2 = math
      L8_2 = L8_2.random
      L9_2 = 111111
      L10_2 = 999999
      L8_2 = L8_2(L9_2, L10_2)
      L7_2 = L7_2 .. L8_2
      L8_2 = L2_1
      L9_2 = {}
      L9_2.id = L7_2
      L10_2 = GetPlayerName
      L11_2 = A0_2
      L10_2 = L10_2(L11_2)
      L9_2.senderName = L10_2
      L9_2.senderId = A0_2
      L9_2.amount = A3_2
      L9_2.reason = A4_2
      L8_2[L7_2] = L9_2
      L8_2 = TriggerClientEvent
      L9_2 = "high_phone:addMoneyRequest"
      L10_2 = A2_2
      L11_2 = json
      L11_2 = L11_2.encode
      L12_2 = L2_1
      L12_2 = L12_2[L7_2]
      L11_2, L12_2, L13_2, L14_2, L15_2, L16_2 = L11_2(L12_2)
      L8_2(L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2, L16_2)
      L8_2 = TriggerClientEvent
      L9_2 = "high_phone:sendNotification"
      L10_2 = A2_2
      L11_2 = "Bank"
      L12_2 = replace_vars
      L13_2 = Config
      L13_2 = L13_2.Languages
      L14_2 = Config
      L14_2 = L14_2.Language
      L13_2 = L13_2[L14_2]
      L13_2 = L13_2.notifications
      L13_2 = L13_2.requestedmoney
      L14_2 = {}
      L14_2.amount = A3_2
      L14_2.requesterId = A0_2
      L15_2 = GetPlayerName
      L16_2 = A0_2
      L15_2 = L15_2(L16_2)
      L14_2.requesterName = L15_2
      L14_2.reason = A4_2
      L12_2 = L12_2(L13_2, L14_2)
      L13_2 = 3000
      L8_2(L9_2, L10_2, L11_2, L12_2, L13_2)
      L8_2 = A1_2
      L9_2 = "SUCCESS"
      L8_2(L9_2)
      L8_2 = L0_1
      L8_2[A0_2] = A0_2
      L8_2 = Citizen
      L8_2 = L8_2.SetTimeout
      L9_2 = Config
      L9_2 = L9_2.MoneyRequestCooldown
      function L10_2()
        local L0_3, L1_3
        L1_3 = A0_2
        L0_3 = L0_1
        L0_3[L1_3] = nil
      end
      L8_2(L9_2, L10_2)
    else
      L7_2 = A1_2
      L8_2 = Config
      L8_2 = L8_2.Languages
      L9_2 = Config
      L9_2 = L9_2.Language
      L8_2 = L8_2[L9_2]
      L8_2 = L8_2.notifications
      L8_2 = L8_2.playernotonline
      L7_2(L8_2)
    end
  else
    L5_2 = A1_2
    L6_2 = Config
    L6_2 = L6_2.Languages
    L7_2 = Config
    L7_2 = L7_2.Language
    L6_2 = L6_2[L7_2]
    L6_2 = L6_2.notifications
    L6_2 = L6_2.requestcooldown
    L5_2(L6_2)
  end
end
L3_1(L4_1, L5_1)
L3_1 = Config
L3_1 = L3_1.EnableBillCancelling
if L3_1 then
  L3_1 = Config
  L3_1 = L3_1.FrameworkFunctions
  L3_1 = L3_1.registerCallback
  L4_1 = "high_phone:cancelBill"
  function L5_1(A0_2, A1_2, A2_2)
    local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2
    L3_2 = Config
    L3_2 = L3_2.FrameworkFunctions
    L3_2 = L3_2.getPlayer
    L4_2 = A0_2
    L3_2 = L3_2(L4_2)
    L4_2 = MySQL
    L4_2 = L4_2.Async
    L4_2 = L4_2.execute
    L5_2 = "DELETE FROM "
    L6_2 = Config
    L6_2 = L6_2.Invoices
    L6_2 = L6_2.table
    L7_2 = " WHERE "
    L8_2 = Config
    L8_2 = L8_2.Invoices
    L8_2 = L8_2.columns
    L8_2 = L8_2.id
    L9_2 = " = @id"
    L5_2 = L5_2 .. L6_2 .. L7_2 .. L8_2 .. L9_2
    L6_2 = {}
    L6_2["@id"] = A2_2
    function L7_2(A0_3)
      local L1_3, L2_3
      if A0_3 >= 1 then
        L1_3 = A1_2
        L2_3 = "SUCCESS"
        L1_3(L2_3)
      end
    end
    L4_2(L5_2, L6_2, L7_2)
  end
  L3_1(L4_1, L5_1)
end
L3_1 = Config
L3_1 = L3_1.FrameworkFunctions
L3_1 = L3_1.registerCallback
L4_1 = "high_phone:getBalance"
function L5_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2
  L2_2 = Config
  L2_2 = L2_2.FrameworkFunctions
  L2_2 = L2_2.getPlayer
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  L3_2 = L2_2.money
  L3_2 = L3_2.bank
  L4_2 = A1_2
  L5_2 = L3_2
  L4_2(L5_2)
end
L3_1(L4_1, L5_1)
L3_1 = Config
L3_1 = L3_1.FrameworkFunctions
L3_1 = L3_1.registerCallback
L4_1 = "high_phone:transferMoney"
function L5_1(A0_2, A1_2, A2_2, A3_2, A4_2)
  local L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2, L12_2, L13_2, L14_2, L15_2
  L5_2 = L0_1
  L5_2 = L5_2[A0_2]
  if L5_2 then
    L5_2 = A1_2
    L6_2 = Config
    L6_2 = L6_2.Languages
    L7_2 = Config
    L7_2 = L7_2.Language
    L6_2 = L6_2[L7_2]
    L6_2 = L6_2.notifications
    L6_2 = L6_2.transfercooldown
    return L5_2(L6_2)
  end
  if A3_2 < 0 then
    return
  end
  L5_2 = Config
  L5_2 = L5_2.FrameworkFunctions
  L5_2 = L5_2.getPlayer
  L6_2 = A0_2
  L5_2 = L5_2(L6_2)
  L6_2 = nil
  L7_2 = nil
  L8_2 = Config
  L8_2 = L8_2.TransferType
  if 1 == L8_2 then
    L8_2 = Config
    L8_2 = L8_2.FrameworkFunctions
    L8_2 = L8_2.getPlayer
    L9_2 = A2_2
    L8_2 = L8_2(L9_2)
    L7_2 = L8_2
    if A0_2 == A2_2 then
      L8_2 = A1_2
      L9_2 = Config
      L9_2 = L9_2.Languages
      L10_2 = Config
      L10_2 = L10_2.Language
      L9_2 = L9_2[L10_2]
      L9_2 = L9_2.notifications
      L9_2 = L9_2.selftransfer
      return L8_2(L9_2)
    end
  else
    L8_2 = Config
    L8_2 = L8_2.TransferType
    if 2 == L8_2 then
      L8_2 = getUserByBank
      L9_2 = A2_2
      L8_2 = L8_2(L9_2)
      L6_2 = L8_2
      if L6_2 then
        L8_2 = Config
        L8_2 = L8_2.FrameworkFunctions
        L8_2 = L8_2.getPlayerByIdentifier
        L9_2 = Config
        L9_2 = L9_2.IdentifierColumn
        L9_2 = L6_2[L9_2]
        L8_2 = L8_2(L9_2)
        L7_2 = L8_2
        L8_2 = Config
        L8_2 = L8_2.IdentifierColumn
        L8_2 = L6_2[L8_2]
        L9_2 = L5_2.identifier
        if L8_2 == L9_2 then
          L8_2 = A1_2
          L9_2 = Config
          L9_2 = L9_2.Languages
          L10_2 = Config
          L10_2 = L10_2.Language
          L9_2 = L9_2[L10_2]
          L9_2 = L9_2.notifications
          L9_2 = L9_2.selftransfer
          return L8_2(L9_2)
        end
      else
        L8_2 = A1_2
        L9_2 = Config
        L9_2 = L9_2.Languages
        L10_2 = Config
        L10_2 = L10_2.Language
        L9_2 = L9_2[L10_2]
        L9_2 = L9_2.notifications
        L9_2 = L9_2.receivernonexistant
        return L8_2(L9_2)
      end
    end
  end
  if L7_2 then
    L8_2 = L5_2.money
    L8_2 = L8_2.bank
    if A3_2 <= L8_2 then
      L8_2 = L5_2.removeBankMoney
      L9_2 = A3_2
      L8_2(L9_2)
      L8_2 = L7_2.addBankMoney
      L9_2 = A3_2
      L8_2(L9_2)
      L8_2 = MySQL
      L8_2 = L8_2.Async
      L8_2 = L8_2.execute
      L9_2 = "INSERT INTO phone_transactions (`from`, `to`, `amount`, `time`, `reason`) VALUES (@from, @to, @amount, @time, @reason)"
      L10_2 = {}
      L11_2 = L5_2.identifier
      L10_2["@from"] = L11_2
      L11_2 = L7_2.identifier
      L10_2["@to"] = L11_2
      L10_2["@amount"] = A3_2
      L11_2 = os
      L11_2 = L11_2.time
      L11_2 = L11_2()
      L10_2["@time"] = L11_2
      L10_2["@reason"] = A4_2
      function L11_2()
        local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3
        L0_3 = Config
        L0_3 = L0_3.TransactionWebhooks
        if L0_3 then
          L0_3 = Config
          L0_3 = L0_3.SendWebhook
          L1_3 = Config
          L1_3 = L1_3.TransactionWebhook
          L2_3 = Config
          L2_3 = L2_3.Languages
          L3_3 = Config
          L3_3 = L3_3.Language
          L2_3 = L2_3[L3_3]
          L2_3 = L2_3.newtransactionwebhook
          L2_3 = L2_3.title
          L3_3 = replace_vars
          L4_3 = Config
          L4_3 = L4_3.Languages
          L5_3 = Config
          L5_3 = L5_3.Language
          L4_3 = L4_3[L5_3]
          L4_3 = L4_3.newtransactionwebhook
          L4_3 = L4_3.description
          L5_3 = {}
          L6_3 = GetPlayerName
          L7_3 = A0_2
          L6_3 = L6_3(L7_3)
          L5_3.senderName = L6_3
          L6_3 = A0_2
          L5_3.senderId = L6_3
          L6_3 = GetPlayerName
          L7_3 = L7_2.source
          L6_3 = L6_3(L7_3)
          L5_3.receiverName = L6_3
          L6_3 = A2_2
          L5_3.receiverId = L6_3
          L6_3 = A4_2
          L5_3.reason = L6_3
          L6_3 = A3_2
          L5_3.amount = L6_3
          L3_3 = L3_3(L4_3, L5_3)
          L4_3 = 2067276
          L5_3 = image
          L6_3 = Config
          L6_3 = L6_3.Languages
          L7_3 = Config
          L7_3 = L7_3.Language
          L6_3 = L6_3[L7_3]
          L6_3 = L6_3.newtransactionwebhook
          L6_3 = L6_3.footer
          L0_3(L1_3, L2_3, L3_3, L4_3, L5_3, L6_3)
        end
      end
      L8_2(L9_2, L10_2, L11_2)
      L8_2 = TriggerClientEvent
      L9_2 = "high_phone:updateBank"
      L10_2 = A0_2
      L8_2(L9_2, L10_2)
      L8_2 = TriggerClientEvent
      L9_2 = "high_phone:updateBank"
      L10_2 = A2_2
      L8_2(L9_2, L10_2)
      L8_2 = TriggerClientEvent
      L9_2 = "high_phone:sendNotification"
      L10_2 = A2_2
      L11_2 = "Bank"
      L12_2 = replace_vars
      L13_2 = Config
      L13_2 = L13_2.Languages
      L14_2 = Config
      L14_2 = L14_2.Language
      L13_2 = L13_2[L14_2]
      L13_2 = L13_2.notifications
      L13_2 = L13_2.receivedmoney
      L14_2 = {}
      L14_2.amount = A3_2
      L14_2.senderId = A0_2
      L14_2.reason = A4_2
      L12_2 = L12_2(L13_2, L14_2)
      L13_2 = 3000
      L8_2(L9_2, L10_2, L11_2, L12_2, L13_2)
      L8_2 = A1_2
      L9_2 = "SUCCESS"
      L8_2(L9_2)
      L8_2 = L1_1
      L8_2[A0_2] = A0_2
      L8_2 = Citizen
      L8_2 = L8_2.SetTimeout
      L9_2 = Config
      L9_2 = L9_2.TransferCooldown
      function L10_2()
        local L0_3, L1_3
        L1_3 = A0_2
        L0_3 = L1_1
        L0_3[L1_3] = nil
      end
      L8_2(L9_2, L10_2)
    else
      L8_2 = A1_2
      L9_2 = Config
      L9_2 = L9_2.Languages
      L10_2 = Config
      L10_2 = L10_2.Language
      L9_2 = L9_2[L10_2]
      L9_2 = L9_2.notifications
      L9_2 = L9_2.notenoughmoney
      L8_2(L9_2)
    end
  elseif L6_2 then
    L8_2 = L5_2.money
    L8_2 = L8_2.bank
    if A3_2 <= L8_2 then
      L8_2 = L5_2.removeBankMoney
      L9_2 = A3_2
      L8_2(L9_2)
      L8_2 = L6_2.accounts
      if L8_2 then
        L8_2 = json
        L8_2 = L8_2.decode
        L9_2 = L6_2.accounts
        L8_2 = L8_2(L9_2)
        L9_2 = L8_2.bank
        L9_2 = L9_2 + A3_2
        L8_2.bank = L9_2
        L9_2 = MySQL
        L9_2 = L9_2.Async
        L9_2 = L9_2.execute
        L10_2 = "UPDATE "
        L11_2 = Config
        L11_2 = L11_2.PlayersTable
        L12_2 = " SET accounts = @newaccounts WHERE "
        L13_2 = Config
        L13_2 = L13_2.IdentifierColumn
        L14_2 = " = @identifier"
        L10_2 = L10_2 .. L11_2 .. L12_2 .. L13_2 .. L14_2
        L11_2 = {}
        L12_2 = Config
        L12_2 = L12_2.IdentifierColumn
        L12_2 = L6_2[L12_2]
        L11_2["@identifier"] = L12_2
        L12_2 = json
        L12_2 = L12_2.encode
        L13_2 = L8_2
        L12_2 = L12_2(L13_2)
        L11_2["@newaccounts"] = L12_2
        L9_2(L10_2, L11_2)
      else
        L8_2 = L6_2.bank
        if L8_2 then
          L8_2 = MySQL
          L8_2 = L8_2.Async
          L8_2 = L8_2.execute
          L9_2 = "UPDATE "
          L10_2 = Config
          L10_2 = L10_2.PlayersTable
          L11_2 = " SET bank = bank + "
          L12_2 = A3_2
          L13_2 = " WHERE "
          L14_2 = Config
          L14_2 = L14_2.IdentifierColumn
          L15_2 = " = @identifier"
          L9_2 = L9_2 .. L10_2 .. L11_2 .. L12_2 .. L13_2 .. L14_2 .. L15_2
          L10_2 = {}
          L11_2 = Config
          L11_2 = L11_2.IdentifierColumn
          L11_2 = L6_2[L11_2]
          L10_2["@identifier"] = L11_2
          L8_2(L9_2, L10_2)
        end
      end
      L8_2 = MySQL
      L8_2 = L8_2.Async
      L8_2 = L8_2.execute
      L9_2 = "INSERT INTO phone_transactions (`from`, `to`, `amount`, `time`, `reason`) VALUES (@from, @to, @amount, @time, @reason)"
      L10_2 = {}
      L11_2 = L5_2.identifier
      L10_2["@from"] = L11_2
      L11_2 = Config
      L11_2 = L11_2.IdentifierColumn
      L11_2 = L6_2[L11_2]
      L10_2["@to"] = L11_2
      L10_2["@amount"] = A3_2
      L11_2 = os
      L11_2 = L11_2.time
      L11_2 = L11_2()
      L10_2["@time"] = L11_2
      L10_2["@reason"] = A4_2
      function L11_2()
        local L0_3, L1_3, L2_3, L3_3, L4_3, L5_3, L6_3, L7_3
        L0_3 = Config
        L0_3 = L0_3.TransactionWebhooks
        if L0_3 then
          L0_3 = Config
          L0_3 = L0_3.SendWebhook
          L1_3 = Config
          L1_3 = L1_3.TransactionWebhook
          L2_3 = Config
          L2_3 = L2_3.Languages
          L3_3 = Config
          L3_3 = L3_3.Language
          L2_3 = L2_3[L3_3]
          L2_3 = L2_3.newtransactionwebhook
          L2_3 = L2_3.title
          L3_3 = replace_vars
          L4_3 = Config
          L4_3 = L4_3.Languages
          L5_3 = Config
          L5_3 = L5_3.Language
          L4_3 = L4_3[L5_3]
          L4_3 = L4_3.newtransactionwebhook
          L4_3 = L4_3.description
          L5_3 = {}
          L6_3 = GetPlayerName
          L7_3 = A0_2
          L6_3 = L6_3(L7_3)
          L5_3.senderName = L6_3
          L6_3 = A0_2
          L5_3.senderId = L6_3
          L6_3 = Config
          L6_3 = L6_3.Languages
          L6_3 = L6_3.en
          L6_3 = L6_3.unknown
          L5_3.receiverName = L6_3
          L6_3 = A2_2
          L5_3.receiverId = L6_3
          L6_3 = A4_2
          L5_3.reason = L6_3
          L6_3 = A3_2
          L5_3.amount = L6_3
          L3_3 = L3_3(L4_3, L5_3)
          L4_3 = 2067276
          L5_3 = image
          L6_3 = Config
          L6_3 = L6_3.Languages
          L7_3 = Config
          L7_3 = L7_3.Language
          L6_3 = L6_3[L7_3]
          L6_3 = L6_3.newtransactionwebhook
          L6_3 = L6_3.footer
          L0_3(L1_3, L2_3, L3_3, L4_3, L5_3, L6_3)
        end
      end
      L8_2(L9_2, L10_2, L11_2)
      L8_2 = TriggerClientEvent
      L9_2 = "high_phone:updateBank"
      L10_2 = A0_2
      L8_2(L9_2, L10_2)
      L8_2 = A1_2
      L9_2 = "SUCCESS"
      L8_2(L9_2)
    else
      L8_2 = A1_2
      L9_2 = Config
      L9_2 = L9_2.Languages
      L10_2 = Config
      L10_2 = L10_2.Language
      L9_2 = L9_2[L10_2]
      L9_2 = L9_2.notifications
      L9_2 = L9_2.notenoughmoney
      L8_2(L9_2)
    end
  else
    L8_2 = A1_2
    L9_2 = Config
    L9_2 = L9_2.Languages
    L10_2 = Config
    L10_2 = L10_2.Language
    L9_2 = L9_2[L10_2]
    L9_2 = L9_2.notifications
    L9_2 = L9_2.receivernonexistant
    L8_2(L9_2)
  end
end
L3_1(L4_1, L5_1)
