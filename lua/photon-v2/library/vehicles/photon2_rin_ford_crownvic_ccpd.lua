if (Photon2.ReloadVehicleFile()) then return end
local VEHICLE = Photon2.LibraryVehicle()

VEHICLE.Title 		= "2010 Ford Crown Victoria CCPD"
VEHICLE.Vehicle		= "cvpi_hd_sgm"
VEHICLE.Category 	= "Photon 2: Creamer County"
VEHICLE.Author		= "Rin Hoshizora"

local sequence = Photon2.SequenceBuilder.New

VEHICLE.Equipment = {
	{
		Category = "Livery",
		Options = {
			
			{
				Option = "Patrol",
				SubMaterials = {
					{ Id = 3, Material = "rin/creamer/crownvic10/patrol" }
				}
			},
		}
	},
	{
		Category = "Pushbar",
		Options = {
			{
				Option = "Pushbar",
				BodyGroups = {
					{ BodyGroup = "pushbar", Value = 1 }
				}
			},
			{
				Option = "No Pushbar",
				BodyGroups = {
					{ BodyGroup = "pushbar", Value = 0 }
				}
			}
		}
	},
	{
		Category = "Lightbar",
		Options = {
			{
				Option = "Whelen Liberty (48\")",
				Components = {
					{
						Component = "photon_whe_liberty_48",
						Position = Vector( 0, -19.2, 68.8 ),
						Angles = Angle( 0.5, 90, 0 ),
						Scale = 0.82,
						StateMap = "[R] 1 2 3 4 [R] 5 6 [R] 7 8 9 10 [B] 11 12 [R] 13 14 [B] 15 16",
						Segments = {
							ForwardInboard = {
								Frames = {
									[1] = "3 6",
									[2] = "4 5",
									[3] = "5",
									[4] = "6"
								},
								Sequences = {
									["QUAD_FLASH"] = sequence():QuadFlash( 1, 2 ):Do( 4 ):Alternate( 1, 2, 4 ):Do( 4 ),
									["SLOW"] = sequence():Steady( 4, 10 ):Off( 1 ):Steady( 3, 10 ):Off( 1 )
								}
							},
							Corners = {
								Frames = {
									[1] = "7 9",
									[2] = "8 10",
									[3] = "7 8 9 10"
								},
								Sequences = {
									["TRIPLE_FLASH_HOLD"] = { 1, 1, 0, 1, 0, 1, 0, 2, 2, 0, 2, 0, 2, 0 },
									["ON"] = { 3 }
								}
							},
							RearOuter = {
								Frames = {
									[1] = "11",
									[2] = "12",
								},
								Sequences = {
									["SLOW"] = sequence():Steady( 1, 10 ):Off( 2 ):Steady( 2, 10 ):Off( 2 )
								}
							},
							RearInboard = {
								Frames = {
									[1] = "13 16",
									[2] = "14 15",
									[3] = "13",
									[4] = "14"
								},
								Sequences = {
									["QUAD_FLASH"] = sequence():QuadFlash( 1, 2 ):Do( 4 ):Alternate( 1, 2, 4 ):Do( 4 ),
									["QUAD_FLASH_BLUE"] = sequence():QuadFlash( 3, 4 ):Do( 4 ):Alternate( 3, 4, 4 ):Do( 4 ),
								}
							}
						},
						Bones = {
							["foot_l"] = { Vector( -0.1, 0, -0.2), Angle( 0, 0, 0 ), 1 },
							["foot_r"] = { Vector( 0.1, 0, -0.2), Angle( 0, 0, 0 ), 1 },
							["strap_l"] = { Vector( -2.5, 0, 0.6), Angle( 0, 0, 0 ), 1 },
							["strap_r"] = { Vector( 2.5, 0, 0.6), Angle( 0, 0, 0 ), 1 },
						},
						Inputs = {
							["Emergency.Warning"] = {
								["MODE1"] = {
									Corners = "ON",
									ForwardInboard = "SLOW",
									RearOuter = "SLOW",
								},
								["MODE2"] = {
									ForwardInboard = "QUAD_FLASH",
									Corners = "TRIPLE_FLASH_HOLD",
									RearOuter = "SLOW",
									RearInboard = "QUAD_FLASH_BLUE"
								},
								["MODE3"] = {
									ForwardInboard = "QUAD_FLASH",
									Corners = "TRIPLE_FLASH_HOLD",
									RearOuter = "SLOW",
									RearInboard = "QUAD_FLASH",
									Takedown = "TRIPLE_FLASH",
									Alley = "TRIPLE_FLASH:180"
								}
							},
							["Emergency.Directional"] = {
								["LEFT"] = { AmberTrafficFill = "LEFT" },
								["RIGHT"] = { AmberTrafficFill = "RIGHT" },
								["CENOUT"] = { AmberTrafficFill = "CENOUT" },
							}
						},
						SubMaterials = {
							-- [3] = "photon/common/blank"
						},
						BodyGroups = {
							["front_inner"] = 3,
							["front_middle"] = 0,
							["front_outer"] = 0,
						},
						-- States = { "A", "A", "A", "A" }
					}
				}
			}
		}
	},
	{
		Category = "Pushbar Flashers",
		Options = {
			{
				Option = "Koito Flashers",
				Components = {
					{
						Component = "oss_laf150",
						Position = Vector( -10, 120.5, 28.7 ),
						BodyGroups = {
							["bracket"] = 0,
							["mount"] = 0,
						},
						Phase = "B",
						Angles = Angle( 0, 0, 0 ),
						Scale = 0.8
					},
					{
						Component = "oss_laf150",
						Position = Vector( 10, 120.5, 28.7 ),
						BodyGroups = {
							["bracket"] = 0,
							["mount"] = 0,
						},
						Phase = "A",
						Angles = Angle( 0, 0, 0 ),
						Scale = 0.8
					},
					{
						Name = "@grille_lp3",
						Component = "photon_patlite_lp3_rin",
						Position = Vector( -17.75, 120, 25.5 ),
						Angles = Angle( 270, 90, 0 ),
						Scale = 1,
						StateMap = "[R] 1",
						Phase = "A",
						SubMaterials = {
							[5] = "sentry/props/patlite_lp3/glass_outer"
						},
						InputActions = {
							["Emergency.Warning"] = {
								["MODE1"] = { Light = "FLASH4" },
								["MODE2"] = { Light = "FLASH4" },
								["MODE3"] = { Light = "FLASH4" },
							},
						}
					},
					{
						Inherit = "@grille_lp3",
						Position = Vector( 17.75, 120, 25.5 ),
						Angles = Angle( 90, 270, 0 ),
						Phase = "B",
						StateMap = "[R] 1"
					}
				}
			},
		}
	},
	{
		Category = "Flashers",
		Options = {
			{
				Option = "Flashers",
				VirtualComponents = {
					{
						Component = "photon_standard_cvpi10"
					}
				}
			},
			{
				Option = "None",
			}
		}
	},
    {
		Category = "Spotlights",
		Options = {
			{
				Option = "Pillar Spotlights",
				Components = {
					{
						Component = "photon_par46_left",
						Position = Vector( -35.06, 26.46, 49.282 ),
						Angles = Angle( 0, 0, 0 ),
						Scale = 1,
					},
					{
						Component = "photon_par46_right",
						Position = Vector( 35.06, 26.46, 49.282 ),
						Angles = Angle( 0, 0, 0 ),
						Scale = 1,
						Inputs = {
							-- Clear the default illumination mode
							["Emergency.SceneForward"] = { ["ON"] = {} },
							["Emergency.Warning"] = {
								["MODE1"] = { Light = "ON" },
								["MODE2"] = { Light = "ON" },
								["MODE3"] = { Light = "ON" },
							}
						}
					}
				},
				BodyGroups = {
					{ BodyGroup = "door_l_notch", Value = 0 },
					{ BodyGroup = "door_r_notch", Value = 0 },
				}
			},
		}
	},
	{
		Category = "Police Equipment",
		Options = {
			{
				Option = "Police Equipment",
				BodyGroups = {
					{ BodyGroup = "hubcaps", Value = 1 },
					{ BodyGroup = "doortrim", Value = 3 },
					{ BodyGroup = "spotlight_l", Value = 1 },
					{ BodyGroup = "spotlight_r", Value = 1 },
					{ BodyGroup = "windowbars", Value = 1 },
					{ BodyGroup = "rainguards", Value = 1 },
				},
				Props = {
					{
						Model = "models/sentry/props/jp/oss_mkd1.mdl",
						Position = Vector( -0.2, 10, 26.85 ),
						Angles = Angle( -69, 270, 0 ),
						Scale = 1
					},
					{
						Model = "models/sentry/props/jp/necradio.mdl",
						Position = Vector( -0.2, 12.75, 28 ),
						Angles = Angle( -69, 270, 0 ),
						Scale = 1.1
					},
					{
						Model = "models/sentry/props/jp/dashcam.mdl",
						Position = Vector( 7, 15, 62 ),
						Angles = Angle( 8, 264.8, 0 ),
						Scale = 1
					},
					{
						Model = "models/sentry/props/jp/dashcam.mdl",
						Position = Vector( 0, -67, 62.7 ),
						Angles = Angle( 8, 90, 0 ),
						Scale = 1
					},
					{
						Model = "models/sentry/props/jp/necmdt.mdl",
						Position = Vector( 0, 20, 39 ),
						Angles = Angle( -7, 270, 0 ),
						Scale = 0.8
					},
					{
						Model = "models/sentry/props/jp/antenna.mdl",
						Position = Vector( 0, -40, 68.3),
						Angles = Angle( 0, 0, 2.5 ),
						Scale = 1
					},
					{
						Model = "models/sentry/props/jp/patlitespeaker.mdl",
						Position = Vector( 11.5, 121.4, 22.5 ),
						Angles = Angle( 0, 270, 180 ),
						Scale = 1,
						SubMaterials = {
						[0] = "sentry/cvpi_hd/black"
						},
					},
					{
						Model = "models/sentry/props/jp/patlitespeaker.mdl",
						Position = Vector( -11.5, 121.4, 22.5 ),
						Angles = Angle( 0, 270, 180 ),
						Scale = 1,
						SubMaterials = {
						[0] = "sentry/cvpi_hd/black"
						},
					},
					{
						Model = "models/xenosprops/jp_plate/jp_plate.mdl",
						Position = Vector( 0, -124.55, 36.2 ),
						Angles = Angle( -11, 270, 00 ),
						Scale = 0.89,
						BodyGroups = {
							["rear_seal"] = 0,
						},
						SubMaterials = {
							[0] = "rin/japan_plates/plate_hoshizora",
						},
					},
					{
						Model = "models/xenosprops/jp_plate/jp_plate.mdl",
						Position = Vector( 0, 118.9, 18.2 ),
						Angles = Angle( 6.5, 90, 0 ),
						Scale = 0.89,
						BodyGroups = {
							["rear_seal"] = 0,
						},
						SubMaterials = {
							[0] = "rin/japan_plates/plate_hoshizora",
						},
					},
				}
			}
		}
	},
}