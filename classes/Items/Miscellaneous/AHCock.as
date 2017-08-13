﻿package classes.Items.Miscellaneous
{
	import classes.ItemSlotClass;
	import classes.GLOBAL;
	import classes.Creature;
	import classes.kGAMECLASS;
	import classes.Characters.PlayerCharacter;
	import classes.GameData.TooltipManager;
	import classes.StringUtil;
	
	public class AHCock extends ItemSlotClass
	{
		//constructor
		public function AHCock()
		{
			this._latestVersion = 2;
			//this.hasRandomProperties = true;
			
			this.quantity = 1;
			this.stackSize = 10;
			this.type = GLOBAL.SEXTOY;
			
			//Used on inventory buttons
			this.shortName = "A.H.Cock";
			
			//Regular name
			this.longName = "synth-phallus - horse";
			
			TooltipManager.addFullName(this.shortName, StringUtil.toTitleCase(this.longName));
			
			//Longass shit, not sure what used for yet.
			this.description = "a KihaCorp-branded synth-phallus modelled after a terran horse’s";
			
			//Displayed on tooltips during mouseovers
			this.tooltip = "KihaCorp’s popular companion droid line has numerous accessories and addons available for purchase across the galaxy. Some of the most popular are the hot-swappable genitals they’re equipped with, in particular variant phalli and vaginas.\n\nThis one is large-sized, designed to retract into a sheath when not in use or stretch fourteen inches long when fully inflated. It includes its own silicone reservoir and pumps to minimize impact on the android’s body shape during erections.";
			
			TooltipManager.addTooltip(this.shortName, this.tooltip);
			
			this.attackVerb = "";
			
			//Information
			this.basePrice = 15000;
			this.attack = 0;
			this.defense = 0;
			this.shieldDefense = 0;
			this.shields = 0;
			this.sexiness = 0;
			this.critBonus = 0;
			this.evasion = 0;
			this.fortification = 0;
			
			this.version = _latestVersion;
		}	
		//METHOD ACTING!
		override public function useFunction(target:Creature, usingCreature:Creature = null):Boolean
		{
			if(!kGAMECLASS.infiniteItems()) quantity++;
			if(target is PlayerCharacter) {
				//Consume:
				kGAMECLASS.clearOutput();
				if(kGAMECLASS.silly) kGAMECLASS.output("Professor Oak: ");
				kGAMECLASS.output("You cannot use this now.");
			}
			else {
				kGAMECLASS.clearOutput();
				kGAMECLASS.output(target.capitalA + target.short + " cannot use this.");
			}
			return true;
		}
		
		public function UpgradeVersion1(d:Object):void
		{
			delete d.bonusResistances;
			delete d.bonusLustVuln;
			delete d.damage;
			delete d.damageType;
		}
	}
}
