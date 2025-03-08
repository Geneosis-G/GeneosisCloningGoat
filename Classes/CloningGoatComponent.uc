class CloningGoatComponent extends GGMutatorComponent;

var GGGoat gMe;
var GGMutator myMut;

/**
 * See super.
 */
function AttachToPlayer( GGGoat goat, optional GGMutator owningMutator )
{
	super.AttachToPlayer(goat, owningMutator);

	if(mGoat != none)
	{
		gMe=goat;
		myMut=owningMutator;
	}
}

function KeyState( name newKey, EKeyState keyState, PlayerController PCOwner )
{
	local GGPlayerInputGame localInput;

	if(PCOwner != gMe.Controller)
		return;

	localInput = GGPlayerInputGame( PCOwner.PlayerInput );

	if( keyState == KS_Down )
	{
		if( localInput.IsKeyIsPressed( "GBA_Special", string( newKey ) ) )
		{
			if(gMe.mGrabbedItem != none)
			{
				CloneItem(gMe.mGrabbedItem, gMe.DrawScale);
			}
		}
	}
}

/*
 * Clone the item and apply the scale to it
 */
function CloneItem(Actor item, float scale)
{
	local GGPawn pawn, cPawn;

	local GGGoat goat;
	local GGPawnJoust pawnJ;
	local GGGoatMMO goatMMO;
	local GGGoatZombieGameMode goatZGM;
	local GGGoatZombieGameModeContent goatZGMC;
	local GGGoatZombieGameModeTutorial goatZGMT;
	local GGGoatHeist goatH;
	local GGGoatSpace goatS;

	local GGNpc npc, cNpc;
	local GGCTFNpc ctfNpc;
	local GGNpcAgressive npcA;
	local GGNpcAgressiveGoat npcAG;
	local GGNpcGangMember npcGM;
	local GGNpcGoat npcGoat;
	local GGNpcGTwo npcGT;
	local GGNpcWhale npcW;
	local GGNpcAntContent npcAn;
	local GGNpcBearContent npcB;
	local GGNpcCowContent npcC;
	local GGNpcDemonContent npcD;
	local GGNpcDobominationContent npcDo;
	local GGNpcDodoContent npcDod;
	local GGNpcFeskContent npcF;
	local GGNpcGoldHarvestGolemContent npcGHG;
	local GGNpcOldGoatContent npcO;
	local GGNpcSheepContent npcS;
	local GGNpcMMOAuctioneerContent npcMMOA;
	local GGNpcMMODwarfContent npcMMOD;
	local GGNpcMMOGuardContent npcMMOG;
	local GGNpcMMOPlayerBot npcMMOPB;
	local GGNpcMMOQuestGiverContent npcMMOQG;
	local GGNpcMMOWoodpeckerElfContent npcMMOWE;
	local GGNpcMMOEnemy npcMMOE;
	local GGNpcMMOContent npcMMO;
	local GGNpcSurvivor npcSU;
	local GGNpcZombieFiremanLateGame npcZFLG;
	local GGNpcZombieFireman npcZF;
	local GGNpcZombieGoatLateGame npcZGLG;
	local GGNpcZombieGoat npcZG;
	local GGNpcZombieSpittingLateGame npcZSLG;
	local GGNpcZombieSpitting npcZS;
	local GGNpcZombieLateGame npcZLG;
	local GGNpcZombieTutorial npcZT;
	local GGNpcZombie npcZ;
	local GGNpcZombieGameModeGhost npcZGMG;
	local GGNpcZombieGameModeGoat npcZGMGO;
	local GGNpcZombieGameModeTough npcZGMT;
	local GGNpcZombieGameMode npcZGM;
	local GGNpcHeistRich npcHR;
	local GGNpcPolice npcP;
	local GGNpcHeist npcH;
	local GGNpcCompanionCow npcCC;
	local GGNpcShepherdable npcSH;
	local GGNpcSpaceGoat npcSG;
	local GGNpcSpaceKactorSpawner npcSKS;
	local GGNpcSpaceRelationship npcSR;
	local GGNpcSpaceWheelerRider npcSWR;
	local GGAISpaceCraftFreighter npcAISCF;
	local GGAISpaceCraftPolice npcAISCP;
	local GGAISpaceCraftPirate npcAISCPI;
	local GGAISpaceCraftContent npcAISCC;
	local GGAIHelperRobotCleaning npcAIHRC;
	local GGAIHelperRobotDispenser npcAIHRD;
	local GGAIHelperRobotHealing npcAIHRH;
	local GGAIHelperRobotInfo npcAIHRI;
	local GGAIHelperRobotPainting npcAIHRP;
	local GGAIHelperRobot npcAIHR;
	local GGChihuahuaTurret npcCT;
	local GGNpcSpace npcSP;

	local GGAIController cController;

	local float mRadiusOffset;
	local float mHeightOffset;
	local float radiusOffset;
	local float heightOffset;
	local vector vOffsetZ;
	local rotator newRotation;
	local vector newLocation;
	local Actor clone;

	pawn = GGPawn( item );
	pawnJ = GGPawnJoust( item );
	goatMMO = GGGoatMMO( item );
	goatZGMT = GGGoatZombieGameModeTutorial( item );
	goatZGMC = GGGoatZombieGameModeContent( item );
	goatZGM = GGGoatZombieGameMode( item );
	goatH = GGGoatHeist( item );
	goatS = GGGoatSpace( item );
	goat = GGGoat( item );
	npc = GGNpc( item );
	ctfNpc = GGCTFNpc( item );
	npcA = GGNpcAgressive( item );
	npcAG = GGNpcAgressiveGoat( item );
	npcGM = GGNpcGangMember( item );
	npcGoat = GGNpcGoat( item );
	npcGT = GGNpcGTwo( item );
	npcW = GGNpcWhale( item );
	npcAn = GGNpcAntContent( item );
	npcB = GGNpcBearContent( item );
	npcC = GGNpcCowContent( item );
	npcD = GGNpcDemonContent( item );
	npcDo = GGNpcDobominationContent( item );
	npcDod = GGNpcDodoContent( item );
	npcF = GGNpcFeskContent( item );
	npcGHG = GGNpcGoldHarvestGolemContent( item );
	npcO = GGNpcOldGoatContent( item );
	npcS = GGNpcSheepContent( item );
	npcMMOA = GGNpcMMOAuctioneerContent( item );
	npcMMOD = GGNpcMMODwarfContent( item );
	npcMMOG = GGNpcMMOGuardContent( item );
	npcMMOPB = GGNpcMMOPlayerBot( item );
	npcMMOQG = GGNpcMMOQuestGiverContent( item );
	npcMMOWE = GGNpcMMOWoodpeckerElfContent( item );
	npcMMOE = GGNpcMMOEnemy( item );
	npcMMO = GGNpcMMOContent( item );
	npcSU = GGNpcSurvivor( item );
	npcZFLG = GGNpcZombieFiremanLateGame( item );
	npcZF = GGNpcZombieFireman( item );
	npcZGLG = GGNpcZombieGoatLateGame( item );
	npcZG = GGNpcZombieGoat( item );
	npcZSLG = GGNpcZombieSpittingLateGame( item );
	npcZS = GGNpcZombieSpitting( item );
	npcZLG = GGNpcZombieLateGame( item );
	npcZT = GGNpcZombieTutorial( item );
	npcZ = GGNpcZombie( item );
	npcZGMG = GGNpcZombieGameModeGhost( item );
	npcZGMGO = GGNpcZombieGameModeGoat( item );
	npcZGMT = GGNpcZombieGameModeTough( item );
	npcZGM = GGNpcZombieGameMode( item );
	npcHR = GGNpcHeistRich( item );
	npcP = GGNpcPolice( item );
	npcH = GGNpcHeist( item );
	npcCC = GGNpcCompanionCow( item );
	npcSH = GGNpcShepherdable( item );
	npcSG = GGNpcSpaceGoat( item );
	npcSKS = GGNpcSpaceKactorSpawner( item );
	npcSR = GGNpcSpaceRelationship( item );
	npcSWR = GGNpcSpaceWheelerRider( item );
	npcAISCF = GGAISpaceCraftFreighter( item );
	npcAISCP = GGAISpaceCraftPolice( item );
	npcAISCPI = GGAISpaceCraftPirate( item );
	npcAISCC = GGAISpaceCraftContent( item );
	npcAIHRC = GGAIHelperRobotCleaning( item );
	npcAIHRD = GGAIHelperRobotDispenser( item );
	npcAIHRH = GGAIHelperRobotHealing( item );
	npcAIHRI = GGAIHelperRobotInfo( item );
	npcAIHRP = GGAIHelperRobotPainting( item );
	npcAIHR = GGAIHelperRobot( item );
	npcCT = GGChihuahuaTurret( item );
	npcSP = GGNpcSpace( item );
	//interpActor = GGInterpActor( item );
	gMe.GetBoundingCylinder(mRadiusOffset, mHeightOffset);
	item.GetBoundingCylinder(radiusOffset, heightOffset);
	vOffsetZ.x = 0;
	vOffsetZ.y = 0;
	vOffsetZ.z = - mHeightOffset/2.0 + heightOffset/2.0;
	newRotation = item.Rotation;
	newRotation.Yaw = rotator( gMe.Mesh.GetBoneAxis( gMe.mStandUpBoneName, AXIS_X )).Yaw;
	newLocation=gMe.Location - Normal(vector(gMe.Rotation)*vect(1, 1, 0))*(mRadiusOffset + radiusOffset) + vOffsetZ;

	if( pawn != none )
	{
		//myMut.WorldInfo.Game.Broadcast(myMut, "pawn detected : " $ pawn);
		//myMut.WorldInfo.Game.Broadcast(myMut, "1AI(" $ pawn $ ")=" $ pawn.Controller);

		if(pawnJ != none )
		{
			clone = myMut.Spawn (class'GGPawnJoust',,, newLocation, newRotation, pawnJ, true);
		}
		else if(goatMMO != none )
		{
			clone = myMut.Spawn (class'GGGoatMMO',,, newLocation, newRotation, goatMMO, true);
		}
		else if(goatZGMT != none )
		{
			clone = myMut.Spawn (class'GGGoatZombieGameModeTutorial',,, newLocation, newRotation, goatZGMT, true);
		}
		else if(goatZGMC != none )
		{
			clone = myMut.Spawn (class'GGGoatZombieGameModeContent',,, newLocation, newRotation, goatZGMC, true);
		}
		else if(goatZGM != none )
		{
			clone = myMut.Spawn (class'GGGoatZombieGameMode',,, newLocation, newRotation, goatZGM, true);
		}
		else if(goatH != none )
		{
			clone = myMut.Spawn (class'GGGoatHeist',,, newLocation, newRotation, goatH, true);
		}
		else if(goatS != none )
		{
			clone = myMut.Spawn (class'GGGoatSpace',,, newLocation, newRotation, goatS, true);
		}
		else if(goat != none )
		{
			clone = myMut.Spawn (class'GGGoat',,, newLocation, newRotation, goat, true);
		}
		else if(npcW != none )
		{
			clone = myMut.Spawn (class'GGNpcWhale',,, newLocation, newRotation, npcW, true);
		}
		else if(npcAn != none)
		{
			clone = myMut.Spawn (class'GGNpcAntContent',,, newLocation, newRotation, npcAn, true);
		}
		else if(npcB != none)
		{
			clone = myMut.Spawn (class'GGNpcBearContent',,, newLocation, newRotation, npcB, true);
		}
		else if(npcC != none)
		{
			clone = myMut.Spawn (class'GGNpcCowContent',,, newLocation, newRotation, npcC, true);
		}
		else if(npcD != none)
		{
			clone = myMut.Spawn (class'GGNpcDemonContent',,, newLocation, newRotation, npcD, true);
		}
		else if(npcDo != none)
		{
			clone = myMut.Spawn (class'GGNpcDobominationContent',,, newLocation, newRotation, npcDo, true);
		}
		else if(npcDod != none)
		{
			clone = myMut.Spawn (class'GGNpcDodoContent',,, newLocation, newRotation, npcDod, true);
		}
		else if(npcF != none)
		{
			clone = myMut.Spawn (class'GGNpcFeskContent',,, newLocation, newRotation, npcF, true);
		}
		else if(npcGHG != none)
		{
			clone = myMut.Spawn (class'GGNpcGoldHarvestGolemContent',,, newLocation, newRotation, npcGHG, true);
		}
		else if(npcO != none)
		{
			clone = myMut.Spawn (class'GGNpcOldGoatContent',,, newLocation, newRotation, npcO, true);
		}
		else if(npcS != none)
		{
			clone = myMut.Spawn (class'GGNpcSheepContent',,, newLocation, newRotation, npcS, true);
		}
		else if(npcMMOA != none)
		{
			clone = myMut.Spawn (class'GGNpcMMOAuctioneerContent',,, newLocation, newRotation, npcMMOA, true);
		}
		else if(npcMMOD != none)
		{
			clone = myMut.Spawn (class'GGNpcMMODwarfContent',,, newLocation, newRotation, npcMMOD, true);
		}
		else if(npcMMOG != none)
		{
			clone = myMut.Spawn (class'GGNpcMMOGuardContent',,, newLocation, newRotation, npcMMOG, true);
		}
		else if(npcMMOPB != none)
		{
			clone = myMut.Spawn (class'GGNpcMMOPlayerBot',,, newLocation, newRotation, npcMMOPB, true);
		}
		else if(npcMMOQG != none)
		{
			clone = myMut.Spawn (class'GGNpcMMOQuestGiverContent',,, newLocation, newRotation, npcMMOQG, true);
		}
		else if(npcMMOWE != none)
		{
			clone = myMut.Spawn (class'GGNpcMMOWoodpeckerElfContent',,, newLocation, newRotation, npcMMOWE, true);
		}
		else if(npcMMOE != none)
		{
			clone = myMut.Spawn (class'GGNpcMMOEnemy',,, newLocation, newRotation, npcMMOE, true);
		}
		else if(npcMMO != none)
		{
			clone = myMut.Spawn (class'GGNpcMMOContent',,, newLocation, newRotation, npcMMO, true);
		}
		else if(npcSU != none)
		{
			clone = myMut.Spawn (class'GGNpcSurvivor',,, newLocation, newRotation, npcSU, true);
		}
		else if(npcZFLG != none)
		{
			clone = myMut.Spawn (class'GGNpcZombieFiremanLateGame',,, newLocation, newRotation, npcZFLG, true);
		}
		else if(npcZF != none)
		{
			clone = myMut.Spawn (class'GGNpcZombieFireman',,, newLocation, newRotation, npcZF, true);
		}
		else if(npcZGLG != none)
		{
			clone = myMut.Spawn (class'GGNpcZombieGoatLateGame',,, newLocation, newRotation, npcZGLG, true);
		}
		else if(npcZG != none)
		{
			clone = myMut.Spawn (class'GGNpcZombieGoat',,, newLocation, newRotation, npcZG, true);
		}
		else if(npcZSLG != none)
		{
			clone = myMut.Spawn (class'GGNpcZombieSpittingLateGame',,, newLocation, newRotation, npcZSLG, true);
		}
		else if(npcZS != none)
		{
			clone = myMut.Spawn (class'GGNpcZombieSpitting',,, newLocation, newRotation, npcZS, true);
		}
		else if(npcZLG != none)
		{
			clone = myMut.Spawn (class'GGNpcZombieLateGame',,, newLocation, newRotation, npcZLG, true);
		}
		else if(npcZT != none)
		{
			clone = myMut.Spawn (class'GGNpcZombieTutorial',,, newLocation, newRotation, npcZT, true);
		}
		else if(npcZ != none)
		{
			clone = myMut.Spawn (class'GGNpcZombie',,, newLocation, newRotation, npcZ, true);
		}
		else if(npcZGMG != none)
		{
			clone = myMut.Spawn (class'GGNpcZombieGameModeGhost',,, newLocation, newRotation, npcZGMG, true);
		}
		else if(npcZGMGO != none)
		{
			clone = myMut.Spawn (class'GGNpcZombieGameModeGoat',,, newLocation, newRotation, npcZGMGO, true);
		}
		else if(npcZGMT != none)
		{
			clone = myMut.Spawn (class'GGNpcZombieGameModeTough',,, newLocation, newRotation, npcZGMT, true);
		}
		else if(npcZGM != none)
		{
			clone = myMut.Spawn (class'GGNpcZombieGameMode',,, newLocation, newRotation, npcZGM, true);
		}
		else if(npcHR != none)
		{
			clone = myMut.Spawn (class'GGNpcHeistRich',,, newLocation, newRotation, npcHR, true);
		}
		else if(npcP != none)
		{
			clone = myMut.Spawn (class'GGNpcPolice',,, newLocation, newRotation, npcP, true);
		}
		else if(npcH != none)
		{
			clone = myMut.Spawn (class'GGNpcHeist',,, newLocation, newRotation, npcH, true);
		}
		else if(npcCC != none )
		{
			clone = myMut.Spawn (class'GGNpcCompanionCow',,, newLocation, newRotation, npcCC, true);
		}
		else if(npcSH != none )
		{
			clone = myMut.Spawn (class'GGNpcShepherdable',,, newLocation, newRotation, npcSH, true);
		}
		else if(npcSG != none )
		{
			clone = myMut.Spawn (class'GGNpcSpaceGoat',,, newLocation, newRotation, npcSG, true);
		}
		else if(npcSKS != none )
		{
			clone = myMut.Spawn (class'GGNpcSpaceKactorSpawner',,, newLocation, newRotation, npcSKS, true);
		}
		else if(npcSR != none )
		{
			clone = myMut.Spawn (class'GGNpcSpaceRelationship',,, newLocation, newRotation, npcSR, true);
		}
		else if(npcSWR != none )
		{
			clone = myMut.Spawn (class'GGNpcSpaceWheelerRider',,, newLocation, newRotation, npcSWR, true);
		}
		else if(npcAISCF != none )
		{
			clone = myMut.Spawn (class'GGAISpaceCraftFreighter',,, newLocation, newRotation, npcAISCF, true);
		}
		else if(npcAISCP != none )
		{
			clone = myMut.Spawn (class'GGAISpaceCraftPolice',,, newLocation, newRotation, npcAISCP, true);
		}
		else if(npcAISCPI != none )
		{
			clone = myMut.Spawn (class'GGAISpaceCraftPirate',,, newLocation, newRotation, npcAISCPI, true);
		}
		else if(npcAISCC != none )
		{
			clone = myMut.Spawn (class'GGAISpaceCraftContent',,, newLocation, newRotation, npcAISCC, true);
		}
		else if(npcAIHRC != none )
		{
			clone = myMut.Spawn (class'GGAIHelperRobotCleaning',,, newLocation, newRotation, npcAIHRC, true);
		}
		else if(npcAIHRD != none )
		{
			clone = myMut.Spawn (class'GGAIHelperRobotDispenser',,, newLocation, newRotation, npcAIHRD, true);
		}
		else if(npcAIHRH != none )
		{
			clone = myMut.Spawn (class'GGAIHelperRobotHealing',,, newLocation, newRotation, npcAIHRH, true);
		}
		else if(npcAIHRI != none )
		{
			clone = myMut.Spawn (class'GGAIHelperRobotInfo',,, newLocation, newRotation, npcAIHRI, true);
		}
		else if(npcAIHRP != none )
		{
			clone = myMut.Spawn (class'GGAIHelperRobotPainting',,, newLocation, newRotation, npcAIHRP, true);
		}
		else if(npcAIHR != none )
		{
			clone = myMut.Spawn (class'GGAIHelperRobot',,, newLocation, newRotation, npcAIHR, true);
		}
		else if(npcCT != none )
		{
			clone = myMut.Spawn (class'GGChihuahuaTurret',,, newLocation, newRotation, npcCT, true);
		}
		else if(npcSP != none )
		{
			clone = myMut.Spawn (class'GGNpcSpace',,, newLocation, newRotation, npcSP, true);
		}
		else if(npcGT != none )
		{
			clone = myMut.Spawn (class'GGNpcGTwo',,, newLocation, newRotation, npcGT, true);
		}
		else if(npcGoat != none )
		{
			clone = myMut.Spawn (class'GGNpcGoat',,, newLocation, newRotation, npcGoat, true);
		}
		else if(npcGM != none )
		{
			clone = myMut.Spawn (class'GGNpcGangMember',,, newLocation, newRotation, npcGM, true);
		}
		else if(npcAG != none )
		{
			clone = myMut.Spawn (class'GGNpcAgressiveGoat',,, newLocation, newRotation, npcAG, true);
		}
		else if(ctfNpc != none )
		{
			clone = myMut.Spawn (class'GGCTFNpc',,, newLocation, newRotation, ctfNpc, true);
		}
		else if(npcA != none )
		{
			clone = myMut.Spawn (class'GGNpcAgressive',,, newLocation, newRotation, npcA, true);
		}
		else if(npc != none )
		{
			clone = myMut.Spawn (class'GGNpc',,, newLocation, newRotation, npc, true);
		}

		cPawn = GGPawn(clone);
		cNpc = GGNpc(clone);

		if(cPawn != none)
		{
			cPawn.CollisionComponent = cPawn.Mesh;
			cPawn.SetPhysics( PHYS_None );
			PlaceClone(cPawn);
			cPawn.SetRotation(newRotation);
			cPawn.SetPhysics( PHYS_Falling );
			cPawn.SetRagdoll(false);
			cPawn.Controller=none;
		}
		if(cNpc != none)
		{
			if(cNpc.ControllerClass == none)
			{
				cNpc.ControllerClass=class'GGAIController';
			}
			cNpc.SpawnDefaultController();
			cController=GGAIController(cNpc.Controller);
			if(cController != none)
			{
				cController.ResumeDefaultAction();
			}

			//myMut.WorldInfo.Game.Broadcast(myMut, "4AI(" $ npc $ ")=" $ npc.Controller);
		}
	}
}

