
Config = {
    Map = "orkh.map_part3",
	Items = {"acheo.hamster", "acheo.herohead","acheo.herofeet","acheo.heroarm","acheo.herogear", "acheo.villainhead","acheo.villainarm", "acheo.villainfeet", "acheo.villaingear","acheo.heroarmleft","acheo.armleft", "acheo.downright", "tugdu.part_of_map1", "thecaptaintroll.cartaxipink",
"thecaptaintroll.poteau", "thecaptaintroll.panneau10", "thecaptaintroll.panneau30", "thecaptaintroll.panneau50",
"thecaptaintroll.panneau9", "thecaptaintroll.panneausensinterdit", "thecaptaintroll.panneaustop", "thecaptaintroll.panneaudanger",
"thecaptaintroll.plot", "thecaptaintroll.carpolice", "thecaptaintroll.carbus", "thecaptaintroll.cartaxi",
"thecaptaintroll.cartaxipink", "thecaptaintroll.cargreen", "thecaptaintroll.carlightblue", "thecaptaintroll.cardarkblue",
"thecaptaintroll.carred", "thecaptaintroll.cabinetel", "thecaptaintroll.trafficlight", "thecaptaintroll.eiffel", "acheo.pnjgirl", "acheo.stanlee", "acheo.pnjnerd", "acheo.pnj", "zabath.datizadoor", "orkh.upleft", "thecaptaintroll.souche", "tetabulle.kingtermite", "tetabulle.queentermite", "acheo.pnjblakc", "acheo.pnjblack", "acheo.pnjninja","acheo.herohamster","acheo.villainhamster", "acheo.batman", "orkh.ak", "orkh.katana"}
}

floIsZaBos = false
local nbMinutesBetweenRegen = 5
local bossspawn = false
local batman_is_dead = false
local hero = false
local cine = {0, 0, 0}
local cinebool = true
local skip = true
local termite = false
lifes = 10
local death = 1
local sentences = {"Aie, ils m'ont bien eu...", "Allez, on se laisse pas abattre!", "Franchement, si les devs te voyaient jouer, ils auraient honte...", "T'en as pas marre de mourir??", "Bon, a ce niveau la, je sais plus quoi dire...", "...", "...", "Je me disais que peut etre tu faisais expres de mourir pour voir les differents dialogues, mais en faite, t'es juste nul!", "Bon, j'ai fais le tour des phrases prevues, je vais recommencer au debut..."}

Client.OnStart = function()
	TimeCycle.On = false
	Fog.On = false
	termiteZone = Shape(Items.acheo.downright)
	termiteZone:SetParent(Map)
	termiteZone.Physics = PhysicsMode.StaticPerBlock
	termiteZone.Position = {635, 310, -635}
	termiteZone.Shadow = true
	termiteZone.Friction = Map.Friction
	termiteZone.CollisionGroups = Map.CollisionGroups
	termiteZone.Bounciness = Map.Bounciness
	startigHouse = Shape(Items.tugdu.part_of_map1)
	startigHouse:SetParent(Map)
	startigHouse.Physics = PhysicsMode.StaticPerBlock
	startigHouse.Position = {-637.5, 305, -635}
	startigHouse.Shadow = true
	startigHouse.CollisionGroups = Map.CollisionGroups
	startigHouse.Bounciness = Map.Bounciness
	upleft= Shape(Items.orkh.upleft)
	upleft:SetParent(Map)
	upleft.Physics = PhysicsMode.StaticPerBlock
	upleft.Position = {-637.5, 305, 637.5}
	upleft.Shadow = true
	upleft.CollisionGroups = Map.CollisionGroups
	upleft.Bounciness = Map.Bounciness
	Config.ConstantAcceleration = 0
	hamster = Shape(Items.acheo.hamster)
	hamster:SetParent(World)
    dropPlayer = function()
        Player.Position = Number3(870, 110, 110)
        Player.Rotation = { 0, 0, 0 }
        Player.Velocity = { 0, 0, 0 }
    end
    World:AddChild(Player)
	Player.CollidesWithGroups = Map.CollisionGroups
    Player.RightArm.IgnoreAnimations = true
    Player.RightHand.IgnoreAnimations = true
    Player.LeftArm.IgnoreAnimations = true
    Player.LeftHand.IgnoreAnimations = true
    dropPlayer()
	Player.RightArm.LocalRotation.Y = 0
	Player.RightArm.LocalRotation.X = 0
	Player.RightArm.LocalRotation.Z = math.pi / -2
	Player.LeftArm.LocalRotation.Y = 0
	Player.LeftArm.LocalRotation.X = 0
	Player.LeftArm.LocalRotation.Z = math.pi / 2
    
    Player.block = true
	Player.Bounciness = 0

	portal = Shape(Items.zabath.datizadoor)
	portal:SetParent(Map)
	portal.Position = {578, 112, -355}
	portal.Rotation = {0, math.pi / 2, 0}
	portal.Scale = 1.5
	portal.CollisionGroups = Map.CollisionGroups
