using System;
using System.IO;
using System.Collections;
using AGCLib;

namespace ICE
{

	public struct SIGCCoreFactors
	{
		public float IGCF_ShipSpeed;
		public float IGCF_ShipAcceleration;
		public float IGCF_ShipAgility1;
		public float IGCF_ShipAgility2;
		public float IGCF_StationHull1;
		public float IGCF_StationHull2;
		public float IGCF_StationShield1;
		public float IGCF_StationShield2;
		public float IGCF_ShipHull;
		public float IGCF_ShipShield1;
		public float IGCF_ShipShield2;
		public float IGCF_ShipSensors;
		public float IGCF_ShipSignature ;
		public float IGCF_ShipEnergy ;
		public float IGCF_PWRange;
		public float IGCF_EWRange;
		public float IGCF_MissileTrack;
		public float IGCF_He3Speed;
		public float IGCF_He3Yield ;
		public float IGCF_StartingMoney;
		public float IGCF_Ripcord ;
		public float IGCF_PWDamage;
		public float IGCF_MissileDamage;
		public float IGCF_Cost;
		public float IGCF_ResearchTime;
		public void Read(BinaryReader br)
		{
			IGCF_ShipSpeed = br.ReadSingle();
			IGCF_ShipAcceleration = br.ReadSingle();
			IGCF_ShipAgility1 = br.ReadSingle();
			IGCF_ShipAgility2 = br.ReadSingle();
			IGCF_StationHull1 = br.ReadSingle();
			IGCF_StationHull2 = br.ReadSingle();
			IGCF_StationShield1 = br.ReadSingle();
			IGCF_StationShield2 = br.ReadSingle();
			IGCF_ShipHull = br.ReadSingle();
			IGCF_ShipShield1 = br.ReadSingle();
			IGCF_ShipShield2 = br.ReadSingle();
			IGCF_ShipSensors = br.ReadSingle();
			IGCF_ShipSignature  = br.ReadSingle();
			IGCF_ShipEnergy  = br.ReadSingle();
			IGCF_PWRange = br.ReadSingle();
			IGCF_EWRange = br.ReadSingle();
			IGCF_MissileTrack = br.ReadSingle();
			IGCF_He3Speed = br.ReadSingle();
			IGCF_He3Yield  = br.ReadSingle();
			IGCF_StartingMoney = br.ReadSingle();
			IGCF_Ripcord  = br.ReadSingle();
			IGCF_PWDamage = br.ReadSingle();
			IGCF_MissileDamage = br.ReadSingle();
			IGCF_Cost = br.ReadSingle();
			IGCF_ResearchTime = br.ReadSingle();
		}
	}
	public abstract class SIGCCoreObject
	{
		public short UID;
		public short overriding_UID;
		public string Name;//[25];
		public string Description;//[200];
		public string Model; //[13];
		public string Icon; //[13];
		public uint ResearchTime;
		public uint Cost;
		public byte[]TTpre;
		public byte[]TTdef;
		public byte[]TTlocal;
		// methods
		public SIGCCoreObject() { UID = -1;}
		public virtual bool AsLocal() {return false;}
		public string ReadString(BinaryReader br, int size)
		{
			string res = new string(br.ReadChars(size));
			int np = res.IndexOf('\x00');
			res.TrimEnd('\x00');
			if ( np != -1)
			{
				res = res.Remove(np,res.Length-np);
			}
			return res;
		}
		public void WriteString(BinaryWriter bw, string res, int size)
		{
			char [] ca = res.ToCharArray();
			bw.Write(ca);
			for (int i=ca.Length;i<size;i++)
				bw.Write('\x00');
		}
		// virtual methods - must implement
		public abstract void Read(BinaryReader br);
		public abstract void Write(BinaryWriter bw);
	}
	public class SIGCCoreStationType : SIGCCoreObject
	{
		public byte Group;
		public float stats_Sig; // sig multiplier
		public float stats_Hull; // hull
		public float stats_Shield; // shield
		public float stats_HullRepairRate; // hull repair rate
		public float stats_ShieldRepairRate; // shield repair rate
		public float stats_ScanRange; // scan range
		public uint stats_Income;
		public float stats_Scale; // scale
		public byte ACHull;
		public byte ACShield;
		public ushort AbilityBitMask; // (as in igc.h)
		public ushort BuildOn; // see IGCSTATIONF_BUILDON_* values
		public byte Type; // see IGCSTATION_TYPE_* value - capture related ?
		public short DroneUID; // drone uid
		public short []Sounds;//[13]
		public string Constructor; //[25];
		public override	bool AsLocal(){return true;}
		public override void  Read(BinaryReader br)
		{
			Cost = br.ReadUInt32();
			ResearchTime = br.ReadUInt32();
			Model = ReadString(br,13);
			br.ReadBytes(1);
			Icon = ReadString(br,13);
			Name = ReadString(br,25);
			Description = ReadString(br,200);
			Group = br.ReadByte();
			br.ReadBytes(1);
			TTpre = br.ReadBytes(50);
			TTdef = br.ReadBytes(50);
			br.ReadBytes(2);
			stats_Sig = br.ReadSingle();
			stats_Hull = br.ReadSingle();
			stats_Shield = br.ReadSingle();
			stats_HullRepairRate = br.ReadSingle();
			stats_ShieldRepairRate = br.ReadSingle();
			stats_ScanRange = br.ReadSingle();
			stats_Income = br.ReadUInt32();
			stats_Scale = br.ReadSingle();
			TTlocal = br.ReadBytes(50);
			UID = br.ReadInt16();
			overriding_UID = br.ReadInt16();
			ACHull = br.ReadByte();
			ACShield = br.ReadByte();
			AbilityBitMask = br.ReadUInt16();
			BuildOn = br.ReadUInt16();
			Type = br.ReadByte();
			br.ReadBytes(1);
			DroneUID = br.ReadInt16();
			Sounds = new short[13];
			for (int i=0;i<13;i++)
				Sounds[i] = br.ReadInt16();
			br.ReadBytes(13);
			Constructor = ReadString(br,25);
		}
		public override void Write(BinaryWriter bw) {}
	}

