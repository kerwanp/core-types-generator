--- @class AIActivity 
--- @field name string 
--- @field owner AIActivityHandler 
--- @field priority number 
--- @field isDebugModeEnabled boolean 
--- @field isHighestPriority boolean 
--- @field elapsedTime number 
--- @field type string 
local AIActivity = {}
--- @param typeName string 
--- @return boolean 
function AIActivity:IsA(typeName) end


--- @class AIActivityHandler 
--- @field isSelectedInDebugger boolean 
--- @field type string 
local AIActivityHandler = {}
--- @param name string 
--- @param functions table 
--- @return AIActivity 
function AIActivityHandler:AddActivity(name, functions) end

--- @param name string 
function AIActivityHandler:RemoveActivity(name) end

function AIActivityHandler:ClearActivities() end

--- @return table<number, AIActivity> 
function AIActivityHandler:GetActivities() end

--- @param name string 
--- @return AIActivity 
function AIActivityHandler:FindActivity(name) end

--- @param typeName string 
--- @return boolean 
function AIActivityHandler:IsA(typeName) end


--- @class Ability 
--- @field actionBinding string 
--- @field canActivateWhileDead boolean 
--- @field animation string 
--- @field canBePrevented boolean 
--- @field castPhaseSettings AbilityPhaseSettings 
--- @field executePhaseSettings AbilityPhaseSettings 
--- @field recoveryPhaseSettings AbilityPhaseSettings 
--- @field cooldownPhaseSettings AbilityPhaseSettings 
--- @field isEnabled boolean 
--- @field owner Object 
--- @field type string 
local Ability = {}
--- @return AbilityTarget 
function Ability:GetTargetData() end

--- @param target AbilityTarget 
function Ability:SetTargetData(target) end

--- @return AbilityPhase 
function Ability:GetCurrentPhase() end

--- @return number 
function Ability:GetPhaseTimeRemaining() end

function Ability:Interrupt() end

function Ability:Activate() end

function Ability:AdvancePhase() end

--- @param typeName string 
--- @return boolean 
function Ability:IsA(typeName) end


--- @class AbilityPhaseSettings 
--- @field duration number 
--- @field canMove boolean 
--- @field canJump boolean 
--- @field canRotate boolean 
--- @field preventsOtherAbilities boolean 
--- @field isTargetDataUpdated boolean 
--- @field facingMode AbilityFacingMode 
--- @field type string 
local AbilityPhaseSettings = {}
--- @param typeName string 
--- @return boolean 
function AbilityPhaseSettings:IsA(typeName) end


--- @class AbilityTarget 
--- @field hitPlayer Player 
--- @field hitObject Object 
--- @field spreadHalfAngle number 
--- @field spreadRandomSeed number 
--- @field type string 
local AbilityTarget = {}
--- @return Rotation 
function AbilityTarget:GetOwnerMovementRotation() end

--- @param rotation Rotation 
function AbilityTarget:SetOwnerMovementRotation(rotation) end

--- @return Vector3 
function AbilityTarget:GetAimPosition() end

--- @param worldPosition Vector3 
function AbilityTarget:SetAimPosition(worldPosition) end

--- @return Vector3 
function AbilityTarget:GetAimDirection() end

--- @param direction Vector3 
function AbilityTarget:SetAimDirection(direction) end

--- @return Vector3 
function AbilityTarget:GetHitPosition() end

--- @param worldPosition Vector3 
function AbilityTarget:SetHitPosition(worldPosition) end

--- @return HitResult 
function AbilityTarget:GetHitResult() end

--- @param hitResult HitResult 
function AbilityTarget:SetHitResult(hitResult) end

--- @param typeName string 
--- @return boolean 
function AbilityTarget:IsA(typeName) end


--- @class AnimatedMesh 
--- @field animationStance string 
--- @field animationStancePlaybackRate number 
--- @field animationStanceShouldLoop boolean 
--- @field playbackRateMultiplier number 
--- @field type string 
local AnimatedMesh = {}
--- @return table<number, string> 
function AnimatedMesh:GetAnimationNames() end

--- @return table<number, string> 
function AnimatedMesh:GetAnimationStanceNames() end

--- @return table<number, string> 
function AnimatedMesh:GetSocketNames() end

--- @param animationName string 
--- @return table<number, string> 
function AnimatedMesh:GetAnimationEventNames(animationName) end

--- @param objectToAttach CoreObject 
--- @param socket string 
function AnimatedMesh:AttachCoreObject(objectToAttach, socket) end

--- @param animationName string 
--- @param optionalParameters table 
function AnimatedMesh:PlayAnimation(animationName, optionalParameters) end

function AnimatedMesh:StopAnimations() end

--- @param animationName string 
--- @return number 
function AnimatedMesh:GetAnimationDuration(animationName) end

--- @param slotIndex number 
--- @param assetId string 
function AnimatedMesh:SetMeshForSlot(slotIndex, assetId) end

--- @param slotIndex number 
--- @return string 
function AnimatedMesh:GetMeshForSlot(slotIndex) end

--- @param typeName string 
--- @return boolean 
function AnimatedMesh:IsA(typeName) end


--- @class AreaLight 
--- @field sourceWidth number 
--- @field sourceHeight number 
--- @field barnDoorAngle number 
--- @field barnDoorLength number 
--- @field type string 
local AreaLight = {}
--- @param typeName string 
--- @return boolean 
function AreaLight:IsA(typeName) end


--- @class Audio 
--- @field isSpatializationEnabled boolean 
--- @field isAttenuationEnabled boolean 
--- @field isOcclusionEnabled boolean 
--- @field isAutoPlayEnabled boolean 
--- @field isTransient boolean 
--- @field isAutoRepeatEnabled boolean 
--- @field pitch number 
--- @field volume number 
--- @field radius number 
--- @field falloff number 
--- @field isPlaying boolean 
--- @field length number 
--- @field currentPlaybackTime number 
--- @field fadeInTime number 
--- @field fadeOutTime number 
--- @field startTime number 
--- @field stopTime number 
--- @field type string 
local Audio = {}
function Audio:Play() end

function Audio:Stop() end

--- @param time number 
function Audio:FadeIn(time) end

--- @param time number 
function Audio:FadeOut(time) end

--- @param typeName string 
--- @return boolean 
function Audio:IsA(typeName) end


--- @class Camera 
--- @field followPlayer Player 
--- @field isOrthographic boolean 
--- @field fieldOfView number 
--- @field viewWidth number 
--- @field useCameraSocket boolean 
--- @field currentDistance number 
--- @field isDistanceAdjustable boolean 
--- @field minDistance number 
--- @field maxDistance number 
--- @field rotationMode RotationMode 
--- @field hasFreeControl boolean 
--- @field currentPitch number 
--- @field minPitch number 
--- @field maxPitch number 
--- @field isYawLimited boolean 
--- @field currentYaw number 
--- @field minYaw number 
--- @field maxYaw number 
--- @field lerpTime number 
--- @field isUsingCameraRotation boolean 
--- @field type string 
local Camera = {}
--- @return Vector3 
function Camera:GetPositionOffset() end

--- @param positionOffset Vector3 
function Camera:SetPositionOffset(positionOffset) end

--- @return Rotation 
function Camera:GetRotationOffset() end

--- @param rotationOffset Rotation 
function Camera:SetRotationOffset(rotationOffset) end

--- @param typeName string 
--- @return boolean 
function Camera:IsA(typeName) end


--- @class Color 
--- @field r number 
--- @field g number 
--- @field b number 
--- @field a number 
--- @field type string 
local Color = {}
--- @param desaturation number 
--- @return Color 
function Color:GetDesaturated(desaturation) end

--- @return string 
function Color:ToStandardHex() end

--- @return string 
function Color:ToLinearHex() end

--- @param typeName string 
--- @return boolean 
function Color:IsA(typeName) end


--- @class CoreFriendCollection 
--- @field hasMoreResults boolean 
--- @field type string 
local CoreFriendCollection = {}
--- @return table<number, CoreFriendCollectionEntry> 
function CoreFriendCollection:GetResults() end