assets = {Shape(Items.thecaptaintroll.cartaxipink), Shape(Items.thecaptaintroll.panneaustop), Shape(Items.thecaptaintroll.panneaustop), Shape(Items.thecaptaintroll.panneaustop), Shape(Items.thecaptaintroll.panneaustop), Shape(Items.thecaptaintroll.panneaustop), Shape(Items.thecaptaintroll.plot), Shape(Items.thecaptaintroll.plot), Shape(Items.thecaptaintroll.plot), Shape(Items.thecaptaintroll.plot), Shape(Items.thecaptaintroll.plot), Shape(Items.thecaptaintroll.plot), Shape(Items.thecaptaintroll.plot), Shape(Items.thecaptaintroll.plot), Shape(Items.acheo.pnjgirl),Shape(Items.acheo.stanlee),Shape(Items.acheo.pnjnerd),Shape(Items.acheo.pnjgirl),Shape(Items.acheo.pnjnerd),Shape(Items.acheo.pnjgirl),Shape(Items.acheo.pnjnerd),Shape(Items.acheo.pnjgirl),Shape(Items.acheo.pnjgirl),Shape(Items.acheo.pnjnerd),Shape(Items.acheo.pnjgirl),Shape(Items.acheo.pnjnerd),Shape(Items.acheo.pnjblakc),Shape(Items.acheo.pnjnerd),Shape(Items.acheo.pnjnerd),Shape(Items.acheo.pnjgirl),Shape(Items.acheo.pnjnerd),Shape(Items.acheo.pnjgirl),Shape(Items.acheo.pnjnerd),Shape(Items.acheo.pnjgirl),Shape(Items.acheo.pnjgirl),Shape(Items.acheo.pnjblakc),Shape(Items.acheo.pnjgirl),Shape(Items.acheo.pnjnerd),Shape(Items.acheo.pnjblakc),Shape(Items.acheo.pnjgirl),Shape(Items.acheo.pnjnerd),Shape(Items.acheo.pnjgirl),Shape(Items.acheo.pnjnerd),Shape(Items.acheo.pnjgirl),Shape(Items.acheo.pnjnerd),Shape(Items.acheo.pnjblakc),Shape(Items.acheo.pnjgirl),Shape(Items.acheo.pnjnerd),Shape(Items.acheo.pnjgirl),Shape(Items.acheo.pnjnerd),Shape(Items.acheo.pnjgirl),Shape(Items.acheo.pnjblakc),Shape(Items.acheo.pnjnerd),Shape(Items.acheo.pnjgirl),Shape(Items.acheo.pnjnerd),Shape(Items.acheo.pnjgirl),Shape(Items.acheo.pnjnerd),Shape(Items.acheo.pnjblakc),Shape(Items.acheo.pnjgirl),Shape(Items.acheo.pnjgirl),Shape(Items.acheo.pnjblakc),Shape(Items.acheo.pnjnerd),Shape(Items.acheo.pnjnerd),Shape(Items.acheo.pnjninja),Shape(Items.acheo.pnjblack)}

	aspos = {{211, 480, -351}, {702, 125, 402}, {922, 125, 372}, {673, 125, 437}, {418, 125, 438}, {388, 125, 262}, {4, 114, 239}, {4, 114, 255}, {4, 114, 444}, {4, 114, 460}, {4, 114, 1030}, {4, 114, 1045}, {1259, 114, 380}, {1259, 114, 395}, {0, 117, 0}, {436,117,276}, {465,117,290}, {464,117,277}, {485,117,278},{501,117,268},{518,117,276},{534,117,271},{552,117,272},{578,117,264},{599,117,268},{635,117,265},{665,117,267},{436,117,429}, {465,117,443}, {464,117,430}, {485,117,431},{501,117,421},{518,117,429},{534,117,424},{552,117,425},{578,117,417},{599,117,421},{635,117,418},{665,117,420},{103,117,290}, {102,117,277}, {123,117,278},{139,117,268},{153,117,276},{172,117,271},{190,117,272},{216,117,264},{237,117,268},{273,117,265},{303,117,267},{74,117,429}, {103,117,443}, {102,117,430}, {123,117,431},{139,117,421},{156,117,429},{172,117,424},{190,117,425},{216,117,417},{237,117,421},{273,117,418},{303,117,420},{400,117,530},{400,117,600},{400,117,500}}

	asrot = {{0, 0, math.pi/4}, {0,math.pi/2,0}, {0,math.pi,0}, {0,3*math.pi/2,0}, {0,math.pi,0}, {0,0,0}, {0,0,0}, {0,0,0}, {0,0,0}, {0,0,0}, {0,0,0}, {0,0,0}, {0,0,0}, {0,0,0}, {0,0,0}, {0,math.random() + math.pi,0},{0,math.random() + math.pi,0},{0,math.random() + math.pi,0},{0,math.random() + math.pi,0},{0,math.random() + math.pi,0},{0,math.random() + math.pi,0},{0,math.random() + math.pi,0},{0,math.random() + math.pi,0},{0,math.random() + math.pi,0},{0,math.random() + math.pi,0},{0,math.random() + math.pi,0},{0,math.random() + math.pi,0}, {0,math.random(),0},{0,math.random(),0},{0,math.random(),0},{0,math.random(),0},{0,math.random(),0},{0,math.random(),0},{0,math.random(),0},{0,math.random(),0},{0,math.random(),0},{0,math.random(),0},{0,math.random(),0},{0,math.random(),0},{0,math.random() + math.pi,0},{0,math.random() + math.pi,0},{0,math.random() + math.pi,0},{0,math.random() + math.pi,0},{0,math.random() + math.pi,0},{0,math.random() + math.pi,0},{0,math.random() + math.pi,0},{0,math.random() + math.pi,0},{0,math.random() + math.pi,0},{0,math.random() + math.pi,0},{0,math.random() + math.pi,0}, {0,math.random(),0},{0,math.random(),0},{0,math.random(),0},{0,math.random(),0},{0,math.random(),0},{0,math.random(),0},{0,math.random(),0},{0,math.random(),0},{0,math.random(),0},{0,math.random(),0},{0,math.random(),0},{0,math.random(),0},{0,math.random(),0},{0,math.random(),0},{0,math.random(),0}}

	ascale = {0.35, 0.15, 0.15, 0.15, 0.15, 0.15, 0.03, 0.03, 0.03, 0.03, 0.03, 0.03, 0.03, 0.03, 0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1,0.1}

	asbad = {false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,true,true}


	for i = 1, 65 do
		assets[i]:SetParent(Map)
		assets[i].Position = aspos[i]
		assets[i].Rotation = asrot[i]
		assets[i].Scale = ascale[i]
		assets[i].bad = asbad[i]
		if asbad[i] == false then
			assets[i].Physics = PhysicsMode.StaticPerBlock
		else
			assets[i].Physics = true	
			assets[i].life = 5
		end
		assets[i].CollisionGroups = Map.CollisionGroups
	end
	ease = require("ease")
	ui = require("uikit")
	ui:init()
	Pointer:Hide()
	UI.Crosshair = true

	Pointer.Down = function(pe)
    	ui:pointerDown(pe)
	end

	Pointer.Up = function(pe)
   	 ui:pointerUp(pe)
	end

	Screen.DidResize = function()
   	 ui:fitScreen()
	end

	bg = ui:createFrame(Color.Black)
	upgradeFrame = bg
    showUpgradeFrame = true
	UI.Crosshair = false
	bg:setParent(ui.rootFrame)
	hamster.Position = {890, 112, 110}
	introScene()
	 batman = Shape(Items.acheo.batman)
    batman:SetParent(World)
    batman.Scale = 0.3
    batman.Position = {127.5, 234.7, 1082}
    batman.Rotation.Y = math.pi
    batman.Physics = true