	public class SIGCCoreCiv : SIGCCoreObject
	{
		public float PayDayMod;
		public float BonusMoney;
		public SIGCCoreFactors factors;
		public ushort lifepod; // lifepod ID
		public ushort gar_uid; // uid in StationType (or last "base" uid)
		public override void Read(BinaryReader br)
		{
			PayDayMod = br.ReadSingle();
			BonusMoney = br.ReadSingle();
			Name = ReadString(br,25);
			Model = ReadString(br,13);
			Icon = ReadString(br,13);
			TTpre = br.ReadBytes(50);
			TTdef = br.ReadBytes(50);
			br.ReadBytes(1);
			factors.Read(br);
			lifepod = br.ReadUInt16();
			UID = br.ReadInt16();
			gar_uid = br.ReadUInt16();
			br.ReadBytes(2);
		}	
		public override void Write(BinaryWriter bw) {}	
	}

	public class SIGCCoreDevel : SIGCCoreObject
	{
		public byte root_tree;// tree root (0=construction,1=garrison,2=sup,3=tac,4=exp,5=sy)
		public SIGCCoreFactors factors;
		public ushort Sound; // sound
		public override void Read(BinaryReader br)
		{
			Cost = br.ReadUInt32();
			ResearchTime = br.ReadUInt32();
			Model = ReadString(br,13);
			br.ReadBytes(1);
			Icon = ReadString(br,13);
			Name = ReadString(br,25);
			Description = ReadString(br,200);
			br.ReadBytes(1);
			root_tree = br.ReadByte();
			TTpre = br.ReadBytes(50);
			TTdef = br.ReadBytes(50);
			br.ReadBytes(2);
			factors.Read(br);
			UID = br.ReadInt16();
			Sound = br.ReadUInt16();
		}
		public override void Write(BinaryWriter bw) {}	
	} 