--- @return CoreFriendCollection 
function CoreFriendCollection:GetMoreResults() end

--- @param typeName string 
--- @return boolean 
function CoreFriendCollection:IsA(typeName) end


--- @class CoreFriendCollectionEntry 
--- @field id string 
--- @field name string 
--- @field type string 
local CoreFriendCollectionEntry = {}
--- @param typeName string 
--- @return boolean 
function CoreFriendCollectionEntry:IsA(typeName) end


--- @class CoreGameCollectionEntry 
--- @field id string 
--- @field parentGameId string 
--- @field name string 
--- @field ownerId string 
--- @field ownerName string 
--- @field type string 
local CoreGameCollectionEntry = {}
--- @param typeName string 
--- @return boolean 
function CoreGameCollectionEntry:IsA(typeName) end


--- @class CoreGameInfo 
--- @field id string 
--- @field parentGameId string 
--- @field name string 
--- @field description string 
--- @field ownerId string 
--- @field ownerName string 
--- @field isQueueEnabled boolean 
--- @field screenshotCount number 
--- @field hasWorldCapture boolean 
--- @field type string 
local CoreGameInfo = {}
--- @return table<number, string> 
function CoreGameInfo:GetTags() end

--- @param typeName string 
--- @return boolean 
function CoreGameInfo:IsA(typeName) end


--- @class CoreMesh 
--- @field meshAssetId string 
--- @field team number 
--- @field isTeamColorUsed boolean 
--- @field isTeamCollisionEnabled boolean 
--- @field isEnemyCollisionEnabled boolean 
--- @field isCameraCollisionEnabled boolean 
--- @field type string 
local CoreMesh = {}
--- @return Color 
function CoreMesh:GetColor() end

--- @param color Color 
function CoreMesh:SetColor(color) end

function CoreMesh:ResetColor() end

--- @param typeName string 
--- @return boolean 
function CoreMesh:IsA(typeName) end


--- @class CoreObject 
--- @field name string 
--- @field id string 
--- @field isVisible boolean 
--- @field visibility Visibility 
--- @field isCollidable boolean 
--- @field collision Collision 
--- @field cameraCollision Collision 
--- @field isEnabled boolean 
--- @field lifeSpan number 
--- @field isStatic boolean 
--- @field isNetworked boolean 
--- @field isClientOnly boolean 
--- @field isServerOnly boolean 
--- @field parent CoreObject 
--- @field sourceTemplateId string 
--- @field type string 
local CoreObject = {}
--- @return CoreObjectReference 
function CoreObject:GetReference() end

--- @return Transform 
function CoreObject:GetTransform() end

--- @param localTransform Transform 
function CoreObject:SetTransform(localTransform) end

--- @return Vector3 
function CoreObject:GetPosition() end

--- @param localPosition Vector3 
function CoreObject:SetPosition(localPosition) end

--- @return Rotation 
function CoreObject:GetRotation() end

--- @param localRotation Rotation 
function CoreObject:SetRotation(localRotation) end

--- @return Vector3 
function CoreObject:GetScale() end

--- @param localScale Vector3 
function CoreObject:SetScale(localScale) end

--- @return Transform 
function CoreObject:GetWorldTransform() end

--- @param worldTransform Transform 
function CoreObject:SetWorldTransform(worldTransform) end

--- @return Vector3 
function CoreObject:GetWorldPosition() end

--- @param worldPosition Vector3 
function CoreObject:SetWorldPosition(worldPosition) end

--- @return Rotation 
function CoreObject:GetWorldRotation() end

--- @param worldRotation Rotation 
function CoreObject:SetWorldRotation(worldRotation) end

--- @return Vector3 
function CoreObject:GetWorldScale() end

--- @param worldScale Vector3 
function CoreObject:SetWorldScale(worldScale) end

--- @return Vector3 
function CoreObject:GetVelocity() end

--- @param velocity Vector3 
function CoreObject:SetVelocity(velocity) end

--- @return Vector3 
function CoreObject:GetAngularVelocity() end

--- @param angularVelocity Vector3 
function CoreObject:SetAngularVelocity(angularVelocity) end

--- @param localAngularVelocity Vector3 
function CoreObject:SetLocalAngularVelocity(localAngularVelocity) end

--- @return table<number, CoreObject> 
function CoreObject:GetChildren() end

--- @param player Player 
--- @param socketName string 
function CoreObject:AttachToPlayer(player, socketName) end

function CoreObject:AttachToLocalView() end

function CoreObject:Detach() end

--- @return string 
function CoreObject:GetAttachedToSocketName() end

--- @return boolean 
function CoreObject:IsVisibleInHierarchy() end

--- @return boolean 
function CoreObject:IsCollidableInHierarchy() end

--- @return boolean 
function CoreObject:IsCameraCollidableInHierarchy() end

--- @return boolean 
function CoreObject:IsEnabledInHierarchy() end

--- @param name string 
--- @return CoreObject 
function CoreObject:FindAncestorByName(name) end

--- @param name string 
--- @return CoreObject 
function CoreObject:FindChildByName(name) end

--- @param name string 
--- @return CoreObject 
function CoreObject:FindDescendantByName(name) end

--- @param name string 
--- @return table<number, CoreObject> 
function CoreObject:FindDescendantsByName(name) end

--- @param typeName string 
--- @return CoreObject 
function CoreObject:FindAncestorByType(typeName) end

--- @param typeName string 
--- @return CoreObject 
function CoreObject:FindChildByType(typeName) end

--- @param typeName string 
--- @return CoreObject 
function CoreObject:FindDescendantByType(typeName) end

--- @param typeName string 
--- @return table<number, CoreObject> 
function CoreObject:FindDescendantsByType(typeName) end

--- @return CoreObject 
function CoreObject:FindTemplateRoot() end

--- @param coreObject CoreObject 
--- @return boolean 
function CoreObject:IsAncestorOf(coreObject) end

--- @overload fun(worldPosition: Vector3,duration: number)
--- @param position Vector3 
--- @param duration number 
--- @param isLocalPosition boolean 
function CoreObject:MoveTo(position, duration, isLocalPosition) end

--- @overload fun(worldVelocity: Vector3)
--- @param worldVelocity Vector3 
--- @param isLocalVelocity boolean 
function CoreObject:MoveContinuous(worldVelocity, isLocalVelocity) end

--- @overload fun(target: Player,speed: number)
--- @overload fun(target: Player)
--- @overload fun(target: CoreObject,speed: number,minimumDistance: number)
--- @overload fun(target: CoreObject,speed: number)
--- @overload fun(target: CoreObject)
--- @param target Player 
--- @param speed number 
--- @param minimumDistance number 
function CoreObject:Follow(target, speed, minimumDistance) end

function CoreObject:StopMove() end

--- @overload fun(worldRotation: Quaternion,duration: number)
--- @overload fun(rotation: Rotation,duration: number,isLocalRotation: boolean)
--- @overload fun(worldRotation: Rotation,duration: number)
--- @param rotation Quaternion 
--- @param duration number 
--- @param isLocalRotation boolean 
function CoreObject:RotateTo(rotation, duration, isLocalRotation) end

--- @overload fun(angularVelocity: Vector3)
--- @overload fun(quaternionSpeed: Quaternion,multiplier: number,isLocalQuaternionSpeed: boolean)
--- @overload fun(quaternionSpeed: Quaternion,multiplier: number)
--- @overload fun(quaternionSpeed: Quaternion)
--- @overload fun(rotationSpeed: Rotation,multiplier: number,isLocalRotationSpeed: boolean)
--- @overload fun(rotationSpeed: Rotation,multiplier: number)
--- @overload fun(rotationSpeed: Rotation)
--- @param angularVelocity Vector3 
--- @param isLocalAngularVelocity boolean 
function CoreObject:RotateContinuous(angularVelocity, isLocalAngularVelocity) end

--- @param worldPosition Vector3 
function CoreObject:LookAt(worldPosition) end

