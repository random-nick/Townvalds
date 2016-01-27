function TownCreate(Split, Player)
    -- Check if the player entered a name for the town
    if (Split[3] == nil) then
        Player:SendMessageFailure("You have to enter a town name! Usage: /town new (name)");
        return true;
    end

    -- Retrieve the player UUID from Mojang of the player that invoked the command
    local UUID = cMojangAPI:GetUUIDFromPlayerName(Player:GetName(), true);

    if (UUID == "") then
        Player:SendMessageFailure("Invalid player!");
        return true;
    end

    sql = "SELECT town_id FROM residents WHERE player_uuid = ?";
    parameters = {UUID}
    local result = ExecuteStatement(sql, parameters);

    if(result[1][1] == nil) then
        sql = "SELECT town_name FROM towns WHERE town_name = ?";
        parameters = {Split[3]}
        local result = ExecuteStatement(sql, parameters);

        if(result[1] == nil) then
            -- Insert the town data in the database
            sql = "INSERT INTO towns (town_name, town_owner) VALUES (?, ?)";
            parameters = {Split[3], UUID};
            local town_id = ExecuteStatement(sql, parameters);

            sql = "INSERT INTO townChunks (town_id, chunkX, chunkZ) VALUES (?, ?, ?)";
            parameters = {town_id, Player:GetChunkX(), Player:GetChunkZ()}
            ExecuteStatement(sql, parameters);

            local sql = "UPDATE residents SET town_id = ? WHERE player_uuid = ?";
            local parameters = {town_id, UUID}
            ExecuteStatement(sql, parameters);

            Player:SendMessageSuccess("Created a new town called " .. Split[3]);
        else
            Player:SendMessageFailure("There already exists a town with that name, please choose a different one");
        end
    else
        Player:SendMessageFailure("Please leave your current town before you create a new one");
    end

    return true;
end

function TownClaim(Split, Player)
    -- Get the town of the player
    sql = "SELECT town_id FROM residents WHERE player_uuid = ?";
    parameters = {cMojangAPI:GetUUIDFromPlayerName(Player:GetName(), true)}
    local town_id = ExecuteStatement(sql, parameters)[1][1];

    if not(town_id == nil) then
        sql = "SELECT town_id FROM townChunks WHERE chunkX = ? AND chunkZ = ?";
        parameters = {Player:GetChunkX(), Player:GetChunkZ()}
        local result = ExecuteStatement(sql, parameters);

        if not (result[1] == town_id) then
            sql = "INSERT INTO townChunks (town_id, chunkX, chunkZ) VALUES (?, ?, ?)";
            parameters = {town_id, Player:GetChunkX(), Player:GetChunkZ()}
            ExecuteStatement(sql, parameters);

            Player:SendMessageSuccess("Land claimed");
        else
            Player:SendMessageFailure("This chunk already belongs to a different town");
        end
    else
        Player:SendMessageFailure("You can't claim land if you're not in a town");
    end
    return true;
end