	public class SIGCCoreShip : SIGCCoreObject
	{
		public sbyte group; 
		public float stats_mass; // mass
		public float stats_sig; // sig%
		public float stats_speed; // speed
		public float stats_MaxRollRate; // SAX = MaxRollRate in radians
		public float stats_MaxPitchRate; // SAY = MaxPitchRate in radians
		public float stats_MaxYawRate; // SAZ = MaxYawRate in radians
		public float stats_DriftRoll; // SBX = DriftRoll (unit ?)
		public float stats_DriftPitch; // SBY = DriftPitch (unit ?) 
		public float stats_DriftYaw; // SBZ = DriftYaw  (unit ?)
		public float stats_Thrust; // max thrust
		public float stats_STM; // STM (side thrust multiplier)
		public float stats_RTM; // RTM (reverse thrust multiplier)
		public float stats_scan; // scan
		public float stats_fuel; // fuel
		public float stats_LockMod; // lock mode
		public float stats_Scale; // scale
		public float stats_Energy; // energy
		public float stats_Recharge; // recharge
		public float stats_RipTime; // rip time
		public float stats_RipCost; // rip cost
		public ushort stats_CapAmmo; // ammo capacity
		public byte nb_parts; // part size = 30
		public byte mnt_nbwpslots;
		public float stats_HP; 
		public ushort AC;
		public ushort stats_CapMissile; // missiles capacity
		public ushort stats_CapPack; // pack capacity
		public ushort stats_CapCM; // CM capacity
		public short []DefLoadout;// -1 or part uid
		public ushort HullAbility;
		public ushort []CanUse; // usage masks,see IGCShipUseMasks
		public ushort Sound_Interior;
		public ushort Sound_Exterior;
		public ushort Sound_ThrustInterior;
		public ushort Sound_ThrustExterior;
		public ushort Sound_TurnInterior;
		public ushort Sound_TurnExterior;
		public ArrayList Parts; // type = SIGCCoreShipMP
		//
		public const int cMaxParts = 14;
		public const int cMaxUse = 8;
		public SIGCCoreShip()
		{
			DefLoadout = new short[cMaxParts];
			CanUse = new ushort[cMaxUse];
			Parts = new ArrayList();
		}
		public override void Read(BinaryReader br)
		{
			Cost = br.ReadUInt32();
			br.ReadBytes(4);
			Model = ReadString(br,13);
			br.ReadBytes(1);
			Icon = ReadString(br,13);
			Name = ReadString(br,25);
			Description = ReadString(br,200);
			br.ReadBytes(1);
			group = br.ReadSByte();
			TTpre = br.ReadBytes(50);
			TTdef = br.ReadBytes(50);
			br.ReadBytes(2);
			stats_mass = br.ReadSingle(); 
			stats_sig = br.ReadSingle(); 
			stats_speed = br.ReadSingle(); 
			stats_MaxRollRate = br.ReadSingle(); 
			stats_MaxPitchRate = br.ReadSingle(); 
			stats_MaxYawRate = br.ReadSingle(); 
			stats_DriftRoll = br.ReadSingle(); 
			stats_DriftPitch = br.ReadSingle(); 
			stats_DriftYaw = br.ReadSingle(); 
			stats_Thrust = br.ReadSingle(); 
			stats_STM = br.ReadSingle(); 
			stats_RTM = br.ReadSingle(); 
			stats_scan = br.ReadSingle(); 
			stats_fuel = br.ReadSingle(); 
			stats_LockMod = br.ReadSingle(); 
			stats_Scale = br.ReadSingle(); 
			stats_Energy = br.ReadSingle(); 
			stats_Recharge = br.ReadSingle(); 
			stats_RipTime = br.ReadSingle(); 
			stats_RipCost = br.ReadSingle(); 
			stats_CapAmmo = br.ReadUInt16();
			UID = br.ReadInt16();
			overriding_UID = br.ReadInt16();
			nb_parts = br.ReadByte();
			mnt_nbwpslots = br.ReadByte();
			stats_HP = br.ReadSingle();
			br.ReadBytes(2); // 1C 02
			AC = br.ReadUInt16();
			stats_CapMissile = br.ReadUInt16();
			stats_CapPack = br.ReadUInt16();
			stats_CapCM = br.ReadUInt16();
			for (int i=0;i<cMaxParts;i++)
				DefLoadout[i] = br.ReadInt16();
			HullAbility = br.ReadUInt16();
			br.ReadBytes(14); // all zero
			for (int i=0;i<cMaxUse;i++)
				CanUse[i] = br.ReadUInt16();
			Sound_Interior = br.ReadUInt16();
			Sound_Exterior = br.ReadUInt16();
			Sound_ThrustInterior = br.ReadUInt16();
			Sound_ThrustExterior = br.ReadUInt16();
			Sound_TurnInterior = br.ReadUInt16();
			Sound_TurnExterior = br.ReadUInt16();
			br.ReadBytes(2); // all zero
			for (int i=0;i<nb_parts;i++)
			{
				SIGCCoreShipMP p;
				p.Sound_Gunner = br.ReadUInt16();
				p.Sound_Interior = br.ReadUInt16();
				p.Position = ReadString(br,13);
				br.ReadBytes(9); // 30 00 ... 00
				p.part_mask = br.ReadUInt16();
				p.part_type =  br.ReadUInt16();
				Parts.Add(p);
			}
		}
		public override void Write(BinaryWriter bw) {}	
	}