--- @overload fun(target: Player,speed: number)
--- @overload fun(target: Player,isPitchLocked: boolean)
--- @overload fun(target: Player)
--- @overload fun(target: CoreObject,isPitchLocked: boolean,speed: number)
--- @overload fun(target: CoreObject,speed: number)
--- @overload fun(target: CoreObject,isPitchLocked: boolean)
--- @overload fun(target: CoreObject)
--- @param target Player 
--- @param isPitchLocked boolean 
--- @param speed number 
function CoreObject:LookAtContinuous(target, isPitchLocked, speed) end

--- @overload fun()
--- @param isPitchLocked boolean 
function CoreObject:LookAtLocalView(isPitchLocked) end

function CoreObject:StopRotate() end

--- @overload fun(worldScale: Vector3,duration: number)
--- @param scale Vector3 
--- @param duration number 
--- @param isScaleLocal boolean 
function CoreObject:ScaleTo(scale, duration, isScaleLocal) end

--- @overload fun(scaleRate: Vector3)
--- @param scaleRate Vector3 
--- @param isLocalScaleRate boolean 
function CoreObject:ScaleContinuous(scaleRate, isLocalScaleRate) end

function CoreObject:StopScale() end

function CoreObject:Destroy() end

--- @return table 
function CoreObject:GetCustomProperties() end

--- @param propertyName string 
--- @return any|boolean 
function CoreObject:GetCustomProperty(propertyName) end

--- @param propertyName string 
--- @param propertyValue any 
--- @return boolean 
function CoreObject:SetNetworkedCustomProperty(propertyName, propertyValue) end

--- @param typeName string 
--- @return boolean 
function CoreObject:IsA(typeName) end


--- @class CoreObjectReference 
--- @field id string 
--- @field isAssigned boolean 
--- @field type string 
local CoreObjectReference = {}
--- @return CoreObject 
function CoreObjectReference:GetObject() end

--- @param timeout number 
--- @return CoreObject 
function CoreObjectReference:WaitForObject(timeout) end

--- @param typeName string 
--- @return boolean 
function CoreObjectReference:IsA(typeName) end


--- @class CorePlayerProfile 
--- @field id string 
--- @field name string 
--- @field description string 
--- @field type string 
local CorePlayerProfile = {}
--- @param typeName string 
--- @return boolean 
function CorePlayerProfile:IsA(typeName) end


--- @class Damage 
--- @field amount number 
--- @field reason DamageReason 
--- @field sourceAbility Ability 
--- @field sourcePlayer Player 
--- @field type string 
local Damage = {}
--- @return HitResult 
function Damage:GetHitResult() end

--- @param hitResult HitResult 
function Damage:SetHitResult(hitResult) end

--- @param typeName string 
--- @return boolean 
function Damage:IsA(typeName) end


--- @class Decal 
--- @field type string 
local Decal = {}
--- @param typeName string 
--- @return boolean 
function Decal:IsA(typeName) end


--- @class Equipment 
--- @field owner Player 
--- @field socket string 
--- @field type string 
local Equipment = {}
--- @return table<number, Ability> 
function Equipment:GetAbilities() end

--- @param player Player 
function Equipment:Equip(player) end

function Equipment:Unequip() end

--- @param ability Ability 
function Equipment:AddAbility(ability) end

--- @param typeName string 
--- @return boolean 
function Equipment:IsA(typeName) end


--- @class Event 
--- @field type string 
local Event = {}
--- @overload fun(listener: function): EventListener
--- @param listener function 
--- @param additionalParameters any 
--- @return EventListener 
function Event:Connect(listener, additionalParameters) end

--- @param typeName string 
--- @return boolean 
function Event:IsA(typeName) end


--- @class EventListener 
--- @field isConnected boolean 
--- @field type string 
local EventListener = {}
function EventListener:Disconnect() end

--- @param typeName string 
--- @return boolean 
function EventListener:IsA(typeName) end


--- @class Folder 
--- @field type string 
local Folder = {}
--- @param typeName string 
--- @return boolean 
function Folder:IsA(typeName) end


--- @class FourWheeledVehicle 
--- @field turnRadius number 
--- @field type string 
local FourWheeledVehicle = {}
--- @param typeName string 
--- @return boolean 
function FourWheeledVehicle:IsA(typeName) end


--- @class HitResult 
--- @field other Object 
--- @field socketName string 
--- @field type string 
local HitResult = {}
--- @return Vector3 
function HitResult:GetImpactPosition() end

--- @return Vector3 
function HitResult:GetImpactNormal() end

--- @return Transform 
function HitResult:GetTransform() end

--- @param typeName string 
--- @return boolean 
function HitResult:IsA(typeName) end


--- @class Hook 
--- @field type string 
local Hook = {}
--- @overload fun(listener: function): HookListener
--- @param listener function 
--- @param additionalParameters any 
--- @return HookListener 
function Hook:Connect(listener, additionalParameters) end

--- @param typeName string 
--- @return boolean 
function Hook:IsA(typeName) end


--- @class HookListener 
--- @field isConnected boolean 
--- @field priority number 
--- @field type string 
local HookListener = {}
function HookListener:Disconnect() end

--- @param typeName string 
--- @return boolean 
function HookListener:IsA(typeName) end


--- @class ImpactData 
--- @field targetObject Object 
--- @field projectile Projectile 
--- @field sourceAbility Ability 
--- @field weapon Weapon 
--- @field weaponOwner Player 
--- @field isHeadshot boolean 
--- @field travelDistance number 
--- @field type string 
local ImpactData = {}
--- @return HitResult 
function ImpactData:GetHitResult() end

--- @return table<number, HitResult> 
function ImpactData:GetHitResults() end

--- @param typeName string 
--- @return boolean 
function ImpactData:IsA(typeName) end


--- @class LeaderboardEntry 
--- @field id string 
--- @field name string 
--- @field score number 
--- @field additionalData string 
--- @field type string 
local LeaderboardEntry = {}
--- @param typeName string 
--- @return boolean 
function LeaderboardEntry:IsA(typeName) end


--- @class Light 
--- @field intensity number 
--- @field attenuationRadius number 
--- @field isShadowCaster boolean 
--- @field hasTemperature boolean 
--- @field temperature number 
--- @field team number 
--- @field isTeamColorUsed boolean 
--- @field type string 
local Light = {}
--- @return Color 
function Light:GetColor() end

--- @param color Color 
function Light:SetColor(color) end

--- @param typeName string 
--- @return boolean 
function Light:IsA(typeName) end


--- @class MergedModel 
--- @field type string 
local MergedModel = {}
--- @param typeName string 
--- @return boolean 
function MergedModel:IsA(typeName) end


--- @class NetReference 
--- @field isAssigned boolean 
--- @field referenceType NetReferenceType 
--- @field type string 
local NetReference = {}
--- @param typeName string 
--- @return boolean 
function NetReference:IsA(typeName) end


--- @class NetworkContext 
--- @field type string 
local NetworkContext = {}
--- @param typeName string 
--- @return boolean 
function NetworkContext:IsA(typeName) end


--- @class Object 
--- @field serverUserData table 
--- @field clientUserData table 
--- @field type string 
local Object = {}
--- @param typeName string 
--- @return boolean 
function Object:IsA(typeName) end


