-- Framework functions
FOB = nil -- Do not rename this variable! And if your framework doesn't have shared objects, keep and set this variable to true!
TriggerEvent(Config.SharedObject, function(obj) FOB = obj end)

if(not IsDuplicityVersion()) then
    Citizen.CreateThread(function()
        while FOB == nil do
            TriggerEvent(Config.SharedObject, function(obj) FOB = obj end)
            Citizen.Wait(10)
        end
    end)
end

Config.Events = {
    playerLoaded = "esx:playerLoaded", -- player loaded server-side event, requires a player source as the 1st argument.
    playerDropped = "esx:playerDropped", -- player disconnected server-side event, requires a player source as the 1st argument.
    updateJob = "esx:setJob" -- player job updated server-side event, requires a player source as the 1st argument.
}

Config.PlayersTable = "users" -- Database players table.
Config.IdentifierColumn = "identifier" -- In players table, the main player identifier column.
Config.Invoices = {
    enabled = true,
    table = "billing", -- Table's name that contains all the bills [invoices]
    columns = {
        id = "id", -- ID column
        owner = "identifier", -- Player's identifier that received the invoice column
        label = "label", -- Invoice label [title or reason] column
        amount = "amount" -- Price/amount of the invoice column
    }
}

Config.FrameworkFunctions = {
    -- Client-side trigger callback
    triggerCallback = function(name, cb, ...)
        FOB.TriggerServerCallback(name, cb, ...)
    end,
    
    -- Server-side register callback
    registerCallback = function(name, cb)
        FOB.RegisterServerCallback(name, cb)
    end,

    -- Server-side get players function
    getPlayers = function()
        return FOB.GetPlayers()
    end,

    -- Client-side get closest player
    getClosestPlayer = function()
        return FOB.Game.GetClosestPlayer()
    end,

    -- Server-side get player data
    getPlayer = function(source) 
        local self = {}
        local player = FOB.GetPlayerFromId(source)

        if(player ~= nil) then
            self.source = source
            self.identifier = player.identifier
            self.group = player.getGroup()

            self.job = player.job
            self.jobName = player.job.name
            self.jobGrade = player.job.grade
            -- REMOVE THE -- IN FRONT OF self.onDuty IF YOU WANT TO CHECK IF THE PLAYER IS ON DUTY/IN SERVICE BEFORE SENDING HIM JOB MESSAGES/CALLS.
            --self.onDuty = player.job.service == 1 or false
            self.money = {cash = player.getMoney(), bank = player.getAccount("bank").money}
            self.number = Players[source] ~= nil and Players[source].number or nil

            self.getIdentity = function()                
                local data = MySQL.Sync.fetchAll("SELECT firstname, lastname FROM " .. Config.PlayersTable .. " WHERE " .. Config.IdentifierColumn .. " = @identifier", {["@identifier"] = self.identifier})
                if(data[1] ~= nil) then
                    return {firstname = data[1].firstname ~= nil and data[1].firstname or "", lastname = data[1].lastname ~= nil and data[1].lastname or ""}
                end
                return {firstname = "", lastname = ""}
            end

            self.addBankMoney = function(amount) 
                player.addAccountMoney("bank", amount)
            end
            self.addCash = function(amount) 
                player.addMoney(amount)
            end
            self.removeBankMoney = function(amount) 
                player.removeAccountMoney("bank", amount)
            end
            self.removeCash = function(amount) 
                player.removeMoney(amount)
            end

            self.getItemCount = function(item)
                return player.getInventoryItem(item).count
            end

            return self
        end

        return nil
    end,

    -- Server-side get player data by identifier
    getPlayerByIdentifier = function(identifier)
        local player = FOB.GetPlayerFromIdentifier(identifier) -- Only replace this function
        if(player ~= nil) then
            return Config.FrameworkFunctions.getPlayer(player.source) -- And replace this player.source with player's source, function requires a player ID.
        end

        return nil
    end
}