end

Client.Tick = function(dt)
	if batman_is_dead == false and isInBatmanRange() == true then
        playBatmanCutscene()
    end
    if Player.Position.Y < -500 then
        dropPlayer()
        Player:TextBubble("J'avais pas vu le trou...")
    end
	if cinebool == true then
		Player.Rotation = cine
	end
    portal.OnCollisionBegin = function (portal, o2)
        if  type(o2) == "Player" then
            termiteFight()
        end
    end
	if bossspawn == true then
		boss.Left = Number3(boss.Position.X, 0, boss.Position.Z) - Number3(Player.Position.X, 0, Player.Position.Z)
	boss.OnCollisionBegin = function(obj1, obj)
		if type(obj) == "Player" then
			boss.Velocity = - boss.Velocity
			boss.col = 1
			lifes = lifes - 2
		end
	end
				if  math.abs(boss.Position.X - Player.Position.X) <= 200 and math.abs(boss.Position.Y - Player.Position.Y) <= 200 and math.abs(boss.Position.Z - Player.Position.Z) <= 200 then
					local jumpVelocity
					if boss.col == 1 then
						Timer(1.0, false, function()
							jumpVelocity = -Number3(boss.Left.X, boss.Left.Y, boss.Left.Z)
							jumpVelocity = jumpVelocity * 80
							boss.Velocity = jumpVelocity
							boss.col = 0
						end)
					else
						jumpVelocity = -Number3(boss.Left.X, boss.Left.Y, boss.Left.Z)
						jumpVelocity = jumpVelocity * 80
						boss.Velocity = jumpVelocity
						boss.wasNotOnGround = 0
						if boss.IsOnGround == false and boss.wasNotOnGround == 0 then
								boss.speed = 40 / 1.25
								boss.wasNotOnGround = 1
						end
						if boss.wasNotOnGround == 1 and boss.IsOnGround == true then
								boss.speed = 40 * 1.25
								boss.wasNotOnGround = 0
						end
					end
				end