	public struct SIGCCoreShipMP // size 30
	{
		public ushort Sound_Gunner; // sound
		public ushort Sound_Interior; // sound
		public string Position;
		//UCHAR todo[9];//30 00 .. 00
		public ushort part_mask;//usemask of weapon
		public ushort part_type;//1=normal, 0=other player (turret).
	}

	public class SIGCCoreProjectile: SIGCCoreObject
	{
		public float percentRed;
		public float percentGreen;
		public float percentBlue;
		public float percentAlpha;
		public float stats_Radius; // particle size (radius)
		public float stats_RateRotation; // rate rotation (?)
		public string  file_model; // ALL '0' = file model
		public string  file_texture; // = file texture
		public float stats_Damage; // regular damange per shot
		public float stats_AreaDamage; // area damange per shot
		public float stats_AreaDamageRadius; // area damage radius
		public float stats_SpeedMax; // speed
		public float stats_LifeSpan; // life span
		public byte DM;
		public byte stats_ss1; // absolute speed = 1
		public byte stats_ss2; // directional = 1
		public float stats_s8; // Width OverHeigth
		public ushort ambient_sound;
		public override void Read(BinaryReader br)
		{
			percentRed = br.ReadSingle();
			percentGreen = br.ReadSingle();
			percentBlue = br.ReadSingle();
			percentAlpha = br.ReadSingle();
			stats_Radius = br.ReadSingle();
			stats_RateRotation = br.ReadSingle();
			file_model = ReadString(br,13);
			file_texture = ReadString(br,13);
			br.ReadBytes(2);
			stats_Damage = br.ReadSingle();
			stats_AreaDamage = br.ReadSingle();
			stats_AreaDamageRadius = br.ReadSingle();
			stats_SpeedMax = br.ReadSingle();
			stats_LifeSpan = br.ReadSingle();
			UID = br.ReadInt16();
			DM = br.ReadByte();
			stats_ss1 = br.ReadByte();
			stats_ss2 = br.ReadByte();
			br.ReadBytes(3);
			stats_s8 = br.ReadSingle();
			ambient_sound = br.ReadUInt16();
			br.ReadBytes(2);
		}
		public override void Write(BinaryWriter bw) {}
	}

