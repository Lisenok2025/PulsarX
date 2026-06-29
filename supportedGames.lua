local supportedGames    = {}

supportedGames.FALLEN = {

      placeIDs          = { 13800717766; 15479377118; 16849012343; };
      gitPath           = 'FalosSurvival';

      gameName          = 'Falos Survival';
      status            = 'javodolaz';
      executors         = { 'Wavelon'; 'Swin'; 'Volti'; 'Siliwir'; 'Madiumpizdadium'; 'Velic'; };
      customMessage     = {
            ['executor']       = 'valeraidinahui';
      };
};
supportedGames.TRIDENT = {

      placeIDs          = { 13253735473; };
      gitPath           = 'tridentsurvival';

      gameName          = 'Trident Survival';
      status            = 'Undetected';
      executors         = { 'Wave'; 'Swift'; 'Velocity'; 'Potassium'; 'Seliware'; 'Volcano'; 'Volt'; 'Madium'; 'Mаdium'; };
      customMessage     = {
            ['executor']       = 'Сегодня праздник! сегодня сдохла твоя мать';
      };
};
supportedGames.LONE = {

      placeIDs          = { 13800223141; 139307005148921; 133421733370779; 4712109542; };
      gitPath           = 'longnecksurvival';

      gameName          = 'Lone Survival';
      status            = 'vodolaz';
      executors         = { 'WaWaWaWa'; 'Swin'; 'Velocicya'; 'Pitissium'; 'Siliwir'; 'Velic'; 'Voltoren'; 'Madium'; 'pidorum'; };
      customMessage     = {
            ['Madium']         = 'eblan?';
            ['executor']       = 'PIZDAAAAAAAAAAAAAAAA';
      };
};

-- WAVE HOTFIX
if (type(getgenv) == 'function' and getgenv().setfflag == nil) then
      getgenv().setfflag = function() end;
end;

return supportedGames;