end
	if termite == true then
		if souche.ChildrenCount == 1 then
			portal:SetParent(souche)
            portal.Position = {-925, 930, -1080}
		end
		for i = 1, 2 do
			termites[i].Left = Number3(termites[i].Position.X, 0, termites[i].Position.Z) - Number3(Player.Position.X, 0, Player.Position.Z)
				termites[i].OnCollisionBegin = function(obj1, obj)
					if type(obj) == "Player" then
						termites[i].Velocity = - termites[i].Velocity
						termites[i].col = 1
						lifes = lifes - 1
					end
				end
				if  math.abs(termites[i].Position.X - Player.Position.X) <= 200 and math.abs(termites[i].Position.Y - Player.Position.Y) <= 200 and math.abs(termites[i].Position.Z - Player.Position.Z) <= 200 then
					local jumpVelocity
					if termites[i].col == 1 then
						Timer(1.0, false, function()
							jumpVelocity = -Number3(termites[i].Left.X, termites[i].Left.Y, termites[i].Left.Z)
							jumpVelocity = jumpVelocity * 20
							termites[i].Velocity = jumpVelocity
							termites[i].col = 0
						end)
					else
						jumpVelocity = -Number3(termites[i].Left.X, termites[i].Left.Y, termites[i].Left.Z)
						jumpVelocity = jumpVelocity * 20
						termites[i].Velocity = jumpVelocity
						termites[i].wasNotOnGround = 0
						if termites[i].IsOnGround == false and termites[i].wasNotOnGround == 0 then
								termites[i].speed = 20 / 1.25
								termites[i].wasNotOnGround = 1
						end
						if termites[i].wasNotOnGround == 1 and termites[i].IsOnGround == true then
								termites[i].speed = 20 * 1.25
								termites[i].wasNotOnGround = 0
						end
					end
				end
		end
	end

--ennemy moves
		for i, enemy in ipairs(assets) do
			if enemy.bad == true then
				enemy.Backward = Number3(enemy.Position.X, 0, enemy.Position.Z) - Number3(Player.Position.X, 0, Player.Position.Z)
				enemy.OnCollisionBegin = function(enemy, obj)
					if type(obj) == "Player" then
						enemy.Velocity = - enemy.Velocity
						enemy.col = 1
						lifes = lifes - 1
					end
				end
				if  math.abs(enemy.Position.X - Player.Position.X) <= 150 and math.abs(enemy.Position.Y - Player.Position.Y) <= 150 and math.abs(enemy.Position.Z - Player.Position.Z) <= 150 then
					local jumpVelocity
					if met_enn == false then
						met_enn = true
					end
					if enemy.col == 1 then
						Timer(1.0, false, function()
							jumpVelocity = -Number3(enemy.Backward.X, enemy.Backward.Y, enemy.Backward.Z)
							jumpVelocity = jumpVelocity * 50
							enemy.Velocity = jumpVelocity
							enemy.col = 0
						end)
					else
						jumpVelocity = -Number3(enemy.Backward.X, enemy.Backward.Y, enemy.Backward.Z)
						jumpVelocity = jumpVelocity * 50
						enemy.Velocity = jumpVelocity
						enemy.wasNotOnGround = 0
						if enemy.IsOnGround == false and enemy.wasNotOnGround == 0 then
								enemy.speed = 50 / 1.25
								enemy.wasNotOnGround = 1
						end
						if enemy.wasNotOnGround == 1 and enemy.IsOnGround == true then
								enemy.speed = 50 * 1.25
								enemy.wasNotOnGround = 0
						end
					end
				end
       	 end
    	end
	if lifes == 0 then
		dropPlayer()
		lifes = 10
		Player:TextBubble(sentences[death])
		death = death + 1
		if death == 10 then death = 1 end
	end
