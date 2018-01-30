if GetObjectName(GetMyHero()) ~= "Zoe" then return end

    require("OpenPredict")


    Zoe = Menu("Zoe", "Zoe")

    Zoe:SubMenu("QWER", "Cast QWER")

    Zoe.QWER:Key("Q", "Cast Q", string.byte("X"))
	Zoe.QWER:Slider("pQ", "Q Pred", 20, 0, 100, 5)
	Zoe.QWER:Key("E", "Cast E", string.byte("C"))
	Zoe.QWER:Slider("pE", "E Pred", 20, 0, 100, 5)

    local ZoeQ = { delay = 0.25, speed = 20000, width = 90, range = 900 }

    local ZoeE = { delay = 0.25, speed = 2000, width = 60, range = 900 }


    OnTick(function()

        local target = GetCurrentTarget()

        local QPred = GetPrediction (target, ZoeQ)

        local EPred = GetPrediction(target, ZoeE)
		
		if Zoe.QWER.Q:Value() and Ready(_Q) and ValidTarget(target, 900) then
			if QPred and QPred.hitChance >= (Zoe.QWER.pQ:Value()/100) then
                CastSkillShot(_Q, QPred.castPos)

            end

        end
		
		if Zoe.QWER.E:Value() and Ready(_E) and ValidTarget(target, 900) then
			if EPred and EPred.hitChance >= (Zoe.QWER.pE:Value()/100) then
                CastSkillShot(_E, EPred.castPos)

            end
        end
    end)