	public class SIGCCorePart: SIGCCoreObject
	{
		public short Group;
		public float stats_GS1; // GS1
		public float stats_Sig;
		public short Type; // 1 = weapon, 2 = shield, 5 = cloak, 7 = after, 6 = default
		public ushort UseMask;
		public string Slot;
		public const long lTypePosition = 376;
		public override void Read(BinaryReader br)
		{
			br.ReadBytes(8);
			Model = ReadString(br,13);
			br.ReadBytes(1);
			Icon = ReadString(br,13);
			Name = ReadString(br,25);
			Description = ReadString(br,200);
			Group = br.ReadInt16();
			TTpre = br.ReadBytes(50);
			TTdef = br.ReadBytes(50);
			br.ReadBytes(2);
			stats_GS1 = br.ReadSingle();
			stats_Sig = br.ReadSingle();
			UID = br.ReadInt16();
			overriding_UID = br.ReadInt16();
			Type = br.ReadInt16();
			UseMask = br.ReadUInt16();
			Slot = ReadString(br,13);
			br.ReadBytes(1);
			br.ReadBytes(2);
		}
		public override void Write(BinaryWriter bw) {}
	}
	public class SIGCCorePack : SIGCCorePart
	{
		public byte PackType;
		public ushort PackQuantity;
		public void ReadPack(BinaryReader br)
		{
			Read(br);
			PackType = br.ReadByte();
			br.ReadBytes(1);
			PackQuantity = br.ReadUInt16();
		}
 	}

	public class SIGCCoreWeapon : SIGCCorePart
	{
		public float WepTimeReady;
		public float WepShotInterval;
		public float WepEnergy;
		public float WepSpread;
		public ushort WepAmmo;
		public ushort WepProjectileUID;
		public ushort WepSoundActivation;
		public ushort WepSoundShot;
		public ushort WepSoundBurst;
		public void ReadWeapon(BinaryReader br)
		{
			Read(br);
			WepTimeReady = br.ReadSingle();
			WepShotInterval = br.ReadSingle();
			WepEnergy = br.ReadSingle();
			WepSpread = br.ReadSingle();
			WepAmmo = br.ReadUInt16();
			WepProjectileUID = br.ReadUInt16();
			WepSoundActivation = br.ReadUInt16();
			WepSoundShot = br.ReadUInt16();
			WepSoundBurst = br.ReadUInt16();
			br.ReadBytes(2);
		}
	}

	public class SIGCCoreShield : SIGCCorePart
	{
		float ShldRecharge; //Recharge rate
		float ShldHitPoints; //Hitpoints
		byte ShldAC; // armor class
		ushort ShldSoundActivate;//Activate sound
		ushort ShldSoundDesactivate;//Desactivate sound
		public void ReadShield(BinaryReader br)
		{
			Read(br);
			ShldRecharge = br.ReadSingle();
			ShldHitPoints = br.ReadSingle();
			ShldAC = br.ReadByte();
			br.ReadBytes(1);
			ShldSoundActivate = br.ReadUInt16();
			ShldSoundDesactivate = br.ReadUInt16();
			br.ReadBytes(2);
		}
	}
	
	public class SIGCCoreAftB : SIGCCorePart
	{
		float AftBRate; // Rate of consumption
		float AftBThrust; // Thrust amount
		float AftBAccel; // % acceleration
		float AftBRelease; // Release duration
		ushort AftBSoundActivate;//Activate sound
		ushort AftBSoundDesactivate;//Desactivate sound
		public void ReadAft(BinaryReader br)
		{
			Read(br);
			AftBRate = br.ReadSingle();
			AftBThrust = br.ReadSingle();
			AftBAccel = br.ReadSingle();
			AftBRelease = br.ReadSingle();
			AftBSoundActivate = br.ReadUInt16();
			AftBSoundDesactivate = br.ReadUInt16();
		}
	}

	public class SIGCCoreCloak : SIGCCorePart
	{
		float ClkDrain; // Energy drain
		float ClkSig; // Sig reduction
		float ClkActivateDuration; // Activation duration
		float ClkReleaseDuration; // Release duration
		ushort ClkSoundActivate;//Activate sound
		ushort ClkSoundDesactivate;//Desactivate sound
		public void ReadCloak(BinaryReader br)
		{
			Read(br);
			ClkDrain = br.ReadSingle();
			ClkSig = br.ReadSingle();
			ClkActivateDuration = br.ReadSingle();
			ClkReleaseDuration = br.ReadSingle();
			ClkSoundActivate = br.ReadUInt16();
			ClkSoundDesactivate = br.ReadUInt16();
		}
	}