Config.CustomCallbacks = {
    -- Advertisments app
    ["postAd"] = function(data)
        TriggerServerEvent("high_phone:postAd", data.title, data.content, data.image, data.data)
    end,
    ["deleteAd"] = function(data)
        TriggerServerEvent("high_phone:deleteAd", data.id)
    end,
    -- Twitter app
    ["postTweet"] = function(data)
        TriggerServerEvent("high_phone:postTweet", data.title, data.content, data.image)
    end,
    ["deleteTweet"] = function(data)
        TriggerServerEvent("high_phone:deleteTweet", data.id)
    end,
    ["postReply"] = function(data)
        TriggerServerEvent("high_phone:postReply", data.id, data.content)
    end,
    -- Messages app
    ["sendMessage"] = function(data)
        TriggerServerEvent("high_phone:sendMessage", data.number, data.content, data.attachments, data.time) -- data.time is for accurate saving of time of the messages.
    end,
    -- Mail app
    ["sendMail"] = function(data)
        if(not data.reply) then
            TriggerServerEvent("high_phone:sendMail", data.recipients, data.subject, data.content, data.attachments)
        else
            TriggerServerEvent("high_phone:sendMailReply", data.reply, data.recipients, data.subject, data.content, data.attachments)
        end
    end,
    -- Darkchat app
    ["sendDarkMessage"] = function(data)
        TriggerServerEvent("high_phone:sendDarkMessage", data.id, data.content, data.attachments, data.time) -- data.time is for accurate saving of time of the messages.
    end,
    -- Phone app
    ["callNumber"] = function(data, cb)
        Config.FrameworkFunctions.triggerCallback("high_phone:callNumber", function(response)
            cb(response) -- If response is "SUCCESS", the call screen will slide out. IMPORTANT TO CALLBACK SOMETHING!
            if(response == "SUCCESS") then
                DoPhoneAnimation('cellphone_text_to_call') -- Global function, play any animation from library cellphone@
                onCall = true -- Global variable, set it to true if in a call.
            end
        end, data.number, data.anonymous)
    end,
    -- Contacts app
    ["createContact"] = function(data, cb)
        Config.FrameworkFunctions.triggerCallback("high_phone:createContact", function(id)
            cb(id)
        end, data.number, data.name, data.photo, data.tag)
    end,
    -- Bank app
    ["transferMoney"] = function(data, cb)
        Config.FrameworkFunctions.triggerCallback("high_phone:transferMoney", function(response)
            cb(response) -- If response is "SUCCESS", a message saying that the transfer was successful will be shown. IMPORTANT TO CALLBACK SOMETHING!
        end, Config.TransferType == 1 and tonumber(data.id) or data.id, tonumber(data.amount), data.purpose)
    end,
    ["requestMoney"] = function(data, cb)
        Config.FrameworkFunctions.triggerCallback("high_phone:requestMoney", function(response)
            cb(response) -- If response is "SUCCESS", a message saying that the transfer was successful will be shown. IMPORTANT TO CALLBACK SOMETHING!
        end, tonumber(data.id), tonumber(data.amount), data.purpose)
    end,
    ["payBill"] = function(data, cb)
        Config.FrameworkFunctions.triggerCallback('esx_billing:payBill', function()
            cb() -- esx_billing is so lame..
        end, data.id)
    end,
    ["cancelBill"] = function(data, cb)
        Config.FrameworkFunctions.triggerCallback("high_phone:cancelBill", function(response)
            cb(response) -- If response is "SUCCESS", a message saying that the cancelation was successful will be shown. IMPORTANT TO CALLBACK SOMETHING!
        end, data.id)
    end,
}

Config.Commands = {
    -- Do not rename the index, only change the name field if you want to change the command name.
    ["twitter_rank"] = {
        enabled = true,
        name = "settwitterrank",
        suggestion_label = "Set rank for a twitter account",
        args = {{
            name = "Email address",
            help = "Twitter user email address"
        }, {
            name = "Rank",
            help = "Twitter rank name"
        }},
        notifications = {
            ["error_prefix"] = "^1SYSTEM",
            ["success_prefix"] = "^2SYSTEM",
            ["email_not_specified"] = "You have to specify a twitter email address!",
            ["group_not_specified"] = "You have to specify a twitter group!",
            ["no_permission"] = "No permission for this command!",
            ["account_doesnt_exist"] = "A twitter account with this email doesn't exist!",
            ["group_successfully_set"] = "You've set the group on {email} to {rank}",
            ["rank_non_existant"] = "Rank {rank} doesn't exist!"
        }
    }
}