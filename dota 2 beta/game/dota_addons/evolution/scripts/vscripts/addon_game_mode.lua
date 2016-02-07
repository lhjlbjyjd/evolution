-- This is the entry-point to your game mode and should be used primarily to precache models/particles/sounds/etc

require('internal/util')
require('gamemode')

function Precache( context )
--[[
  This function is used to precache resources/units/items/abilities that will be needed
  for sure in your game and that will not be precached by hero selection.  When a hero
  is selected from the hero selection screen, the game will precache that hero's assets,
  any equipped cosmetics, and perform the data-driven precaching defined in that hero's
  precache{} block, as well as the precache{} block for any equipped abilities.

  See GameMode:PostLoadPrecache() in gamemode.lua for more information
  ]]

  local heroes = {
    "npc_dota_hero_ancient_apparition",
  "npc_dota_hero_antimage",
  "npc_dota_hero_axe",
  "npc_dota_hero_bane",
  "npc_dota_hero_beastmaster",
  "npc_dota_hero_bloodseeker",
  "npc_dota_hero_chen",
  "npc_dota_hero_crystal_maiden",
  "npc_dota_hero_dark_seer",
  "npc_dota_hero_dazzle" ,
  "npc_dota_hero_dragon_knight",
  "npc_dota_hero_doom_bringer",
  "npc_dota_hero_drow_ranger",
  "npc_dota_hero_earthshaker",
  "npc_dota_hero_enchantress",
  "npc_dota_hero_enigma",
  "npc_dota_hero_faceless_void",
  "npc_dota_hero_furion",
  "npc_dota_hero_juggernaut",
  "npc_dota_hero_kunkka",
  "npc_dota_hero_leshrac",
  "npc_dota_hero_lich",
  "npc_dota_hero_life_stealer",
  "npc_dota_hero_lina",
  "npc_dota_hero_lion",
  "npc_dota_hero_mirana",
  "npc_dota_hero_morphling",
  "npc_dota_hero_necrolyte",
  "npc_dota_hero_nevermore",
  "npc_dota_hero_night_stalker",
  "npc_dota_hero_omniknight",
  "npc_dota_hero_puck",
  "npc_dota_hero_pudge",
  "npc_dota_hero_pugna",
  "npc_dota_hero_rattletrap",
  "npc_dota_hero_razor",
  "npc_dota_hero_riki",
  "npc_dota_hero_sand_king",
  "npc_dota_hero_shadow_shaman",
  "npc_dota_hero_slardar",
  "npc_dota_hero_sniper",
  "npc_dota_hero_spectre",
  "npc_dota_hero_storm_spirit",
  "npc_dota_hero_sven",
  "npc_dota_hero_tidehunter",
  "npc_dota_hero_tinker",
  "npc_dota_hero_tiny",
  "npc_dota_hero_vengefulspirit",
  "npc_dota_hero_venomancer" ,
  "npc_dota_hero_viper",
  "npc_dota_hero_weaver",
  "npc_dota_hero_windrunner",
  "npc_dota_hero_witch_doctor",
  "npc_dota_hero_zuus",
  "npc_dota_hero_broodmother",
  "npc_dota_hero_skeleton_king",
  "npc_dota_hero_queenofpain",
  "npc_dota_hero_huskar",
  "npc_dota_hero_jakiro",
  "npc_dota_hero_batrider",
  "npc_dota_hero_warlock",
  "npc_dota_hero_alchemist",
  "npc_dota_hero_death_prophet",
  "npc_dota_hero_ursa",
  "npc_dota_hero_bounty_hunter",
  "npc_dota_hero_silencer",
  "npc_dota_hero_spirit_breaker",
  "npc_dota_hero_invoker",
  "npc_dota_hero_clinkz",
  "npc_dota_hero_obsidian_destroyer",
  "npc_dota_hero_shadow_demon",
  "npc_dota_hero_lycan",
  "npc_dota_hero_lone_druid",
  "npc_dota_hero_brewmaster",
  "npc_dota_hero_phantom_lancer",
  "npc_dota_hero_treant",
  "npc_dota_hero_ogre_magi",
  "npc_dota_hero_chaos_knight",
  "npc_dota_hero_phantom_assassin",
  "npc_dota_hero_gyrocopter",
  "npc_dota_hero_rubick",
  "npc_dota_hero_luna",
  "npc_dota_hero_wisp",
  "npc_dota_hero_disruptor",
  "npc_dota_hero_undying",
  "npc_dota_hero_templar_assassin",
  "npc_dota_hero_naga_siren",
  "npc_dota_hero_nyx_assassin",
  "npc_dota_hero_keeper_of_the_light",
  "npc_dota_hero_visage",
  "npc_dota_hero_meepo",
  "npc_dota_hero_magnataur",
  "npc_dota_hero_centaur",
  "npc_dota_hero_slark",
  "npc_dota_hero_shredder",
  "npc_dota_hero_medusa",
  "npc_dota_hero_troll_warlord",
  "npc_dota_hero_tusk",
  "npc_dota_hero_bristleback",
  "npc_dota_hero_skywrath_mage",
  "npc_dota_hero_elder_titan",
  "npc_dota_hero_abaddon",
  "npc_dota_hero_earth_spirit",
  "npc_dota_hero_ember_spirit",
  "npc_dota_hero_legion_commander",
  "npc_dota_hero_phoenix",
  "npc_dota_hero_terrorblade",
  "npc_dota_hero_techies",
  "npc_dota_hero_oracle",
  "npc_dota_hero_winter_wyvern",
  "npc_dota_hero_arc_warden"
}

  DebugPrint("[BAREBONES] Performing pre-load precache")

  -- Particles can be precached individually or by folder
  -- It it likely that precaching a single particle system will precache all of its children, but this may not be guaranteed
  --PrecacheResource("particle", "particles/econ/generic/generic_aoe_explosion_sphere_1/generic_aoe_explosion_sphere_1.vpcf", context)
  --PrecacheResource("particle_folder", "particles/test_particle", context)

  -- Models can also be precached by folder or individually
  -- PrecacheModel should generally used over PrecacheResource for individual models
  PrecacheModel("models/heroes/weaver/weaver_bug.vmdl", context)
  PrecacheModel("models/props_wildlife/wildlife_ladybug001.vmdl", context)

  -- Sounds can precached here like anything else
  --PrecacheResource("soundfile", "soundevents/game_sounds_heroes/game_sounds_gyrocopter.vsndevts", context)

  -- Entire items can be precached by name
  -- Abilities can also be precached in this way despite the name
  --PrecacheItemByNameSync("example_ability", context)
  --PrecacheItemByNameSync("item_example_item", context)

  -- Entire heroes (sound effects/voice/models/particles) can be precached with PrecacheUnitByNameSync
  -- Custom units from npc_units_custom.txt can also have all of their abilities and precache{} blocks precached in this way
  for _,v in pairs(heroes) do
    PrecacheUnitByNameSync(v, context)
  end