	public class SIGCCoreMagazine : SIGCCoreObject
	{
		short Amount;
		short LaunchCount;
		short PartID;
		string Slot;
		public override void Read(BinaryReader br)
		{
			Amount = br.ReadInt16();
			UID = br.ReadInt16();
			overriding_UID= br.ReadInt16();
			LaunchCount = br.ReadInt16();
			PartID = br.ReadInt16();
			Slot = ReadString(br,13);
			br.ReadBytes(1);
        }
		public override void Write(BinaryWriter bw) {}
	}

	// common part of Mines, Probes, Missiles and Probes
	public class SIGCCoreExpendable : SIGCCoreObject
	{
		public float pcRed; // all zero = percent RGBA
		public float pcGreen;
		public float pcBlue;
		public float pcAlpha;
		public float Radius; // scale
		public float RateRotation; // rate rotation
		public byte  GroupID;
		public float LoadTime; // load time
		public float LifeSpan;
		public float ShipSig;  // ship sig%
		public float Mass; // mass
		public ushort PartMask; //usemask
		public ushort ExpandableSize; //cargo payload
		public ushort Capabilities; // see CapaFlags
		public float HitPoints; // hitpoints
		public byte AC; // OB
		public float InstanceSignature; // sig when floating in space
		public string InstanceModel; // model when floating in space
		public string InstanceIcon; // icon when floating in space
		public ushort SecondsToBuild; // usually 0

		public override void Read(BinaryReader br){}
		public override void Write(BinaryWriter bw) {}
	}
	public class SIGCCoreChaff : SIGCCoreExpendable 
	{
		public float Strength;
		public override void Read(BinaryReader br){}
		public override void Write(BinaryWriter bw) {}
	}
	public class SIGCCoreMines : SIGCCoreExpendable 
	{
		public float PlacementRadius;
		public float Power; // damage
		//byte  MunitionCount; // ?
		public float stats_s7;
		public byte DM; // 10
		public override void Read(BinaryReader br){}
		public override void Write(BinaryWriter bw) {}
	}
	public class SIGCCoreMissiles : SIGCCoreExpendable 
	{
		public float Acceleration;
		public float TurnRate;
		public float InitialSpeed;
		public float ArmTime;
		public float LockTime;
		public float ReadyTime;
		public float ChaffResistance;
		public float Dispersion; // salvo ratio
		public float LockAngle; // lock radius
		public float Power; // damage
		public float BlastPower; // 0 Checked
		public float BlastRadius;
		public float WidthOverHeight; // 0 Checked
		public byte  IsDirectional;
		public ushort DM; // damage type
		public ushort LaunchSound;
		public ushort FlightSound;
		public override void Read(BinaryReader br){}
		public override void Write(BinaryWriter bw) {}
	}
	public class SIGCCoreProbes : SIGCCoreExpendable 
	{
		public override void Read(BinaryReader br){}
		public override void Write(BinaryWriter bw) {}
	}
	/// <summary>
	/// Summary description for igccore.
	/// </summary>
	public class IGCCore
	{
		public uint Version;
		public ArrayList aCivs;
		public ArrayList aDevels;
		public ArrayList aShips;
		public ArrayList aStations;
		public ArrayList aProjectiles;
		public ArrayList aParts;
		public ArrayList aMags;

