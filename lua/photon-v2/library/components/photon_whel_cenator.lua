if (Photon2.ReloadComponentFile()) then return end
local COMPONENT = Photon2.LibraryComponent()
local sequence = Photon2.SequenceBuilder.New

COMPONENT.Author = "Photon"

COMPONENT.Credits = {
	Model = "Schmal",
	Code = "Gandhi"
}

COMPONENT.Title = [[Whelen Cenator]]
COMPONENT.Category = "Lightbar"
COMPONENT.Model = "models/supermighty/photon/whelen_cenator.mdl"

COMPONENT.Preview = {
	Position = Vector(),
	Angles = Angle( 0, 180, 0 ),
	Zoom = 0.9
}

COMPONENT.Templates = {
	["2D"] = {
		Primary = {
			Width 	= 8.3,
			Height	= 5.5,
			Shape = PhotonMaterial.GenerateLightQuad("photon/lights/sm_whe_lib_ii_primary_shape.png").MaterialName,
			Detail = PhotonMaterial.GenerateLightQuad("photon/lights/sm_whe_lib_ii_primary_detail.png").MaterialName,
			Scale = 2
		},
		Takedowns = {
			Width 	= 3.2,
			Height	= 3,
			Shape = PhotonMaterial.GenerateLightQuad("photon/lights/sm_whe_lib_ii_half_shape.png").MaterialName,
			Detail = PhotonMaterial.GenerateLightQuad("photon/lights/sm_whe_lib_ii_half_detail.png").MaterialName,
			Scale = 2
		},
	},
}

COMPONENT.Elements = {
	-- Front Left
	[1] = { "Primary", Vector( 6, 3.5, 0.3 ), Angle( 0, -90, 0 ) },
	[2] = { "Primary", Vector( 6, 10.90, 0.3 ), Angle( 0, -90, 0 ) },
	[3] = { "Primary", Vector( 6, 20.75, 0.3 ), Angle( 0, -90, 0 ) },
	[4] = { "Primary", Vector( 3.65, 27, 0.3 ), Angle( 0, -43, 0 ) },
	-- Front Right
	[5] = { "Primary", Vector( 6, -3.5, 0.3 ), Angle( 0, -90, 0 ) },
	[6] = { "Primary", Vector( 6, -10.90, 0.3 ), Angle( 0, -90, 0 ) },
	[7] = { "Primary", Vector( 6, -20.75, 0.3 ), Angle( 0, -90, 0 ) },
	[8] = { "Primary", Vector( 3.65, -27, 0.3 ), Angle( 0, -137, 0 ) },
	-- Rear Left
	[9] = { "Primary", Vector( -6, 3.5, 0.3 ), Angle( 0, 90, 0 ) },
	[10] = { "Primary", Vector( -6, 10.90, 0.3 ), Angle( 0, 90, 0 ) },
	[11] = { "Primary", Vector( -6, 20.75, 0.3 ), Angle( 0, 90, 0 ) },
	[12] = { "Primary", Vector( -3.65, 27, 0.3 ), Angle( 0, 43, 0 ) },
	-- Rear Right
	[13] = { "Primary", Vector( -6, -3.5, 0.3 ), Angle( 0, 90, 0 ) },
	[14] = { "Primary", Vector( -6, -10.90, 0.3 ), Angle( 0, 90, 0 ) },
	[15] = { "Primary", Vector( -6, -20.75, 0.3 ), Angle( 0, 90, 0 ) },
	[16] = { "Primary", Vector( -3.65, -27, 0.3 ), Angle( 0, 137, 0 ) },
	-- Front Takedowns
	[17] = { "Takedowns", Vector( 6, 16.5, 0.3 ), Angle( 0, -90, 0 ) },
	[18] = { "Takedowns", Vector( 6, -16.5, 0.3 ), Angle( 0, -90, 0 ) },
	-- Alley Takedowns
	[19] = { "Takedowns", Vector( 0, -29.4, 0.3 ), Angle( 0, 180, 0 ) },
	[20] = { "Takedowns", Vector( 0, 29.4, 0.3 ), Angle( 0, 0, 0 ) },
}

COMPONENT.StateMap = "[R] 1 2 3 4 5 6 7 8 12 16 11 15 [W] 17 18 19 20 [B] 10 9 13 14"

COMPONENT.ElementGroups = {

}

-- COMPONENT.ElementStates = {
--     ["2D"] = {
--         ["~OFF"] = {
--             Intensity = 0,
--             IntensityTransitions = true,
--             IntensityGainFactor = 9,
--             IntensityLossFactor = 12,
--         },
-- 	}
-- }