/*
 * Place the clone on the floor
 */
function PlaceClone(GGPawn cPawn)
{
	local vector traceStart, traceEnd, hitLocation, hitNormal;
	local Actor hitActor;

	// Try to fit cylinder collision into location.
	traceEnd = cPawn.Location;
	traceStart = cPawn.Location + vect( 0, 0, 1) * cPawn.GetCollisionHeight() * 1.25f;

	hitActor = myMut.Trace( hitLocation, hitNormal, traceEnd, traceStart, true, cPawn.GetCollisionExtent() );
	if( hitActor == none )
	{
		hitLocation = traceStart;
	}

	if( !SetCloneLocation(cPawn, hitLocation ) )
	{
		// Avoid letting the goat slip through the ground at all cost.
		// This time just check encroachment against the world even if it means the physics may explode!
		cPawn.bNoEncroachCheck = true;
		if( !SetCloneLocation(cPawn, hitLocation ) )
		{
			// Ops!
		}
		cPawn.bNoEncroachCheck = myMut.default.bNoEncroachCheck;
	}
}

/*
 * Try to place the clone at the proposed location
 */
function bool SetCloneLocation(GGPawn cPawn, vector proposedLocation )
{
	local vector adjustedLocation;

	if( cPawn.SetLocation( proposedLocation ) )
	{
		return true;
	}

	adjustedLocation = proposedLocation + cPawn.GetCollisionRadius() * vect( 1, 1, 0 );
	if( cPawn.SetLocation( adjustedLocation ) )
	{
		return true;
	}
	adjustedLocation = proposedLocation + cPawn.GetCollisionRadius() * vect( 1, -1, 0 );
	if( cPawn.SetLocation( adjustedLocation ) )
	{
		return true;
	}
	adjustedLocation = proposedLocation + cPawn.GetCollisionRadius() * vect( -1, 1, 0 );
	if( cPawn.SetLocation( adjustedLocation ) )
	{
		return true;
	}
	adjustedLocation = proposedLocation + cPawn.GetCollisionRadius() * vect( -1, -1, 0 );
	if( cPawn.SetLocation( adjustedLocation ) )
	{
		return true;
	}

	return false;
}

defaultproperties
{

}