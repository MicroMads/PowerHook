local PowerHook = {}
    local HTTPService = game:GetService('HttpService')
    -- local Proxy = require(script.Parent.lib.proxy)


    function PowerHook.New(webhookUrl)
        -- Checking if powerhook servers and everthing is online.
        local HTTPEnabled = HTTPService.HttpEnabled
        --local ProxyEnabled, Status = Proxy.IsEnabled()

        if HTTPEnabled then --and ProxyEnabled then
            local HookInstance = {}

                function HookInstance.Message(message)
                    local HookData = {
                        content = message,
                        embeds = {},
                        attachments = {}
                    }

                    local MessageCoef = {}

                        function MessageCoef.AddUsername(userName)
                            userName = userName or 'PowerHook'
                            HookData["username"] = userName
                        end

                        function MessageCoef.AddAvatar(avatarUrl)
                            avatarUrl = avatarUrl or 'avatar'
                            HookData["avatar_url"] = avatarUrl
                        end

                        function MessageCoef:AddEmbed(title, description, color)
                            title = title or 'PowerHook Embed'
                            description = description or "PowerHook Description"
                            color = color or nil
                            
                            local Embed = {
                                title = title,
                                description = description,
                                color = color
                            }
                            
                            local EmbedInstance = {}

                                function EmbedInstance.AddField(name, value, inline)
                                    name = name or 'PowerHook'
                                    value = value or 'Hello'
                                    inline = inline or false
                                    Embed['fields'] = Embed['fields'] or {}
                                    table.insert(Embed.fields, {
                                        name = name,
                                        value = value,
                                        inline = inline
                                    })

                                    return EmbedInstance
                                end

                                function EmbedInstance.AddAuthor(author, authorUrl, authoriconurl)
                                    author = author or "PowerHook Author"
                                    authorUrl = authorUrl or nil
                                    authoriconurl = authoriconurl or nil

                                    Embed['author'] = {
                                        name = author,
                                        url = authorUrl,
                                        icon_url = authoriconurl
                                    }

                                    return EmbedInstance                                    
                                end

                                function EmbedInstance.AddImage(imageUrl)
                                    imageUrl = imageUrl or nil

                                    Embed['image'] = {
                                        url = imageUrl
                                    }

                                    return EmbedInstance
                                end

                                
                                function EmbedInstance.AddThumbnail(imageUrl)
                                    imageUrl = imageUrl or nil

                                    Embed['thumbnail'] = {
                                        url = imageUrl
                                    }

                                    return EmbedInstance
                                end

                                function EmbedInstance:EndEmbed()
                                    table.insert(HookData.embeds, Embed)
                                    return MessageCoef
                                end

                            return EmbedInstance
                        end

                        function MessageCoef:Send()
                            print('Sent Webhook.')
                        end

                    return MessageCoef
                end
            return HookInstance
        else
            warn('PowerHook -> Something went wrong. (HttpEnabled: '..HTTPEnabled..' | ProxyEnabled: { Enabled: '..ProxyEnabled..', Status: '..Status..'})')
        end
    end
return PowerHook