end

Client.Action1 = function()
    if Player.IsOnGround or floIsZaBos == true then
        Player.Velocity.Y = 100
    end
end

Client.Action2 = function()
	skip = false
-- Max
	if hero == true then
    	timerAnimRightHandEnd = Timer(0.1, false, function()
  		end)
		Player.RightArm.LocalRotation.Z = 0
		Player.RightArm.dt = 0.0
		local animTime = 0.2

		Player.RightArm.Tick = function(o, dt)
			o.dt = o.dt + dt
			local pct = o.dt / animTime
			if pct >= 1.0 then
				pct = 1.0
			end

			pct = math.sin(pct * math.pi)
			o.LocalRotation.Y = math.pi * -0.5 * pct
		end
		timerAnimRightHandEnd = Timer(0.1, false, function()
			Player.RightArm.LocalRotation.Z = math.pi / -2
    	end)

-- Max end
-- Flo

		local impact = Player:CastRay(target)
		if impact.Object ~= nil and impact.Distance <= 30 then
	    	if impact.Object.life ~= nil then
				impact.Object.life = impact.Object.life - 2
				if impact.Object.life <= 0 then
					impact.Object:RemoveFromParent()
				end
			end
		end
	else
		local impact = Player:CastRay(target)
		if impact.Object ~= nil and impact.Distance <= 150 then
	    	if impact.Object.life ~= nil then
				impact.Object.life = impact.Object.life - 1
				if impact.Object.life <= 0 then
					impact.Object:RemoveFromParent()
				end
			end
		end
	end
end

