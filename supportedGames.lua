local supportedGames    = {}

supportedGames.TRIDENT = {

      placeIDs          = { 13253735473; };
      gitPath           = 'tridentsurvival';

      gameName          = 'Trident Survival';
      status            = 'Undetected';
      executors         = { 'Wave'; 'Swift'; 'Velocity'; 'Potassium'; 'Seliware'; 'Volcano'; 'Volt'; 'Madium'; 'Madium'; };
      customMessage     = {
            ['Madium']         = '💯 Полностью поддерживается';
            ['Wave']           = '🚀 Рекомендуемый экзекутор';
            ['executor']       = '❓ Неизвестный экзекутор';
      };
};

if (type(getgenv) == 'function' and getgenv().setfflag == nil) then
      getgenv().setfflag = function() end;
end;

return supportedGames;

local executorName = getexecutorname() or 'Unknown';
local gameData = supportedGames[gameName];

if gameData then
    local message = gameData.customMessage[executorName] or gameData.customMessage['executor'] or 'No message';
    print('Сообщение для ' .. executorName .. ': ' .. message);
end;