COMPONENT.Segments = {
	Debug = {
		FrameDuration = 1/30,
		Frames = {
			[1] = "1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20",
		},
		
		Sequences = {
			["Debug"] = {
				1,
			},
		},
	},
	Mode3 = {
		FrameDuration = 1/30,
		Frames = {
			[1] = "8 7 6 5",
			[2] = "8 7 6 5 1 2 3 4",
			[3] = "1 2 3 4",
			[4] = "1 2 3 4 8",
			[5] = "8 7 6 5 1 2 3",
			[6] = "8 7 6",
			[7] = "7 5",
			[8] = "8 7 6 5 4",
			[9] = "7 6 5 1 2 3 4",
			[10] = "2 3 4",
			[11] = "1 2 4",
			[12] = "8 7 1 2 3",
			[13] = "8 7 6 5 1 2",
			[14] = "8 6 5",
			[15] = "8 7 5",
			[16] = "7 6 5 3 4",
			[17] = "6 5 1 2 3 4",
			[18] = "1 3 4",
			[19] = "8 1 2 3",
			[20] = "8 7 6 1 2",
			[21] = "7 6 5 1",
			[22] = "7 6 5 4",
			[23] = "6 5 2 3 4",
			[24] = "1 2 3",
			[25] = "1 2 3 4 8",
			[26] = "8 7 1 2",
			[27] = "6 1",
			[28] = "8 7 6 5 1",
			[29] = "8 6",
			[30] = "8 7 6 3 4",
			[31] = "6 5 3 4",
			[32] = "5 2",
			[33] = "5 1 2 3 4",
			[34] = "2 4",
			[35] = "6 5 1 2",
			[36] = "8 7 6 1",
			[37] = "8 6 5 1",
			[38] = "8 6 4",
		},
		
		Sequences = {
			["MODE3"] = {
				1,6,1,7,1,6,1,8,9,3,10,3,11,3,10,3,4,12,13,14,1,15,1,6,1,8,16,17,11,3,18,3,10,3,4,19,12,20,21,1,14,15,1,6,1,8,22,16,23,24,3,11,18,3,10,3,25,19,12,26,27,28,1,29,15,1,8,22,30,31,32,33,3,34,18,3,4,19,12,35,36,8,14,14,38
			},
		},
	},
	Mode2 = {
		FrameDuration = 1/30,
		Frames = {
			[1] = "8 7 6 5",
			[2] = "1 2 3 4",
		},
		
		Sequences = {
			["MODE2"] = sequence():FlashHold(2, 2, 30):FlashHold(1, 2, 30)
		},
	},
	-- Traffic = {
	-- 	FrameDuration = 1/30,
	-- 	Frames = {
	-- 		[1] = "10 9 13 14",
	-- 		[2] = "17 18",
	-- 		[3] = "14",
	-- 		[4] = "10",
	-- 		[5] = "10 9",
	-- 		[6] = "10 9 17",
	-- 		[7] = "10 9 17 18",
	-- 		[8] = "10 9 17 18 13",
	-- 		[9] = "10 9 17 18 13 14",
	-- 		[10] = "9 17 18 13 14",
	-- 		[11] = "17 18 13 14",
	-- 		[12] = "18 13 14",
	-- 		[13] = "13 14",
	-- 		[14] = "14",
	-- 		[15] = "17 18",
	-- 		[16] = "17 18 9 13",
	-- 		[17] = "17 18 9 13 10 14",
	-- 	},
		
	-- 	Sequences = {
	-- 		["Flash"] = {
	-- 			1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,
	-- 			2,2,2,2,2,2,2,2,2,2,2,2,2,2
	-- 		},
	-- 		["Flash2"] = sequence():Alternate( 3, 4, 15 ),
	-- 		["Right"] = sequence():Sequential( 4, 9 ):Hold(1):StretchAll( 10 ):Steady( 0, 4),
	-- 		["Left"] = sequence():Sequential( 14, 9 ):Hold(1):StretchAll( 10 ):Steady( 0, 4),
	-- 		["Diverge"] = sequence():Sequential( 15, 17 ):Hold(1):StretchAll( 10 ):Steady( 0, 4),
			
	-- 	}
	-- },
}

COMPONENT.Inputs = {
	["Emergency.Warning"] = { 
		["MODE1"] = {
			
		},
		["MODE2"] = {
			Mode2 = "MODE2",

		},
		["MODE3"] = {
			Mode3 = "MODE3",
		},
	},
	["Emergency.Directional"] = {
		-- ["LEFT"] = { Traffic = "Left" },
		-- ["RIGHT"] = { Traffic = "Right" },
		-- ["CENOUT"] = { Traffic = "Diverge" },
	}
}