introScene = function()
    print("Click to skip cutscene")
	Player.Physics = PhysicsMode.Disabled
	hamster.Scale = 0.1
	hamster.Right = Player.Position - {890, 113, 110}
	hamster.Rotation.X = 0
	hamster.Rotation.Z = 0
	Camera:SetModeFree()
	Camera.Position = {880, 116, 110}
	Camera.Rotation = {-math.pi / 5, -math.pi / 2, 0}
	Player:TextBubble("Poutoupoutou, qu'il est mignon le petit...")
	Player.Rotation.Y = math.pi / 2
	cine = {Player.Rotation.X, Player.Rotation.Y, Player.Rotation.Z}
    Timer(5.0, false, function()
        if (skip == false) then maxtrix() cinebool = false hamster.Rotation.X = math.pi return end
        Camera.Rotation = {0, math.pi / 2, 0}
        hamster:TextBubble("sqweak.")
        Timer(5.0, false, function()
            if (skip == false) then maxtrix() cinebool = false hamster.Rotation.X = math.pi return end
            Camera.Rotation = {- math.pi / 5, -math.pi / 2, 0}
            Player:TextBubble("C'est qui le bebe a son papa?")
            Camera.Position = {877, 116, 110}
            Timer(5.0, false, function()
                if (skip == false) then maxtrix() cinebool = false hamster.Rotation.X = math.pi return end
                Camera.Rotation = {0, math.pi / 2, 0}
                hamster:TextBubble("sqweak...💀")
                hamster.Rotation.X = math.pi
                Camera.Position = {883, 113, 110}
                Timer(5.0, false, function()
                    if (skip == false) then maxtrix() cinebool = false return end
                    Camera.Rotation = {- math.pi / 5, -math.pi / 2, 0}
                    Player:TextBubble("NOOOOOON! BAUBIE!!!!!!")
                    Camera.Position = {875, 119, 110}
                    Timer(5.0, false, function()
                        if (skip == false) then maxtrix() cinebool = false return end
                        Camera.Rotation = {0, math.pi / 2, 0}
                        hamster:TextBubble("n'oublie pas...")
                        Camera.Position = {885, 111, 110}
                        Timer(3.0, false, function()
                            if (skip == false) then maxtrix() cinebool = false return end
                            hamster:TextBubble("Un grand pouvoir implique de manger des grains!")
                            Timer(5.0, false, function()
                                if (skip == false) then maxtrix() cinebool = false return end
                                Camera.Rotation = {- math.pi / 5, -math.pi / 2, 0}
                                Player:TextBubble("Mais....")
                                Camera.Position = {875, 119, 110}
                                Timer(3.0, false, function()
                                    if (skip == false) then maxtrix() cinebool = false return end
                                    Player:TextBubble("Tu sais parler?")
                                    Camera.Position = {880, 113, 110}
                                    Timer(5.0, false, function()
                                        if (skip == false) then maxtrix() cinebool = false return end
                                        Camera.Rotation = {0, math.pi / 2, 0}
                                        hamster:TextBubble("euh....")
                                        Timer(3.0, false, function()
                                            if (skip == false) then maxtrix() cinebool = false return end
                                            hamster:TextBubble("sqweak...")
                                            Timer(5.0, false, function()
                                                if (skip == false) then maxtrix() cinebool = false return end
                                                Camera.Rotation = {math.pi / 5, -math.pi /2, 0}
                                                Camera.Position = {885, 123, 110}
                                                Player.Head.LocalRotation.X = -math.pi / 4
												cine = {Player.Rotation.X, Player.Rotation.Y, Player.Rotation.Z}
                                                Player:TextBubble("NOOOOOOOOOOOOOOOOOOON!")
                                                Timer(1.0, false, function()
                                                    if (skip == false) then maxtrix() cinebool = false return end
                                                    Camera.Physics = true
                                                    Camera.Acceleration = -Config.ConstantAcceleration
                                                    Camera.Motion = {1, 2, 0}
                                                    Timer(10.0, false, function()
                                                        if (skip == false) then maxtrix() cinebool = false return end
                                                        Player:TextBubble("Il est long, ce traveling")
                                                        Timer(4, false, function()
                                                            if (skip == false) then maxtrix() cinebool = false return end
                                                            Camera.Rotation = {- math.pi / 5, -math.pi / 2, 0}
                                                            Player:TextBubble("Bon, faudra revoir l'angle maintenant...")
                                                            Camera.Position = {874, 116, 110}
                                                            Camera.Motion = {0, 0, 0}
                                                            Timer(4, false, function()
                                                                if (skip == false) then maxtrix() cinebool = false return end
                                                                Camera.Rotation = {- math.pi / 5, -math.pi / 2, 0}
                                                                Player:TextBubble("Ah, c'est mieux!")
                                                                Camera.Position = {880, 110, 110}
                                                                Player.Head.LocalRotation.X = 0
																cine = {Player.Rotation.X, Player.Rotation.Y, Player.Rotation.Z}
                                                                Timer(2, false, function()
                                                                    if (skip == false) then maxtrix() cinebool = false return end
                                                                    Player:TextBubble("bien, reprenons")
                                                                    Timer(2, false, function()
                                                                        if (skip == false) then maxtrix() cinebool = false return end
                                                                        Player:TextBubble("Baubie, je vais...")
                                                                        Timer(2, false, function()
                                                                            maxtrix()
																			cinebool = false
                                                                        end)
                                                                    end)
                                                                end)
                                                            end)
                                                        end)
                                                    end)
                                                end)
                                            end)
                                        end)
                                    end)
                                end)
                            end)
                        end)
                    end)
                end)
            end)
        end)
    end)
end

