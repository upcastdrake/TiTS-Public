﻿package classes.Items.Stories
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.Creature;
	import classes.kGAMECLASS;
	import classes.Characters.PlayerCharacter;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	import classes.Engine.Combat.inCombat;
	import classes.GameData.CodexManager;
	
	public class StolenGoods extends ItemSlotClass
	{
		//constructor
		public function StolenGoods()
		{
			this._latestVersion = 1;
			
			this.quantity = 1;
			this.stackSize = 10;
			this.type = GLOBAL.GADGET;
			
			//Used on inventory buttons
			this.shortName = "A Story";
			
			//Regular name
			this.longName = "story download code for “Stolen Goods”";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a story download code for “Stolen Goods”";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "Using this item will add the story “Stolen Goods” to your Codex’s fiction section.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "";
			
			//Information
			this.basePrice = 100;
			this.attack = 0;
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 0;
			this.critBonus = 0;
			this.evasion = 0;
			this.fortification = 0;
			
			this.combatUsable = false;
			this.targetsSelf = false;
			
			this.version = _latestVersion;
		}
		
		//METHOD ACTING!
		override public function useFunction(target:Creature, usingCreature:Creature = null):Boolean
		{
			if(target is PlayerCharacter)
			{
				kGAMECLASS.clearOutput();
				//Consume:
				if(CodexManager.entryUnlocked("Stolen Goods")) kGAMECLASS.output("You realize that you already have this story and toss out the useless code.");
				else
				{
					kGAMECLASS.output("You scan the code with your Codex, unlocking “Stolen Goods” in your Codex’s fiction section.");
					CodexManager.unlockEntry("Stolen Goods");
				}
			}
			else
			{
				kGAMECLASS.output("Nope.");
			}
			return false;
		}
	}
}