--- @class Player 
--- @field id string 
--- @field name string 
--- @field team number 
--- @field hitPoints number 
--- @field maxHitPoints number 
--- @field kills number 
--- @field deaths number 
--- @field isDead boolean 
--- @field mass number 
--- @field isAccelerating boolean 
--- @field isCrouching boolean 
--- @field isFlying boolean 
--- @field isGrounded boolean 
--- @field isJumping boolean 
--- @field isMounted boolean 
--- @field isSwimming boolean 
--- @field isWalking boolean 
--- @field isSliding boolean 
--- @field maxWalkSpeed number 
--- @field stepHeight number 
--- @field maxAcceleration number 
--- @field brakingDecelerationFalling number 
--- @field brakingDecelerationWalking number 
--- @field groundFriction number 
--- @field brakingFrictionFactor number 
--- @field walkableFloorAngle number 
--- @field lookSensitivity number 
--- @field animationStance string 
--- @field activeEmote string 
--- @field currentFacingMode FacingMode 
--- @field desiredFacingMode FacingMode 
--- @field maxJumpCount number 
--- @field flipOnMultiJump boolean 
--- @field shouldFlipOnMultiJump boolean 
--- @field jumpVelocity number 
--- @field gravityScale number 
--- @field maxSwimSpeed number 
--- @field touchForceFactor number 
--- @field isCrouchEnabled boolean 
--- @field buoyancy number 
--- @field isVisible boolean 
--- @field isVisibleToSelf boolean 
--- @field spreadModifier number 
--- @field currentSpread number 
--- @field canMount boolean 
--- @field shouldDismountWhenDamaged boolean 
--- @field movementControlMode MovementControlMode 
--- @field lookControlMode LookControlMode 
--- @field isMovementEnabled boolean 
--- @field isCollidable boolean 
--- @field parentCoreObject CoreObject 
--- @field occupiedVehicle Vehicle 
--- @field currentRotationRate number 
--- @field defaultRotationRate number 
--- @field type string 
local Player = {}
--- @return Transform 
function Player:GetWorldTransform() end

--- @param worldTransform Transform 
function Player:SetWorldTransform(worldTransform) end

--- @return Vector3 
function Player:GetWorldPosition() end

--- @param worldPosition Vector3 
function Player:SetWorldPosition(worldPosition) end

--- @return Rotation 
function Player:GetWorldRotation() end

--- @param worldRotation Rotation 
function Player:SetWorldRotation(worldRotation) end

--- @return Vector3 
function Player:GetWorldScale() end

--- @param worldScale Vector3 
function Player:SetWorldScale(worldScale) end

--- @return Vector3 
function Player:GetVelocity() end

--- @return table<number, Ability> 
function Player:GetAbilities() end

--- @return table<number, Equipment> 
function Player:GetEquipment() end

--- @return table<number, CoreObject> 
function Player:GetAttachedObjects() end

--- @param impulse Vector3 
function Player:AddImpulse(impulse) end

--- @param velocity Vector3 
function Player:SetVelocity(velocity) end

function Player:ResetVelocity() end

--- @param damage Damage 
function Player:ApplyDamage(damage) end

--- @overload fun(socketName: string)
--- @overload fun()
--- @param socketName string 
--- @param weight number 
function Player:EnableRagdoll(socketName, weight) end

function Player:DisableRagdoll() end

--- @overload fun(isVisible: boolean)
--- @param isVisible boolean 
--- @param includeAttachments boolean 
function Player:SetVisibility(isVisible, includeAttachments) end

--- @return boolean 
function Player:GetVisibility() end

--- @return Vector3 
function Player:GetViewWorldPosition() end

--- @return Rotation 
function Player:GetViewWorldRotation() end

--- @overload fun()
--- @param damage Damage 
function Player:Die(damage) end

--- @overload fun(optionalParameters: table)
--- @overload fun()
--- @param position Vector3 
--- @param rotation Rotation 
function Player:Respawn(position, rotation) end

function Player:ClearResources() end

--- @return table 
function Player:GetResources() end

--- @param resourceName string 
--- @return number 
function Player:GetResource(resourceName) end

--- @param resourceName string 
--- @param amount number 
--- @return number 
function Player:SetResource(resourceName, amount) end

--- @param resourceName string 
--- @param amount number 
--- @return number 
function Player:AddResource(resourceName, amount) end

--- @param resourceName string 
--- @param amount number 
--- @return number 
function Player:RemoveResource(resourceName, amount) end

--- @return table<number, string> 
function Player:GetResourceNames() end

--- @param resourceNamePrefix string 
--- @return table<number, string> 
function Player:GetResourceNamesStartingWith(resourceNamePrefix) end

--- @overload fun(gameInfo: CoreGameInfo)
--- @overload fun(gameId: string)
--- @param gameCollectionEntry CoreGameCollectionEntry 
function Player:TransferToGame(gameCollectionEntry) end

--- @param perkReference NetReference 
--- @return boolean 
function Player:HasPerk(perkReference) end

--- @param perkReference NetReference 
--- @return number 
function Player:GetPerkCount(perkReference) end

--- @param perkReference NetReference 
--- @return number 
function Player:GetPerkTimeRemaining(perkReference) end

function Player:ActivateFlying() end

function Player:ActivateWalking() end

--- @param isMounted boolean 
function Player:SetMounted(isMounted) end

--- @return Camera 
function Player:GetActiveCamera() end

--- @return Camera 
function Player:GetDefaultCamera() end

--- @overload fun(camera: Camera,lerpTime: number)
--- @param camera Camera 
function Player:SetDefaultCamera(camera) end

--- @return Camera 
function Player:GetOverrideCamera() end

--- @overload fun(camera: Camera,lerpTime: number)
--- @param camera Camera 
function Player:SetOverrideCamera(camera) end

--- @overload fun(lerpTime: number)
function Player:ClearOverrideCamera() end

--- @return Rotation 
function Player:GetLookWorldRotation() end

--- @param newLookRotation Rotation 
function Player:SetLookWorldRotation(newLookRotation) end

--- @param bindingName string 
--- @return boolean 
function Player:IsBindingPressed(bindingName) end

--- @param object CoreObject 
function Player:AttachToCoreObject(object) end

function Player:Detach() end

--- @return PlayerTransferData 
function Player:GetJoinTransferData() end

--- @return PlayerTransferData 
function Player:GetLeaveTransferData() end

--- @param typeName string 
--- @return boolean 
function Player:IsA(typeName) end


--- @class PlayerSettings 
--- @field type string 
local PlayerSettings = {}
--- @param player Player 
function PlayerSettings:ApplyToPlayer(player) end

--- @param typeName string 
--- @return boolean 
function PlayerSettings:IsA(typeName) end


--- @class PlayerStart 
--- @field team number 
--- @field type string 
local PlayerStart = {}
--- @param typeName string 
--- @return boolean 
function PlayerStart:IsA(typeName) end


--- @class PlayerTransferData 
--- @field reason PlayerTransferReason 
--- @field gameId string 
--- @field type string 
local PlayerTransferData = {}
--- @param typeName string 
--- @return boolean 
function PlayerTransferData:IsA(typeName) end


--- @class PointLight 
--- @field hasNaturalFalloff boolean 
--- @field falloffExponent number 
--- @field sourceRadius number 
--- @field sourceLength number 
--- @field type string 
local PointLight = {}
--- @param typeName string 
--- @return boolean 
function PointLight:IsA(typeName) end


--- @class Projectile 
--- @field sourceAbility Ability 
--- @field shouldBounceOnPlayers boolean 
--- @field shouldDieOnImpact boolean 
--- @field owner Player 
--- @field speed number 
--- @field maxSpeed number 
--- @field gravityScale number 
--- @field drag number 
--- @field bouncesRemaining number 
--- @field bounciness number 
--- @field piercesRemaining number 
--- @field lifeSpan number 
--- @field capsuleRadius number 
--- @field capsuleLength number 
--- @field homingTarget Object 
--- @field homingAcceleration number 
--- @field type string 
local Projectile = {}
--- @return Transform 
function Projectile:GetWorldTransform() end

--- @return Vector3 
function Projectile:GetWorldPosition() end

--- @param worldPosition Vector3 
function Projectile:SetWorldPosition(worldPosition) end

--- @return Vector3 
function Projectile:GetVelocity() end

--- @param velocity Vector3 
function Projectile:SetVelocity(velocity) end

function Projectile:Destroy() end

--- @param typeName string 
--- @return boolean 
function Projectile:IsA(typeName) end


--- @class Quaternion 
--- @field x number 
--- @field y number 
--- @field z number 
--- @field w number 
--- @field type string 
local Quaternion = {}
--- @return Rotation 
function Quaternion:GetRotation() end

--- @return Vector3 
function Quaternion:GetForwardVector() end