maxtrix = function()
	bg = ui:createFrame(Color.Black)
	bg:setParent(ui.rootFrame)

	Pointer:Show()

	uiTest = ui:createText("Test", Color.White, "big")
	uiTest:setParent(bg)
	uiTest.text = string.format("-Te venger (pilule rouge:\ntu deviendras un mechant)\n-Suivre tes dernieres\nvolontes! (pilule bleue:\ntu deviendras un heros)")

	
	uBtn1 = ui:createButton("Pillule rouge")
		uBtn1:setParent(bg)
		uBtn1.LocalPosition.Y = -50
		uBtn1.LocalPosition.X = 100
		uBtn1.onRelease = function()
			hero = false
			bg.IsHidden = true
			Pointer:Hide()
            changeGear()
			Player.Physics = true
			Camera:SetParent(Player)
            Camera:SetModeThirdPerson()
			Player.block = false

			boss = Shape(Items.acheo.herohamster)
			boss:SetParent(Map)
			boss.Position = {-700,117,750}
			boss.Rotation = {0,math.random(),0}
			boss.Scale = 0.2
			boss.bad = true
			boss.Physics = true
			boss.CollisionGroups = Map.CollisionGroups
			boss.life = 40
			Player.Scale = 0.25
			bossspawn = true
		end

	uBtn2 = ui:createButton("Pillule bleue")
		uBtn2:setParent(bg)
		uBtn2.LocalPosition.Y = -50
		uBtn2.LocalPosition.X = 300
		uBtn2.onRelease = function()
			hero = true
			bg.IsHidden = true
			Pointer:Hide()
            changeGear()
			Player.Physics = true
			Camera:SetParent(Player)
            Camera:SetModeThirdPerson()
			Player.block = false

			boss = Shape(Items.acheo.villainhamster)
			boss:SetParent(Map)
			boss.Position = {-700,117,750}
			boss.Rotation = {0,math.random(),0}
			boss.Scale = 0.2
			boss.bad = true
			boss.Physics = true
			boss.CollisionGroups = Map.CollisionGroups
			boss.life = 40
			Player.Scale = 0.25
			bossspawn = true
		end
	
	bg.parentDidResize = function()
		bg.Width = 500
		bg.Height = 250
		bg.LocalPosition = Number3((Screen.Width / 2) - (bg.Width / 2), (Screen.Height / 2) - (bg.Height / 2), 0)
		uiTest.LocalPosition = Number3((bg.Width / 4) - 80, bg.Height - 175, 0)
	end
	bg:parentDidResize()
	Pointer:Show()
	UI.Crosshair = true
	showBg = false
end

Client.AnalogPad = function(dx, dy)
    	Player.LocalRotation.Y = Player.LocalRotation.Y + dx * 0.01
    	Player.LocalRotation.X = Player.LocalRotation.X + -dy * 0.01

    	if dpadX ~= nil and dpadY ~= nil then
       	Player.Motion = (Player.Forward * dpadY + Player.Right * dpadX) * 75
    	end
end

Client.DirectionalPad = function(x, y)
	if not Player.block then
		dpadX = x dpadY = y
		Player.Motion = (Player.Forward * y + Player.Right * x) * 75
	end
end
		
changeGear = function()
    Player.RightArm.IsHiddenSelf = true
    Player.RightArm:GetChild(1).IsHiddenSelf = true
    Player.RightHand.IsHiddenSelf = true
    
    Player.LeftArm.IsHiddenSelf = true
    Player.LeftArm:GetChild(1).IsHiddenSelf = true
    Player.LeftHand.IsHiddenSelf = true
    
    Player.Head.IsHiddenSelf = true
    Player.Head:GetChild(1).IsHiddenSelf = true
    
    Player.Body.IsHiddenSelf = true
    Player.Body:GetChild(1).IsHiddenSelf = true
    
    Player.LeftLeg.IsHiddenSelf = true
    Player.LeftLeg:GetChild(1).IsHiddenSelf = true
    Player.LeftLeg:GetChild(2).IsHiddenSelf = true
    
    Player.RightLeg.IsHiddenSelf = true
    Player.RightLeg:GetChild(1).IsHiddenSelf = true
    Player.RightLeg:GetChild(2).IsHiddenSelf = true
    
    equipments = require("equipments")
    equipments.unloadAll(Player)
    
	if hero == true then
    	Player:EquipHat(Items.acheo.herohead)
    	Player:EquipRightHand(Items.acheo.heroarm)
   	 leftLegShape = Shape(Items.acheo.herofeet)
		leftHandShape = Shape(Items.acheo.heroarmleft)
  	  rightLegShape = Shape(Items.acheo.herofeet)
  	  bodyShape = Shape(Items.acheo.herogear)
		sword = Shape(Items.orkh.katana)
		sword:SetParent(Player.RightHand)
		sword.LocalRotation = {math.pi / 2, 0, 0}
		sword.LocalPosition.Z = 15
		sword.LocalPosition.X = -5
	else
		Player:EquipHat(Items.acheo.villainhead)
  	  Player:EquipRightHand(Items.acheo.villainarm)
   	 leftLegShape = Shape(Items.acheo.villainfeet)
		leftHandShape = Shape(Items.acheo.armleft)
   	 rightLegShape = Shape(Items.acheo.villainfeet)
  	  bodyShape = Shape(Items.acheo.villaingear)
		sword = Shape(Items.orkh.ak)
		sword:SetParent(Player.RightHand)
		sword.LocalRotation = {-math.pi / 2.5, math.pi / 2, 0}
		sword.LocalPosition.Z = 15
		sword.LocalPosition.X = 10
	end

    leftLegShape:SetParent(Player.LeftLeg)
    leftLegShape.LocalPosition = {0, -2, 0}
    leftLegShape.CollisionGroups = nil
    leftLegShape.CollidesWithGroups = nil
    
    Player.RightLeg:AddChild(rightLegShape)
    rightLegShape.LocalPosition = {0, -2, 0}
    rightLegShape.CollisionGroups = nil
    rightLegShape.CollidesWithGroups = nil
    
    Player.LeftHand:AddChild(leftHandShape)
    leftHandShape.LocalPosition = {0, 0, 0}
	leftHandShape.Rotation.X = math.pi
    leftHandShape.CollisionGroups = nil
    leftHandShape.CollidesWithGroups = nil

    Player.Body:AddChild(bodyShape)
    bodyShape.LocalPosition = {0, 5, 0}
    bodyShape.CollisionGroups = nil
    bodyShape.CollidesWithGroups = nil
