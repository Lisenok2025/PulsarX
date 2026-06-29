if not game:IsLoaded() then
	game.Loaded:Wait()
end;

local players 		= game:GetService('Players');
local localPlayer 	= players.LocalPlayer;

if (not localPlayer) then
	players:GetPropertyChangedSignal('LocalPlayer'):Wait();
	localPlayer = players.LocalPlayer;
end;

local selfKicked = false;
local kickPlayer = function(reason)
      if (selfKicked) then
            return;
      end;
      localPlayer:Kick(`[amongus.hook] {reason}`);
      selfKicked = true;
end;

local executor 		= identifyexecutor and identifyexecutor() or 'Unknown';
local messagebox 	      = messageboxasync or messagebox;
local request 		= request or http_request;
local loadstring 	      = loadstring;

if (type(messagebox) ~= 'function') then
      return kickPlayer(`"messagebox" missing ( {executor} )`);
end;

local protectedMessagebox = function(body, title, id)

	local success, output = pcall(messagebox, body, title, id);
      if (success) then
            return output;
      end;

      -- trying with different id
      local success2, output2 = pcall(messagebox, body, title, 1);
      if (success2) then
            return output2;
      end;

      kickPlayer(`messagebox failed - {body}`);
      task.wait(9e9);
	return;
end;

local protectedLoad = function(url, ...)
	local success, response = pcall(request, {Url=url; Method='GET';});
	if (not success) then
		protectedMessagebox(`protectedLoad failed(1) - request error\n\nurl: {url}`, `amongus.hook [{executor}]`, 48);
		task.wait(9e9);
		return;
	elseif (type(response) ~= 'table' or type(response.Body) ~= 'string' or response.StatusCode ~= 200) then
            protectedMessagebox(`protectedLoad failed(2) - bad response\n\nurl: {url}`, `amongus.hook [{executor}]`, 48);
		task.wait(9e9);
		return;
      end;
      local loader = loadstring(response.Body);
      if (not loader) then
            protectedMessagebox(`protectedLoad failed(3) - syntax error\n\nurl: {url}`, `amongus.hook [{executor}]`, 48);
		task.wait(9e9);
		return;
      end;
      return loader(...);
end;

if (type(loadstring) ~= 'function') then
	return protectedMessagebox(`missing alias ( loadstring ) - unsupported executor`, `amongus.hook [{executor}]`, 48);

elseif (type(request) ~= 'function') then
	return protectedMessagebox(`missing alias ( request ) - unsupported executor`, `amongus.hook [{executor}]`, 48);
end;

local placeID           = game.PlaceId;
local gameID			= game.GameId;
local GITHUB_REPO       = 'https://raw.githubusercontent.com/Lisenok2025/PulsarX/refs/heads/main/';

local supportedGames    = protectedLoad(`{GITHUB_REPO}supportedGames.lua`);
local requiredIndexes   = { placeIDs = 'table'; executors = 'table'; customMessage = 'table' };

local runOnGame = function( gameInfo )

      -- 
      if (type(gameInfo) ~= 'table') then
            return false;
      end;
      for i, t in requiredIndexes do
            if (type(gameInfo[i]) ~= t) then
                  return false;
            end;
      end;

      
      if (
			not table.find(gameInfo.placeIDs, placeID) and
			not table.find(gameInfo.placeIDs, gameID)
		) then 
            return false;


      end;

      protectedLoad(`{GITHUB_REPO}{gameInfo.gitPath}/main.lua`);
      return true;
end;

for _, gameInfo in supportedGames do

      if (runOnGame(gameInfo)) then
            return;
      end;
end;

