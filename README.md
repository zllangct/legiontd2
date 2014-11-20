legiontd2
=========
dota2军团战争的全部代码   作者：空力使

vscript 内文件作用：

   abilities.lua       作者：裸奔的代码             我有极小幅度修改   主要是玩家兵的技能调用
   
   addon_game_mode.lua 作者：空力使                 基本游戏文件 包含部分预载入credit to XavierCHN 英雄出生设定技能点数
   
   buildinghelper.lua  作者：Myll                   用于为建筑添加网格和显示网格
   
   buildings.lua       作者：空力使                 大部分游戏核心技能 包括建造建筑 升级建筑 购买雇佣兵 升级人口 升级科技
                                                    激活农民（部分credit to 裸奔的代码） 拉比克reroll技能 升级国王
                                                    
   cfroundthinker.lua  作者：Xavier 空力使          游戏流程控制 以及怪物数据读取 由XavierCHN的天炼为原型 添加大量函数 
                                                    修改大量地方完成
                                                    
   cfspawner.lua       作者：Xavier 空力使          游戏刷怪控制 同样以XavierCHN的天炼为原型大幅度修改 改变出兵模式 
                                                    增加雇佣兵出兵模式
                                                    
   playerstats.lua     作者：空力使                 游戏总初始化 包括所有玩家数据 玩家控制单位 王 玩家相关触发区域设置 马甲
                                                    同时包括和UI部分交互的函数（因为大部分文件都需要require此文件获取玩家数据
                                                    所以UI交互也放在这里）
                                                    
   teleport.lua        作者：空力使                 传送区域的触发设置

dota2 legiontd       credit to Aerohand