end

termiteFight = function ()
    if termite == false then
        souche = Shape(Items.thecaptaintroll.souche)
	    souche:SetParent(Map)
	    souche.Physics = PhysicsMode.StaticPerBlock
	    souche.Position = {-1000, 1000, -1000}
	    souche.Friction = Map.Friction
	    souche.CollisionGroups = Map.CollisionGroups
	    souche.Bounciness = Map.Bounciness
		termites = {Shape(Items.tetabulle.kingtermite), Shape(Items.tetabulle.queentermite)}
		terpos = {{11, 0, -14}, {4, 0, -3}}
		for i = 1, 2 do
			termites[i]:SetParent(souche)
			termites[i].LocalPosition =terpos[i]
			termites[i].Scale = 0.3
			termites[i].Physics = true
			termites[i].CollisionGroups = Map.CollisionGroups
			termites[i].life = 10
		end
        Player:SetParent(souche)
        Player.LocalPosition = {15, -14, 8}
		Player.Scale = 0.05
        termite = true
    else
        Player:SetParent(Map)
		portal:SetParent(Map)
		portal.Position = {578, 112, -355}
        Player.Position = {600, 110, -350}
        souche:RemoveFromParent()
        termite = false
    end
end

isInBatmanRange = function()
    distance = math.sqrt((Player.Position.X - batman.Position.X) ^2 + (Player.Position.Z - batman.Position.Z) ^2)

    if (distance < 40) then
        return true
    else
        return false
    end
end

playBatmanCutscene = function()
    cinebool = true
    Player.Physics = PhysicsMode.Disabled
    Player.block = true
    Camera:SetModeFree()
    batman_is_dead = true


    Player.Position = {146.61, 110.0, 1053.95}
    Player.Motion = {0, 0, 0}
    Player.Velocity = {0, 0, 0}
    cine = {5.15, 5.64, 0}
    Camera.Physics = true
    Camera.Position = {99.12, 125, 1039.17}
    Camera.Rotation = {0.37, 1.00, 0.0}
    Camera.Acceleration = -Config.ConstantAcceleration
    Camera.Motion = {0, 15, 0}
    Timer(7.8, false, function()
        Camera.Motion = {0, 0, 0}
        Timer(0.5, false, function()

            batman:TextBubble("Vers l'aventure et plus loin !")
            Timer(2.0, false, function()

                batman.Physics = true
                batman.Velocity = {0, 50, -18}
                Timer(0.7, false, function()

                    batman.Position.Z = batman.Position.Z - 29
                    batman.Rotation.X = math.pi / 2
                    cine = batman.Position - Player.Position
                    Camera.Position = {107.08, 136.37, 1013.60}
                    Camera.Rotation = {0.47, 0.64, 0}
                    Timer(4.0, false, function()

                        batman.Physics = PhysicsMode.StaticPerBlock
						batman.CollisionGroups = Map.CollisionGroups
                        batman.Position.Y = 111.5
                        Camera:SetParent(Player)
                        Camera:SetModeThirdPerson()
                        cinebool = false
                        Player.block = false
                        Player.Physics = true
                    end)
                end)
            end)
        end)
    end)
end