--- @return Vector3 
function Quaternion:GetRightVector() end

--- @return Vector3 
function Quaternion:GetUpVector() end

--- @param typeName string 
--- @return boolean 
function Quaternion:IsA(typeName) end


--- @class RandomStream 
--- @field seed number 
--- @field type string 
local RandomStream = {}
--- @return number 
function RandomStream:GetInitialSeed() end

function RandomStream:Reset() end

function RandomStream:Mutate() end

--- @overload fun(min: number,max: number): number
--- @return number 
function RandomStream:GetNumber() end

--- @param min number 
--- @param max number 
--- @return number 
function RandomStream:GetInteger(min, max) end

--- @return Vector3 
function RandomStream:GetVector3() end

--- @overload fun(direction: Vector3,coneHalfAngle: number): Vector3
--- @param direction Vector3 
--- @param horizontalHalfAngle number 
--- @param verticalHalfAngle number 
--- @return Vector3 
function RandomStream:GetVector3FromCone(direction, horizontalHalfAngle, verticalHalfAngle) end

--- @param typeName string 
--- @return boolean 
function RandomStream:IsA(typeName) end


--- @class Rotation 
--- @field x number 
--- @field y number 
--- @field z number 
--- @field type string 
local Rotation = {}
--- @param typeName string 
--- @return boolean 
function Rotation:IsA(typeName) end


--- @class Script 
--- @field context table 
--- @field type string 
local Script = {}
--- @param typeName string 
--- @return boolean 
function Script:IsA(typeName) end


--- @class ScriptAsset 
--- @field name string 
--- @field id string 
--- @field type string 
local ScriptAsset = {}
--- @return table 
function ScriptAsset:GetCustomProperties() end

--- @param propertyName string 
--- @return any|boolean 
function ScriptAsset:GetCustomProperty(propertyName) end

--- @param typeName string 
--- @return boolean 
function ScriptAsset:IsA(typeName) end


--- @class SmartAudio 
--- @field isSpatializationEnabled boolean 
--- @field isAttenuationEnabled boolean 
--- @field isOcclusionEnabled boolean 
--- @field fadeInTime number 
--- @field fadeOutTime number 
--- @field startTime number 
--- @field stopTime number 
--- @field isAutoPlayEnabled boolean 
--- @field isTransient boolean 
--- @field isAutoRepeatEnabled boolean 
--- @field pitch number 
--- @field volume number 
--- @field radius number 
--- @field falloff number 
--- @field isPlaying boolean 
--- @field type string 
local SmartAudio = {}
function SmartAudio:Play() end

function SmartAudio:Stop() end

--- @param time number 
function SmartAudio:FadeIn(time) end

--- @param time number 
function SmartAudio:FadeOut(time) end

--- @param typeName string 
--- @return boolean 
function SmartAudio:IsA(typeName) end


--- @class SmartObject 
--- @field team number 
--- @field isTeamColorUsed boolean 
--- @field type string 
local SmartObject = {}
--- @return table 
function SmartObject:GetSmartProperties() end

--- @param propertyName string 
--- @return any|boolean 
function SmartObject:GetSmartProperty(propertyName) end

--- @param propertyName string 
--- @param propertyValue any 
--- @return boolean 
function SmartObject:SetSmartProperty(propertyName, propertyValue) end

--- @param typeName string 
--- @return boolean 
function SmartObject:IsA(typeName) end


--- @class SpotLight 
--- @field hasNaturalFalloff boolean 
--- @field falloffExponent number 
--- @field sourceRadius number 
--- @field sourceLength number 
--- @field innerConeAngle number 
--- @field outerConeAngle number 
--- @field type string 
local SpotLight = {}
--- @param typeName string 
--- @return boolean 
function SpotLight:IsA(typeName) end


--- @class StaticMesh 
--- @field isSimulatingDebrisPhysics boolean 
--- @field type string 
local StaticMesh = {}
--- @param typeName string 
--- @return boolean 
function StaticMesh:IsA(typeName) end


--- @class Task 
--- @field repeatInterval number 
--- @field repeatCount number 
--- @field id number 
--- @field type string 
local Task = {}
function Task:Cancel() end

--- @return TaskStatus 
function Task:GetStatus() end

--- @param typeName string 
--- @return boolean 
function Task:IsA(typeName) end


--- @class Terrain 
--- @field type string 
local Terrain = {}
--- @param typeName string 
--- @return boolean 
function Terrain:IsA(typeName) end


--- @class Transform 
--- @field type string 
local Transform = {}
--- @return Rotation 
function Transform:GetRotation() end

--- @param rotation Rotation 
function Transform:SetRotation(rotation) end

--- @return Vector3 
function Transform:GetPosition() end

--- @param position Vector3 
function Transform:SetPosition(position) end

--- @return Vector3 
function Transform:GetScale() end

--- @param scale Vector3 
function Transform:SetScale(scale) end

--- @return Quaternion 
function Transform:GetQuaternion() end

--- @param quaternion Quaternion 
function Transform:SetQuaternion(quaternion) end

--- @return Vector3 
function Transform:GetForwardVector() end

--- @return Vector3 
function Transform:GetRightVector() end

--- @return Vector3 
function Transform:GetUpVector() end

--- @return Transform 
function Transform:GetInverse() end

--- @param position Vector3 
--- @return Vector3 
function Transform:TransformPosition(position) end

--- @param direction Vector3 
--- @return Vector3 
function Transform:TransformDirection(direction) end

--- @param typeName string 
--- @return boolean 
function Transform:IsA(typeName) end


--- @class TreadedVehicle 
--- @field turnSpeed number 
--- @field type string 
local TreadedVehicle = {}
--- @param typeName string 
--- @return boolean 
function TreadedVehicle:IsA(typeName) end


--- @class Trigger 
--- @field isInteractable boolean 
--- @field interactionLabel string 
--- @field team number 
--- @field isTeamCollisionEnabled boolean 
--- @field isEnemyCollisionEnabled boolean 
--- @field type string 
local Trigger = {}
--- @param OtherObject Object 
--- @return boolean 
function Trigger:IsOverlapping(OtherObject) end

--- @return table<number, Object> 
function Trigger:GetOverlappingObjects() end

--- @param typeName string 
--- @return boolean 
function Trigger:IsA(typeName) end


--- @class UIButton 
--- @field text string 
--- @field fontSize number 
--- @field isInteractable boolean 
--- @field shouldClipToSize boolean 
--- @field type string 
local UIButton = {}
--- @param imageId string 
function UIButton:SetImage(imageId) end

--- @return Color 
function UIButton:GetButtonColor() end

--- @param color Color 
function UIButton:SetButtonColor(color) end

--- @return Color 
function UIButton:GetHoveredColor() end

--- @param color Color 
function UIButton:SetHoveredColor(color) end

--- @return Color 
function UIButton:GetPressedColor() end

--- @param color Color 
function UIButton:SetPressedColor(color) end

--- @return Color 
function UIButton:GetDisabledColor() end

--- @param color Color 
function UIButton:SetDisabledColor(color) end

--- @return Color 
function UIButton:GetFontColor() end

--- @param color Color 
function UIButton:SetFontColor(color) end

--- @param font string 
function UIButton:SetFont(font) end

--- @return Color 
function UIButton:GetShadowColor() end

--- @param color Color 
function UIButton:SetShadowColor(color) end

--- @return Vector2 
function UIButton:GetShadowOffset() end

--- @param vector2 Vector2 
function UIButton:SetShadowOffset(vector2) end

--- @param typeName string 
--- @return boolean 
function UIButton:IsA(typeName) end


--- @class UIContainer 
--- @field opacity number 
--- @field type string 
local UIContainer = {}
--- @param typeName string 
--- @return boolean 
function UIContainer:IsA(typeName) end


--- @class UIControl 
--- @field x number 
--- @field y number 
--- @field width number 
--- @field height number 
--- @field rotationAngle number 
--- @field anchor UIPivot 
--- @field dock UIPivot 
--- @field type string 
local UIControl = {}
--- @param typeName string 
--- @return boolean 
function UIControl:IsA(typeName) end