end

-- Create the game mode when we activate
function Activate()
  GameRules.GameMode = GameMode()
  GameRules.GameMode:InitGameMode()
end

function GameMode:InitGameMode()
  print( "EVO is loaded." )
  local xp_table = {}
  for i=1,5 do
    xp_table[i] = i * 100
  end
  GameRules:SetHeroSelectionTime( 0.0 )
  --GameRules:GetGameModeEntity():SetThink( "OnThink", self, "GlobalThink", 2 )
  GameRules:SetUseUniversalShopMode( true )
  GameRules:SetHeroRespawnEnabled( true )
  GameRules:SetPreGameTime( 5.0 )
  GameRules:SetPostGameTime( 60.0 )
  GameRules:SetTreeRegrowTime( 60.0 )
  GameRules:SetHeroMinimapIconScale( 0.7 )
  GameRules:SetCreepMinimapIconScale( 0.7 )
  GameRules:SetRuneMinimapIconScale( 0.7 )
  GameRules:SetGoldTickTime( 0.0 )
  GameRules:SetGoldPerTick( 0.0 )
  GameRules:GetGameModeEntity():SetCustomGameForceHero( "npc_dota_hero_wisp" )
  GameRules:GetGameModeEntity():SetRemoveIllusionsOnDeath( true )
  GameRules:GetGameModeEntity():SetTopBarTeamValuesOverride( true )
  GameRules:GetGameModeEntity():SetTopBarTeamValuesVisible( false )
  GameRules:GetGameModeEntity():SetCameraDistanceOverride(1600)
  GameRules:GetGameModeEntity():SetUseCustomHeroLevels ( true )
  GameRules:GetGameModeEntity():SetCustomHeroMaxLevel(5)
  GameRules:GetGameModeEntity():SetCustomXPRequiredToReachNextLevel(xp_table)
  ListenToGameEvent('npc_spawned', Dynamic_Wrap(GameMode, 'OnNPCSpawned'), self)
  ListenToGameEvent('entity_hurt', Dynamic_Wrap(GameMode, 'OnEntityHurt'), self)
  LinkLuaModifier("modifier_no_collision", LUA_MODIFIER_MOTION_NONE)
  GameMode:PreGameSetup()
end

function GameMode:OnNPCSpawned( keys )
  local npc = EntIndexToHScript(keys.entindex)
end

function GameMode:PreGameSetup()
  for i=1,70 do
    local random_x = RandomInt(-1000, 1000)
    local random_y = RandomInt(-1000, 1000)
    local offset = Vector(random_x, random_y, 0)
    CreateUnitByName( "first_meal", Entities:FindByName( nil, "first_meal_spawn" ):GetAbsOrigin()+offset , true, nil, nil, DOTA_TEAM_BADGUYS )
  end
  for _,v in pairs(Entities:FindAllByModel("models/particle/meteor.vmdl")) do
    v:AddNewModifier(v, self, "modifier_no_collision", nil)
  end
end 

function GameMode:OnEntityHurt( keys )
  local entity = EntIndexToHScript(keys.entindex_killed)
  local attacker
  if keys.entindex_attacker ~= nil then
    attacker = EntIndexToHScript(keys.entindex_attacker)
  end
  if entity:GetModelName() == "models/particle/meteor.vmdl" then
    GameMode:FirstMealHurt( entity, attacker )
  end    
end

function GameMode:GetReboundVector( data )
  local entity = data.entity
  local attacker = data.attacker
  local result = Vector(0,0,0)
  result.x = (entity:GetAbsOrigin().x) - (attacker:GetAbsOrigin().x)
  result.y = (entity:GetAbsOrigin().y) - (attacker:GetAbsOrigin().y)
  result = result + entity:GetAbsOrigin()
  return result
end

function GameMode:FirstMealHurt( entity, attacker )
  local data = {}
  data["entity"] = entity
  data["attacker"] = attacker
  entity:MoveToPosition(GameMode:GetReboundVector( data ))
  ParticleManager:CreateParticle("particles/winter_fx/healing_campfire_ward.vpcf", PATTACH_ABSORIGIN_FOLLOW , entity)
end