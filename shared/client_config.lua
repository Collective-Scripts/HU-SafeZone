
CollectiveC = {}
function CollectiveC.Notification(theType, message, duration)
    if Config.NotificationType.client == 'mythic_notify_default' then
        if theType == 1 then
            exports['mythic_notify']:SendAlert('success', message, duration)
        elseif theType == 2 then
            exports['mythic_notify']:SendAlert('inform', message, duration)
        elseif theType == 3 then
            exports['mythic_notify']:SendAlert('error', message, duration)
        end
    elseif Config.NotificationType.client == 'mythic_notify_old' then
        if theType == 1 then
            exports['mythic_notify']:DoCustomHudText('success', message, duration)
        elseif theType == 2 then
            exports['mythic_notify']:DoCustomHudText('inform', message, duration)
        elseif theType == 3 then
            exports['mythic_notify']:DoCustomHudText('error', message, duration)
        end
    elseif Config.NotificationType.client == 'ox_lib' then
        if GetResourceState('ox_lib') == 'started' then
            if theType == 1 then
                lib.notify({title = 'SYSTEM', description = message, type = 'success', duration = duration})
            elseif theType == 2 then
                lib.notify({title = 'SYSTEM', description = message, type = 'info', duration = duration})
            elseif theType == 3 then
                lib.notify({title = 'SYSTEM', description = message, type = 'error', duration = duration})
            end
        end
    elseif Config.NotificationType.client == 't-notify' then
        if theType == 1 then
            exports['t-notify']:Custom({style = 'success', duration = duration, title = 'SYSTEM', message = message, sound = false})
        elseif theType == 2 then
            exports['t-notify']:Custom({style = 'info', duration = duration, title = 'SYSTEM', message = message, sound = false})
        elseif theType == 3 then
            exports['t-notify']:Custom({style = 'error', duration = duration, title = 'SYSTEM', message = message, sound = false})
        end
    elseif Config.NotificationType.client == 'col_notify' then
        if theType == 1 then
            exports['col_notify']:Custom({style = 'success', duration = duration, title = 'SYSTEM', message = message, sound = false})
        elseif theType == 2 then
            exports['col_notify']:Custom({style = 'info', duration = duration, title = 'SYSTEM', message = message, sound = false})
        elseif theType == 3 then
            exports['col_notify']:Custom({style = 'error', duration = duration, title = 'SYSTEM', message = message, sound = false})
        end
    elseif Config.NotificationType.client == 'Roda_Notifications' then
        if theType == 1 then
            exports['Roda_Notifications']:showNotify(message, 'success', duration)
        elseif theType == 2 then
            exports['Roda_Notifications']:showNotify(message, 'info', duration)
        elseif theType == 3 then
            exports['Roda_Notifications']:showNotify(message, 'error', duration)
        end
    elseif Config.NotificationType.client == 'esx_notify' then
        if theType == 1 then
            exports["esx_notify"]:Notify('success', duration, message)
        elseif theType == 2 then
            exports["esx_notify"]:Notify('info', duration, message)
        elseif theType == 3 then
            exports["esx_notify"]:Notify('error', duration, message)
        end
    elseif Config.NotificationType.client == 'col_notify_new' then
        if theType == 1 then
            exports["col_notify"]:Notify('success', duration, message, 'SYSTEM')
        elseif theType == 2 then
            exports["col_notify"]:Notify('info', duration, message, 'SYSTEM')
        elseif theType == 3 then
            exports["col_notify"]:Notify('error', duration, message, 'SYSTEM')
        end
    elseif Config.NotificationType.client == 'codem-venice' then
        if theType == 1 then
            exports["Venice-Notification"]:Notify(message, duration, 'error')
        elseif theType == 2 then
            exports["Venice-Notification"]:Notify(message, duration, 'info')
        elseif theType == 3 then
            exports["Venice-Notification"]:Notify(message, duration, 'check')
        end
    elseif Config.NotificationType.client == 'default-esx' then
        if theType == 1 or theType == 2 or theType == 3 then
            SetNotificationTextEntry('STRING')
            AddTextComponentString(message)
            DrawNotification(0,1)
        end
    end
end