--- @class UIImage 
--- @field isTeamColorUsed boolean 
--- @field team number 
--- @field shouldClipToSize boolean 
--- @field type string 
local UIImage = {}
--- @return Color 
function UIImage:GetColor() end

--- @param color Color 
function UIImage:SetColor(color) end

--- @overload fun(imageId: string)
--- @param player Player 
function UIImage:SetImage(player) end

--- @overload fun(playerId: string)
--- @overload fun(friend: CoreFriendCollectionEntry)
--- @overload fun(playerProfile: CorePlayerProfile)
--- @param player Player 
function UIImage:SetPlayerProfile(player) end

--- @return string 
function UIImage:GetImage() end

--- @return Color 
function UIImage:GetShadowColor() end

--- @param color Color 
function UIImage:SetShadowColor(color) end

--- @return Vector2 
function UIImage:GetShadowOffset() end

--- @param vector2 Vector2 
function UIImage:SetShadowOffset(vector2) end

--- @param typeName string 
--- @return boolean 
function UIImage:IsA(typeName) end


--- @class UIPanel 
--- @field shouldClipChildren number 
--- @field opacity number 
--- @field type string 
local UIPanel = {}
--- @param typeName string 
--- @return boolean 
function UIPanel:IsA(typeName) end


--- @class UIPerkPurchaseButton 
--- @field isInteractable boolean 
--- @field type string 
local UIPerkPurchaseButton = {}
--- @param perkReference NetReference 
function UIPerkPurchaseButton:SetPerkReference(perkReference) end

--- @return NetReference 
function UIPerkPurchaseButton:GetPerkReference() end

--- @param typeName string 
--- @return boolean 
function UIPerkPurchaseButton:IsA(typeName) end


--- @class UIProgressBar 
--- @field progress number 
--- @field type string 
local UIProgressBar = {}
--- @return Color 
function UIProgressBar:GetFillColor() end

--- @param color Color 
function UIProgressBar:SetFillColor(color) end

--- @return Color 
function UIProgressBar:GetBackgroundColor() end

--- @param color Color 
function UIProgressBar:SetBackgroundColor(color) end

--- @param typeName string 
--- @return boolean 
function UIProgressBar:IsA(typeName) end


--- @class UIScrollPanel 
--- @field orientation Orientation 
--- @field scrollPosition number 
--- @field contentLength number 
--- @field type string 
local UIScrollPanel = {}
--- @param typeName string 
--- @return boolean 
function UIScrollPanel:IsA(typeName) end


--- @class UIText 
--- @field text string 
--- @field fontSize number 
--- @field justification TextJustify 
--- @field shouldWrapText boolean 
--- @field shouldClipText boolean 
--- @field type string 
local UIText = {}
--- @return Color 
function UIText:GetColor() end

--- @param color Color 
function UIText:SetColor(color) end

--- @return Vector2 
function UIText:ComputeApproximateSize() end

--- @param font string 
function UIText:SetFont(font) end

--- @return Color 
function UIText:GetShadowColor() end

--- @param color Color 
function UIText:SetShadowColor(color) end

--- @return Vector2 
function UIText:GetShadowOffset() end

--- @param vector2 Vector2 
function UIText:SetShadowOffset(vector2) end

--- @param typeName string 
--- @return boolean 
function UIText:IsA(typeName) end


--- @class Vector2 
--- @field x number 
--- @field y number 
--- @field size number 
--- @field sizeSquared number 
--- @field type string 
local Vector2 = {}
--- @return Vector2 
function Vector2:GetNormalized() end

--- @param typeName string 
--- @return boolean 
function Vector2:IsA(typeName) end


--- @class Vector3 
--- @field x number 
--- @field y number 
--- @field z number 
--- @field size number 
--- @field sizeSquared number 
--- @field type string 
local Vector3 = {}
--- @return Vector3 
function Vector3:GetNormalized() end

--- @param typeName string 
--- @return boolean 
function Vector3:IsA(typeName) end


--- @class Vector4 
--- @field x number 
--- @field y number 
--- @field z number 
--- @field w number 
--- @field size number 
--- @field sizeSquared number 
--- @field type string 
local Vector4 = {}
--- @return Vector4 
function Vector4:GetNormalized() end

--- @param typeName string 
--- @return boolean 
function Vector4:IsA(typeName) end


--- @class Vehicle 
--- @field isAccelerating boolean 
--- @field driver Player 
--- @field mass number 
--- @field maxSpeed number 
--- @field accelerationRate number 
--- @field brakeStrength number 
--- @field tireFriction number 
--- @field gravityScale number 
--- @field isDriverHidden boolean 
--- @field isDriverAttached boolean 
--- @field isBrakeEngaged boolean 
--- @field isHandbrakeEngaged boolean 
--- @field driverAnimationStance string 
--- @field enterTrigger Trigger 
--- @field camera Camera 
--- @field type string 
local Vehicle = {}
--- @return Vector3 
function Vehicle:GetPhysicsBodyOffset() end

--- @return Vector3 
function Vehicle:GetPhysicsBodyScale() end

--- @param driver Player 
function Vehicle:SetDriver(driver) end

function Vehicle:RemoveDriver() end

--- @param impulse Vector3 
function Vehicle:AddImpulse(impulse) end

--- @return Vector3 
function Vehicle:GetDriverPosition() end

--- @return Rotation 
function Vehicle:GetDriverRotation() end

--- @param typeName string 
--- @return boolean 
function Vehicle:IsA(typeName) end


--- @class Vfx 
--- @field type string 
local Vfx = {}
--- @param optionalParameters table 
function Vfx:Play(optionalParameters) end

--- @param optionalParameters table 
function Vfx:Stop(optionalParameters) end

--- @param typeName string 
--- @return boolean 
function Vfx:IsA(typeName) end


--- @class Weapon 
--- @field attackCooldownDuration number 
--- @field animationStance string 
--- @field multiShotCount number 
--- @field burstCount number 
--- @field shotsPerSecond number 
--- @field shouldBurstStopOnRelease boolean 
--- @field isHitscan boolean 
--- @field range number 
--- @field damage number 
--- @field directDamage number 
--- @field projectileTemplateId string 
--- @field muzzleFlashTemplateId string 
--- @field trailTemplateId string 
--- @field beamTemplateId string 
--- @field impactSurfaceTemplateId string 
--- @field impactProjectileTemplateId string 
--- @field impactPlayerTemplateId string 
--- @field projectileSpeed number 
--- @field projectileLifeSpan number 
--- @field projectileGravity number 
--- @field projectileLength number 
--- @field projectileRadius number 
--- @field projectileDrag number 
--- @field projectileBounceCount number 
--- @field projectilePierceCount number 
--- @field maxAmmo number 
--- @field currentAmmo number 
--- @field ammoType string 
--- @field isAmmoFinite boolean 
--- @field outOfAmmoSoundId string 
--- @field reloadSoundId string 
--- @field spreadMin number 
--- @field spreadMax number 
--- @field spreadAperture number 
--- @field spreadDecreaseSpeed number 
--- @field spreadIncreasePerShot number 
--- @field spreadPenaltyPerShot number 
--- @field type string 
local Weapon = {}
--- @return boolean 
function Weapon:HasAmmo() end

--- @overload fun(targetObject: CoreObject)
--- @overload fun(targetWorldPosition: Vector3)
--- @overload fun()
--- @param targetPlayer Player 
function Weapon:Attack(targetPlayer) end

--- @param typeName string 
--- @return boolean 
function Weapon:IsA(typeName) end


--- @class WorldText 
--- @field text string 
--- @field type string 
local WorldText = {}
--- @return Color 
function WorldText:GetColor() end

--- @param color Color 
function WorldText:SetColor(color) end

--- @param font string 
function WorldText:SetFont(font) end

--- @param typeName string 
--- @return boolean 
function WorldText:IsA(typeName) end







