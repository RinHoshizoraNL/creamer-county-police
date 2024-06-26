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
COMPONENT.Model = "models/schmal/fedsig_arjent/arjent_lightbar.mdl"

COMPONENT.Preview = {
	Position = Vector(),
	Angles = Angle( 0, 180, 0 ),
	Zoom = 0.9
}

COMPONENT.Templates = {
	["2D"] = {
		Primary = {
			Width 	= 7.1,
			Height	= 7.1,
			Shape = PhotonMaterial.GenerateLightQuad("gandhi/fcso/arjent_main_shape.png").MaterialName,
			Detail = PhotonMaterial.GenerateLightQuad("gandhi/fcso/arjent_main_detail.png").MaterialName,
			Scale = 2
		},
	},
}

COMPONENT.Elements = {
	-- Front Left
	[1] = { "Primary", Vector( 8.8, 10.4, 2 ), Angle( 0, -90, 0 ) },
}

COMPONENT.StateMap = "[R] 1"

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
	Main = {
		FrameDuration = 1/30,
		Frames = {
			[1] = "4 8",
			[2] = "3 7",
			[3] = "3 4 7 8",
			[4] = "5 8 1 4",
		},
		
		Sequences = {
			["Lights"] = {
				1,1,1,1,1,1,2,2,2,2,2,3,4,4,4,4,4,4,
			},
		}
	},
	Middle = {
		FrameDuration = 1/30,
		Frames = {
			[1] = "2 6",
		},
		
		Sequences = {
			["Steady"] = {
				1
			},
		}
	},
	Rear = {
		FrameDuration = 1/30,
		Frames = {
			[1] = "12 16",
			[2] = "11 15",
			[3] = "11 12 15 16",
		},
		
		Sequences = {
			["Rear"] = {
				1,1,1,1,1,1,2,2,2,2,2,3,1,1,1,1,1,1,
			},
		}
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

		},
		["MODE3"] = {
			Main = "Lights",
		},
	},
	["Emergency.Directional"] = {
		-- ["LEFT"] = { Traffic = "Left" },
		-- ["RIGHT"] = { Traffic = "Right" },
		-- ["CENOUT"] = { Traffic = "Diverge" },
	}
}