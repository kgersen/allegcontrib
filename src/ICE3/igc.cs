using System;
using System.IO;
using System.Collections;

namespace IGC
{
    public enum ObjectID : short { };
    public enum AsteroidID : short { };
    public enum WarpID : short { };
    public enum MissionID : short { };
    public enum ObjectType : short { };
    public enum SideID : short { };
    public enum SectorID : short { };
    public enum ShipID : short { };
    public enum StationID: short { };
    public enum BuoyID : short { };
    public enum MineID : short { };
    public enum ProbeID : short { };
    public enum MissileID : short { };
    public enum TreasureID : short { };

    public enum STAGE // Keep in sync with AGCGameStage in AGCIDL.h
    {
        STAGE_NOTSTARTED,
        STAGE_STARTING,
        STAGE_STARTED,
        STAGE_OVER,
        STAGE_TERMINATE
    };

    public class TechTreeBitMask { };

    public class Time { };

    public class DamageTrack { };

    public struct MissionParams {};
    public struct GlobalAttributeSet {};
    //public enum AsteroidAbilityBitMask
    //{
    //    MineHe3      = 0x01,      //Has minable ore of some type (all mutually exclusive)
    //    MineLotsHe3  = 0x02,
    //    MineGold     = 0x04,

    //    Buildable    = 0x08,      //Buildings can be built on it
    //    Special      = 0x10      //Special buildings can be built on it
    //};
    //public class HitPoints
    //{
    //    float hitpoints;
    //}   
    //public class SoundID
    //{
    //    System.Int16 _soundid;
    //};
    //public class PartMask
    //{
    //    System.Int16 _partmask;
    //};
    //public class FileName // c_cbFileName string
    //{
    //};
    //public class LocAbrev // c_cbLocAbrev string
    //{ 
    //};
    //public struct  HardpointData
    //{
    //    SoundID     interiorSound;
    //    SoundID     turnSound;
    //    FileName    frameName;
    //    LocAbrev    locationAbreviation;
    //    PartMask    partMask;
    //    bool        bFixed;
    //};

    //public struct AsteroidDef
    //{
    //    float                   ore;
    //    float                   oreMax;
    //    AsteroidAbilityBitMask  aabmCapabilities;
    //    AsteroidID              asteroidID;
    //    HitPoints               hitpoints;
    //    short                   radius;
    //    FileName    modelName;
    //    FileName    textureName;
    //    FileName    iconName;
    //};

    //public struct  WarpDef
    //{
    //    WarpID              warpID;
    //    WarpID              destinationID;
    //    short               radius;
    //    FileName            textureName;
    //    FileName            iconName;
    //};

    public interface IIgcSite { };

    public interface IstaticIGC { };
    public class CstaticIGC : IstaticIGC { };

    public interface ImissionIGC : IstaticIGC 
    {
        int                     Export(System.Int64 maskTypes,
                                       byte[]    pdata);
        void                    Import(Time      now,
                                       System.Int64 maskTypes,
                                       byte[]    pdata,
                                       int       datasize);

        MissionID               GetMissionID();
        void                    SetMissionID(MissionID  mid);

        void                    Initialize(Time now, IIgcSite pIgcSite);
        void                    Terminate();
        void                    Update(Time now);

        IIgcSite               GetIgcSite();

        IbaseIGC               CreateObject(Time now, ObjectType objectID,
                                             byte[] data, int dataSize);

        ImodelIGC              GetModel(ObjectType type, ObjectID id);
        IbaseIGC               GetBase(ObjectType type, ObjectID id);

        DamageTrack            CreateDamageTrack();

        void                    AddSide(IsideIGC s);
        void                    DeleteSide(IsideIGC s);
        IsideIGC                GetSide(SideID sideID);
        IsideIGC[]              GetSides();

        void                    AddCluster(IclusterIGC c);
        void                    DeleteCluster(IclusterIGC c);
        IclusterIGC             GetCluster(SectorID clusterID);
        IclusterIGC[]           GetClusters();

        void                    AddShip(IshipIGC s);
        void                    DeleteShip(IshipIGC s);
        IshipIGC                GetShip(ShipID shipID);
        IshipIGC[]              GetShips();

        void                    AddStation(IstationIGC s);
        void                    DeleteStation(IstationIGC s);
        IstationIGC             GetStation(StationID stationID);
        IstationIGC[]           GetStations();

        void                    AddAsteroid(IasteroidIGC p);
        void                    DeleteAsteroid(IasteroidIGC p);
        IasteroidIGC            GetAsteroid(AsteroidID asteroidID);
        IasteroidIGC[]          GetAsteroids();

        void                    AddWarp(IwarpIGC w);
        void                    DeleteWarp(IwarpIGC w);
        IwarpIGC                GetWarp(WarpID warpID);
        IwarpIGC[]              GetWarps();

        void                    AddBuoy(IbuoyIGC t);
        void                    DeleteBuoy(IbuoyIGC t);
        IbuoyIGC                GetBuoy(BuoyID buoyID);
        IbuoyIGC[]              GetBuoys();

        void                    AddTreasure(ItreasureIGC t);
        void                    DeleteTreasure(ItreasureIGC t);
        ItreasureIGC            GetTreasure(TreasureID treasureID);
        ItreasureIGC[]          GetTreasures();

        void                    AddMine(ImineIGC ms);
        void                    DeleteMine(ImineIGC m);
        ImineIGC                GetMine(MineID mineID);
        ImineIGC[]              GetMines();