--- @class Chat 
Chat = {}
--- @param message string 
--- @param optionalParams table 
--- @return BroadcastMessageResultCode|string 
function Chat:BroadcastMessage(message, optionalParams) end

--- @param message string 
--- @param optionalParams table 
function Chat:LocalMessage(message, optionalParams) end


--- @class CoreDebug 
CoreDebug = {}
--- @overload fun(startPosition: Vector3,endPosition: Vector3)
--- @param startPosition Vector3 
--- @param endPosition Vector3 
--- @param parameters table 
function CoreDebug:DrawLine(startPosition, endPosition, parameters) end

--- @overload fun(centerPosition: Vector3,scale: Vector3)
--- @param centerPosition Vector3 
--- @param scale Vector3 
--- @param parameters table 
function CoreDebug:DrawBox(centerPosition, scale, parameters) end

--- @overload fun(centerPosition: Vector3,radius: number)
--- @param centerPosition Vector3 
--- @param radius number 
--- @param parameters table 
function CoreDebug:DrawSphere(centerPosition, radius, parameters) end

--- @return string 
function CoreDebug:GetStackTrace() end

--- @overload fun(task: Task): string
--- @return string 
function CoreDebug:GetTaskStackTrace() end


--- @class CoreMath 
CoreMath = {}
--- @param x number 
--- @param decimals number 
--- @return number 
function CoreMath:Round(x, decimals) end

--- @param from number 
--- @param to number 
--- @param progress number 
--- @return number 
function CoreMath:Lerp(from, to, progress) end

--- @param x number 
--- @param min number 
--- @param max number 
--- @return number 
function CoreMath:Clamp(x, min, max) end


--- @class CorePlatform 
CorePlatform = {}
--- @param gameId string 
--- @return CoreGameInfo 
function CorePlatform:GetGameInfo(gameId) end

--- @param collectionId string 
--- @return table<number, CoreGameCollectionEntry> 
function CorePlatform:GetGameCollection(collectionId) end

--- @param playerId string 
--- @return CorePlayerProfile 
function CorePlatform:GetPlayerProfile(playerId) end


--- @class CoreSocial 
CoreSocial = {}
--- @overload fun(player: Player): boolean
--- @param playerId string 
--- @return boolean 
function CoreSocial:IsFriendsWithLocalPlayer(playerId) end

--- @param player Player 
--- @return CoreFriendCollection 
function CoreSocial:GetFriends(player) end


--- @class CoreString 
CoreString = {}
--- @overload fun(string: string,delimiter: string,optionalParameters: table): any
--- @overload fun(string: string,optionalParameters: table): any
--- @overload fun(string: string,delimiter: string): any
--- @param string string 
--- @return any 
function CoreString:Split(string) end

--- @overload fun(delimiter: string): string
--- @param delimiter string 
--- @param strings any 
--- @return string 
function CoreString:Join(delimiter, strings) end

--- @overload fun(string: string): string
--- @param string string 
--- @param trimmedStrings any 
--- @return string 
function CoreString:Trim(string, trimmedStrings) end


--- @class Environment 
Environment = {}
--- @return boolean 
function Environment:IsClient() end

--- @return boolean 
function Environment:IsServer() end

--- @return boolean 
function Environment:IsMultiplayerPreview() end

--- @return boolean 
function Environment:IsSinglePlayerPreview() end

--- @return boolean 
function Environment:IsPreview() end

--- @return boolean 
function Environment:IsLocalGame() end

--- @return boolean 
function Environment:IsHostedGame() end


--- @class Events 
Events = {}
--- @overload fun(eventName: string,listener: function): EventListener
--- @param eventName string 
--- @param listener function 
--- @param additionalParameters any 
--- @return EventListener 
function Events:Connect(eventName, listener, additionalParameters) end

--- @overload fun(eventName: string,listener: function): EventListener
--- @param eventName string 
--- @param listener function 
--- @param additionalParameters any 
--- @return EventListener 
function Events:ConnectForPlayer(eventName, listener, additionalParameters) end

--- @overload fun(eventName: string)
--- @param eventName string 
--- @param argumentList any 
function Events:Broadcast(eventName, argumentList) end

--- @overload fun(eventName: string): BroadcastEventResultCode|string
--- @param eventName string 
--- @param argumentList any 
--- @return BroadcastEventResultCode|string 
function Events:BroadcastToServer(eventName, argumentList) end

--- @overload fun(eventName: string): BroadcastEventResultCode|string
--- @param eventName string 
--- @param argumentList any 
--- @return BroadcastEventResultCode|string 
function Events:BroadcastToAllPlayers(eventName, argumentList) end

--- @overload fun(player: Player,eventName: string): BroadcastEventResultCode|string
--- @param player Player 
--- @param eventName string 
--- @param argumentList any 
--- @return BroadcastEventResultCode|string 
function Events:BroadcastToPlayer(player, eventName, argumentList) end


--- @class Game 
--- @field playerJoinedEvent Event 
--- @field playerLeftEvent Event 
--- @field abilitySpawnedEvent Event 
--- @field roundStartEvent Event 
--- @field roundEndEvent Event 
--- @field teamScoreChangedEvent Event 
Game = {}
--- @return Player 
function Game:GetLocalPlayer() end

--- @param playerId string 
--- @return Player 
function Game:FindPlayer(playerId) end

--- @param optionalParams table 
--- @return table<number, Player> 
function Game:GetPlayers(optionalParams) end

--- @param worldPosition Vector3 
--- @param radius number 
--- @param optionalParams table 
--- @return table<number, Player> 
function Game:FindPlayersInCylinder(worldPosition, radius, optionalParams) end

--- @param worldPosition Vector3 
--- @param radius number 
--- @param optionalParams table 
--- @return table<number, Player> 
function Game:FindPlayersInSphere(worldPosition, radius, optionalParams) end

--- @param worldPosition Vector3 
--- @param optionalParameters table 
--- @return Player 
function Game:FindNearestPlayer(worldPosition, optionalParameters) end

function Game:StartRound() end

function Game:EndRound() end

--- @param team number 
--- @return number 
function Game:GetTeamScore(team) end

--- @param team number 
--- @param score number 
function Game:SetTeamScore(team, score) end

--- @param team number 
--- @param scoreChange number 
function Game:IncreaseTeamScore(team, scoreChange) end

--- @param team number 
--- @param scoreChange number 
function Game:DecreaseTeamScore(team, scoreChange) end

function Game:ResetTeamScores() end

function Game:StopAcceptingPlayers() end

--- @return boolean 
function Game:IsAcceptingPlayers() end

--- @overload fun(gameInfo: CoreGameInfo)
--- @overload fun(gameId: string)
--- @param gameCollectionEntry CoreGameCollectionEntry 
function Game:TransferAllPlayersToGame(gameCollectionEntry) end


--- @class Leaderboards 
Leaderboards = {}
--- @param leaderboardReference NetReference 
--- @param player Player 
--- @param score number 
--- @param additionalData string 
function Leaderboards:SubmitPlayerScore(leaderboardReference, player, score, additionalData) end

--- @param leaderboardReference NetReference 
--- @param leaderboardType LeaderboardType 
--- @return table 
function Leaderboards:GetLeaderboard(leaderboardReference, leaderboardType) end

--- @return boolean 
function Leaderboards:HasLeaderboards() end


--- @class Storage 
Storage = {}
--- @param data table 
--- @return number 
function Storage:SizeOfData(data) end

--- @param player Player 
--- @return table 
function Storage:GetPlayerData(player) end

--- @param player Player 
--- @param data table 
--- @return StorageResultCode|string 
function Storage:SetPlayerData(player, data) end

--- @param sharedStorageKey NetReference 
--- @param player Player 
--- @return table 
function Storage:GetSharedPlayerData(sharedStorageKey, player) end

--- @param sharedStorageKey NetReference 
--- @param player Player 
--- @param data table 
--- @return StorageResultCode|string 
function Storage:SetSharedPlayerData(sharedStorageKey, player, data) end

--- @param playerId string 
--- @return table 
function Storage:GetOfflinePlayerData(playerId) end