		public IGCCore()
		{
			//
			// TODO: Add constructor logic here
			//
			aCivs        = new ArrayList();
			aDevels      = new ArrayList();
			aShips       = new ArrayList();
			aStations    = new ArrayList();
			aProjectiles = new ArrayList();
			aParts		 = new ArrayList();
			aMags        = new ArrayList();
		}
		public void Reset()
		{
			Version = 0;
			aCivs.RemoveRange(0,aCivs.Count);
			aDevels.RemoveRange(0,aDevels.Count);
			aShips.RemoveRange(0,aShips.Count);
			aStations.RemoveRange(0,aStations.Count);
			aProjectiles.RemoveRange(0,aProjectiles.Count);
			aParts.RemoveRange(0,aParts.Count);
			aMags.RemoveRange(0,aMags.Count);
		}
		public bool Read(string sFileName)
		{
			Reset();
			FileStream cf;
			try 
			{
				cf = new FileStream(sFileName,FileMode.Open, FileAccess.Read, FileShare.Read);
			}
			catch
			{
				return false;
			}
			BinaryReader br = new BinaryReader(cf);
			Version = br.ReadUInt32();
			int TotalSize = br.ReadInt32();
			if (TotalSize != (cf.Length-8))
			{
				br.Close();
				cf.Close();
				return false;
			}
			while (true)
			{
				try
				{
					short tag = br.ReadInt16();
					int tagsize = br.ReadInt32();
					switch (tag)
					{
						case (short)AGCLib.AGCObjectType.AGC_Civilization:
						{
							SIGCCoreCiv civ = new SIGCCoreCiv();
							civ.Read(br);
							aCivs.Add(civ);
							break;
						}
						case (short)AGCLib.AGCObjectType.AGC_Development:
						{
							SIGCCoreDevel devel = new SIGCCoreDevel();
							devel.Read(br);
							aDevels.Add(devel);
							break;
						}
						case (short)AGCLib.AGCObjectType.AGC_StationType:
						{
							SIGCCoreStationType station = new SIGCCoreStationType();
							station.Read(br);
							aStations.Add(station);
							break;
						}
						case (short)AGCLib.AGCObjectType.AGC_BucketStart:
						{
							SIGCCoreShip ship = new SIGCCoreShip();
							ship.Read(br);
							aShips.Add(ship);
							break;
						}
						case (short)AGCLib.AGCObjectType.AGC_ProjectileType:
						{
							SIGCCoreProjectile proj = new SIGCCoreProjectile();
							proj.Read(br);
							aProjectiles.Add(proj);
							break;
						}
						case (short)AGCLib.AGCObjectType.AGC_PartType:
						{
							if (tagsize == 0x18)
							{
								SIGCCoreMagazine mag = new SIGCCoreMagazine();
								mag.Read(br);
								aMags.Add(mag);
							}
							else
							{
								// seek Type, switch and read
								long pos = br.BaseStream.Position;
								br.BaseStream.Seek(SIGCCorePart.lTypePosition,SeekOrigin.Current);
								short Type = br.ReadInt16();
								pos = br.BaseStream.Seek(pos,SeekOrigin.Begin);
								SIGCCorePart part = null;
								switch (Type)
								{
									case (short)AGCLib.AGCEquipmentType.AGCEquipmentType_Pack:
									{
										SIGCCorePack pack = new SIGCCorePack();
										pack.ReadPack(br);
										part = pack;
										break;
									}
									case (short)AGCLib.AGCEquipmentType.AGCEquipmentType_Weapon:
									{
										SIGCCoreWeapon wep = new SIGCCoreWeapon();
										wep.ReadWeapon(br);
										part = wep;
										break;
									}
									case (short)AGCLib.AGCEquipmentType.AGCEquipmentType_Shield:
									{
										SIGCCoreShield shl = new SIGCCoreShield();
										shl.ReadShield(br);
										part = shl;
										break;
									}
									case (short)AGCLib.AGCEquipmentType.AGCEquipmentType_Afterburner:
									{
										SIGCCoreAftB aft = new SIGCCoreAftB();
										aft.ReadAft(br);
										part = aft;
										break;
									}
									case (short)AGCLib.AGCEquipmentType.AGCEquipmentType_Cloak:
									{
										SIGCCoreCloak clk = new SIGCCoreCloak();
										clk.ReadCloak(br);
										part = clk;
										break;
									}
									default:
									{
										br.ReadBytes(tagsize);//-396
										break;
									}
								}
								if (part != null)
									aParts.Add(part);
							}
							break;
						}
						default:
						{
							br.ReadBytes(tagsize);
							break;
						}
					}
				}
				catch (EndOfStreamException )
				{
					br.Close();
					cf.Close();
					return true;
				}
//				catch 
//				{
//					br.Close();
//					cf.Close();
//					return false;
//				}
			}
		}
	}
}