        void                    AddProbe(IprobeIGC ms);
        void                    DeleteProbe(IprobeIGC m);
        IprobeIGC               GetProbe(ProbeID probeID);
        IprobeIGC[]             GetProbes();

        IpartIGC               CreatePart(Time             now,
                                           IpartTypeIGC    ppt);

        BuoyID                  GenerateNewBuoyID();
        ShipID                  GenerateNewShipID();
        AsteroidID              GenerateNewAsteroidID();
        StationID               GenerateNewStationID();
        TreasureID              GenerateNewTreasureID();
        MineID                  GenerateNewMineID();
        ProbeID                 GenerateNewProbeID();
        MissileID               GenerateNewMissileID();

        void                    SetMissionStage(STAGE  st);
        STAGE                   GetMissionStage();
        void                    EnterGame();

        void                    UpdateSides(Time now,
                                            MissionParams  pmp,
                                            string[]  sideNames);
        void                    ResetMission();
        void                    GenerateMission(Time                     now,
                                                MissionParams     pmp,
                                                TechTreeBitMask         pttbmShouldOverride,
                                                TechTreeBitMask         pttbmOverrideValue);
        void                    GenerateTreasure(Time           now,
                                                 IclusterIGC   pcluster,
                                                 short          tsi);
        void                    SetPrivateData(object dwPrivate);
        object                  GetPrivateData();

        Time                    GetLastUpdate();

        MissionParams           GetMissionParams();
        void                    SetMissionParams(MissionParams pmp);
        void                    SetStartTime(Time timeStart);

        //Warning these should never be called except from LoadIGCStaticCore
        CstaticIGC             GetStaticCore();
        void                   SetStaticCore(CstaticIGC   pStatic);

        short                  GetReplayCount();
        string                 GetContextName();
    };

    public interface IbaseIGC
    {
        ulong         Initialize(ImissionIGC pMission, Time now, byte[] data, int length);
        void            Terminate();
        void            Update(Time   now);

        //Exporting an object which doesn't support export is also bad.
        int Export(byte[] data);

        // GetUniqueID() is provided for convenience because AGC uses GetObjectType and GetObjectID often.
        int             GetUniqueID();
        ObjectType      GetObjectType();

        //Calling either of these methods on something that doesn't have either an object ID or a mission is bad.
        ObjectID       GetObjectID(); 
        ImissionIGC    GetMission();
    };

    public interface IcivilizationIGC : IbaseIGC
    {
         string             GetName();
         string             GetIconName();
         string             GetHUDName();
         IhullTypeIGC       GetLifepod();

         IstationTypeIGC    GetInitialStationType();

         TechTreeBitMask    GetBaseTechs();
         TechTreeBitMask    GetNoDevTechs();

         GlobalAttributeSet GetBaseAttributes();

         float              GetBonusMoney();
         float              GetIncomeMoney();
    };
    
    //public class CcivilizationIGC : IcivilizationIGC  { }

    public interface IclusterIGC : IbaseIGC { }
    public interface ImodelIGC : IbaseIGC  { }
    public interface IpartIGC : IbaseIGC   { }
    public interface IsideIGC : IbaseIGC   { }
    public interface ItreasureSetIGC : IbaseIGC  { }
    public interface ItypeIGC : IbaseIGC  { }

    public interface IbuoyIGC : ImodelIGC { }
    public interface IchaffIGC : ImodelIGC { }
    public interface IdamageIGC : ImodelIGC { }
    public interface ImineIGC : ImodelIGC { }
    public interface IprojectileIGC : ImodelIGC { }
    public interface ItreasureIGC : ImodelIGC { }
    public interface IwarpIGC : ImodelIGC { }

    public interface IasteroidIGC : IdamageIGC { }
    public interface IbuildingEffectIGC : IdamageIGC { }
    public interface ImissileIGC : IdamageIGC { }
    public interface IscannerIGC : IdamageIGC { }
    
    public interface IprobeIGC : IscannerIGC { }
    public interface IshipIGC : IscannerIGC { }
    public interface IstationIGC : IscannerIGC { }

    public interface IafterburnerIGC : IpartIGC { }
    public interface IcloakIGC : IpartIGC { }
    public interface IlauncherIGC : IpartIGC { }
    public interface IpackIGC : IpartIGC { }
    public interface IshieldIGC : IpartIGC { }
    public interface IweaponIGC : IpartIGC { }

    public interface IdispenserIGC : IlauncherIGC { }
    public interface ImagazineIGC : IlauncherIGC { }

    public interface IbuyableIGC : ItypeIGC { }
    public interface IexpendableTypeIGC : ItypeIGC { }
    public interface IprojectileTypeIGC : ItypeIGC { }

    public interface IbucketIGC : IbuyableIGC { }
    public interface IdevelopmentIGC : IbuyableIGC { }
    public interface IdroneTypeIGC : IbuyableIGC { }
    public interface IhullTypeIGC : IbuyableIGC { }
    public interface IpartTypeIGC : IbuyableIGC { }
    public interface IstationTypeIGC : IbuyableIGC { }
    public interface IlauncherTypeIGC : IpartTypeIGC { }

    public interface IchaffTypeIGC : IexpendableTypeIGC { }
    public interface ImineTypeIGC : IexpendableTypeIGC { }
    public interface ImissileTypeIGC : IexpendableTypeIGC { }
    public interface IprobeTypeIGC : IexpendableTypeIGC { }

}