--- @param sharedStorageKey NetReference 
--- @param playerId string 
--- @return table 
function Storage:GetSharedOfflinePlayerData(sharedStorageKey, playerId) end


--- @class Teams 
Teams = {}
--- @param team1 number 
--- @param team2 number 
--- @return boolean 
function Teams:AreTeamsFriendly(team1, team2) end

--- @param team1 number 
--- @param team2 number 
--- @return boolean 
function Teams:AreTeamsEnemies(team1, team2) end


--- @class UI 
--- @field coreModalChangedEvent Event 
UI = {}
--- @param text string 
--- @param worldPosition Vector3 
--- @param optionalParameters table 
function UI:ShowFlyUpText(text, worldPosition, optionalParameters) end

--- @overload fun(sourcePlayer: Player)
--- @overload fun(sourceWorldPosition: Vector3)
--- @param sourceObject CoreObject 
function UI:ShowDamageDirection(sourceObject) end

--- @param worldPosition Vector3 
--- @return Vector2 
function UI:GetScreenPosition(worldPosition) end

--- @return Vector2 
function UI:GetScreenSize() end

--- @param message string 
--- @param color Color 
function UI:PrintToScreen(message, color) end

--- @return Vector2 
function UI:GetCursorPosition() end

--- @return HitResult 
function UI:GetCursorHitResult() end

--- @overload fun(pointOnPlane: Vector3): Vector3
--- @param pointOnPlane Vector3 
--- @param planeNormal Vector3 
--- @return Vector3 
function UI:GetCursorPlaneIntersection(pointOnPlane, planeNormal) end

--- @return boolean 
function UI:IsCursorVisible() end

--- @param isVisible boolean 
function UI:SetCursorVisible(isVisible) end

--- @return boolean 
function UI:IsCursorLockedToViewport() end

--- @param isLocked boolean 
function UI:SetCursorLockedToViewport(isLocked) end

--- @return boolean 
function UI:CanCursorInteractWithUI() end

--- @param canInteract boolean 
function UI:SetCanCursorInteractWithUI(canInteract) end

--- @return boolean 
function UI:IsReticleVisible() end

--- @param isVisible boolean 
function UI:SetReticleVisible(isVisible) end


--- @class World 
World = {}
--- @return CoreObject 
function World:GetRootObject() end

--- @param id string 
--- @return CoreObject 
function World:FindObjectById(id) end

--- @param name string 
--- @return CoreObject 
function World:FindObjectByName(name) end

--- @param name string 
--- @return table<number, CoreObject> 
function World:FindObjectsByName(name) end

--- @param typeName string 
--- @return table<number, CoreObject> 
function World:FindObjectsByType(typeName) end

--- @param assetId string 
--- @param optionalParameters table 
--- @return CoreObject 
function World:SpawnAsset(assetId, optionalParameters) end

--- @param startPosition Vector3 
--- @param endPosition Vector3 
--- @param optionalParameters table 
--- @return HitResult 
function World:Raycast(startPosition, endPosition, optionalParameters) end


--- @class AbilityFacingMode 
--- @field NONE 0 
--- @field MOVEMENT 1 
--- @field AIM 2 
AbilityFacingMode = {}
--- @class AbilityPhase 
--- @field READY 0 
--- @field CAST 1 
--- @field EXECUTE 2 
--- @field RECOVERY 3 
--- @field COOLDOWN 4 
AbilityPhase = {}
--- @class BroadcastEventResultCode 
--- @field SUCCESS 0 
--- @field FAILURE 1 
--- @field EXCEEDED_SIZE_LIMIT 2 
--- @field EXCEEDED_RATE_WARNING_LIMIT 3 
--- @field EXCEEDED_RATE_LIMIT 4 
BroadcastEventResultCode = {}
--- @class BroadcastMessageResultCode 
--- @field SUCCESS 0 
--- @field FAILURE 1 
--- @field EXCEEDED_SIZE_LIMIT 2 
--- @field EXCEEDED_RATE_WARNING_LIMIT 3 
--- @field EXCEEDED_RATE_LIMIT 4 
BroadcastMessageResultCode = {}
--- @class Collision 
--- @field INHERIT 0 
--- @field FORCE_ON 1 
--- @field FORCE_OFF 2 
Collision = {}
--- @class CoreModalType 
--- @field PAUSE_MENU 1 
--- @field CHARACTER_PICKER 2 
--- @field MOUNT_PICKER 3 
--- @field EMOTE_PICKER 4 
CoreModalType = {}
--- @class DamageReason 
--- @field UNKNOWN 0 
--- @field COMBAT 1 
--- @field FRIENDLY_FIRE 2 
--- @field MAP 3 
--- @field NPC 4 
DamageReason = {}
--- @class FacingMode 
--- @field FACE_AIM_WHEN_ACTIVE 0 
--- @field FACE_AIM_ALWAYS 1 
--- @field FACE_MOVEMENT 2 
FacingMode = {}
--- @class LeaderboardType 
--- @field GLOBAL 0 
--- @field DAILY 1 
--- @field WEEKLY 2 
--- @field MONTHLY 3 
LeaderboardType = {}
--- @class LookControlMode 
--- @field NONE 0 
--- @field RELATIVE 1 
--- @field LOOK_AT_CURSOR 2 
LookControlMode = {}
--- @class MovementControlMode 
--- @field NONE 0 
--- @field LOOK_RELATIVE 1 
--- @field VIEW_RELATIVE 2 
--- @field FACING_RELATIVE 3 
--- @field FIXED_AXES 4 
MovementControlMode = {}
--- @class MovementMode 
--- @field NONE 0 
--- @field WALKING 1 
--- @field FALLING 3 
--- @field SWIMMING 4 
--- @field FLYING 5 
--- @field SLIDING 6 
MovementMode = {}
--- @class NetReferenceType 
--- @field LEADERBOARD 1 
--- @field SHARED_STORAGE 2 
--- @field CREATOR_PERK 3 
--- @field UNKNOWN 0 
NetReferenceType = {}
--- @class Orientation 
--- @field HORIZONTAL 0 
--- @field VERTICAL 1 
Orientation = {}
--- @class PlayerTransferReason 
--- @field UNKNOWN 0 
--- @field CHARACTER 1 
--- @field CREATE 2 
--- @field SHOP 3 
--- @field BROWSE 4 
--- @field SOCIAL 5 
--- @field PORTAL 6 
--- @field AFK 7 
--- @field EXIT 8 
PlayerTransferReason = {}
--- @class RotationMode 
--- @field CAMERA 0 
--- @field NONE 1 
--- @field LOOK_ANGLE 2 
RotationMode = {}
--- @class StorageResultCode 
--- @field SUCCESS 0 
--- @field FAILURE 2 
--- @field STORAGE_DISABLED 1 
--- @field EXCEEDED_SIZE_LIMIT 3 
StorageResultCode = {}
--- @class TaskStatus 
--- @field UNINITIALIZED 0 
--- @field SCHEDULED 1 
--- @field RUNNING 2 
--- @field COMPLETED 3 
--- @field YIELDED 4 
--- @field FAILED 5 
--- @field CANCELED 6 
--- @field BLOCKED 7 
TaskStatus = {}
--- @class TextJustify 
--- @field LEFT 0 
--- @field CENTER 1 
--- @field RIGHT 2 
TextJustify = {}
--- @class UIPivot 
--- @field TOP_LEFT 0 
--- @field TOP_CENTER 1 
--- @field TOP_RIGHT 2 
--- @field MIDDLE_LEFT 3 
--- @field MIDDLE_CENTER 4 
--- @field MIDDLE_RIGHT 5 
--- @field BOTTOM_LEFT 6 
--- @field BOTTOM_CENTER 7 
--- @field BOTTOM_RIGHT 8 
--- @field CUSTOM 9 
UIPivot = {}
--- @class Visibility 
--- @field INHERIT 0 
--- @field FORCE_ON 1 
--- @field FORCE_OFF 2 
Visibility = {}