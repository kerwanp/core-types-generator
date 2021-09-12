--- @class AIActivity 
--- @field name string 
--- @field owner AIActivityHandler 
--- @field priority number 
--- @field isDebugModeEnabled boolean 
--- @field isHighestPriority boolean 
--- @field elapsedTime number 
--- @field type string 
local AIActivityInstance = {}
--- @param typeName string 
--- @return boolean 
function AIActivityInstance:IsA(typeName) end

--- @class GlobalAIActivity 
AIActivity = {}

--- @class AIActivityHandler : CoreObject 
--- @field isSelectedInDebugger boolean 
--- @field type string 
local AIActivityHandlerInstance = {}
--- Creates a new AIActivity registered to the handler with the given unique name and optional functions. Raises an error if the provided name is already in use by another activity in the same handler. `functions` may contain the following:
--- 
--- `tick - function(number deltaTime)`: Called for each activity on each tick by the handler, expected to adjust the priority of the activity.
--- 
--- `tickHighestPriority - function(number deltaTime)`: Called after `tick` for whichever activity has the highest priority within the handler.
--- 
--- `start - function()`: Called between `tick` and `tickHighestPriority` when an activity has become the new highest priority activity within the handler.
--- 
--- `stop - function()`: Called when the current highest priority activity has been removed from the handler or is otherwise no longer the highest priority activity.
--- 
--- @overload fun(name: string): AIActivity
--- @param name string 
--- @param functions table 
--- @return AIActivity 
function AIActivityHandlerInstance:AddActivity(name, functions) end

--- Removes the activity with the given name from the handler. Logs a warning if no activity is found with that name. If the named activity is currently the highest priority activity in the handler, its `stop` function will be called.
--- 
--- @param name string 
function AIActivityHandlerInstance:RemoveActivity(name) end

--- Removes all activities from the handler. Calls the `stop` function for the highest priority activity.
--- 
function AIActivityHandlerInstance:ClearActivities() end

--- Returns an array of all of the handler's activities.
--- 
--- @return table<number, AIActivity> 
function AIActivityHandlerInstance:GetActivities() end

--- Returns the activity with the given name, or `nil` if that name is not found in the handler.
--- 
--- @param name string 
--- @return AIActivity 
function AIActivityHandlerInstance:FindActivity(name) end

--- @param typeName string 
--- @return boolean 
function AIActivityHandlerInstance:IsA(typeName) end

--- @class GlobalAIActivityHandler : CoreObject 
AIActivityHandler = {}

--- @class Ability : CoreObject 
--- @field readyEvent Event 
--- @field castEvent Event 
--- @field executeEvent Event 
--- @field recoveryEvent Event 
--- @field cooldownEvent Event 
--- @field interruptedEvent Event 
--- @field tickEvent Event 
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
local AbilityInstance = {}
--- Returns information about what the Player has targeted this phase.
--- 
--- @return AbilityTarget 
function AbilityInstance:GetTargetData() end

--- Updates information about what the Player has targeted this phase. This can affect the execution of the Ability.
--- 
--- @param target AbilityTarget 
function AbilityInstance:SetTargetData(target) end

--- The current AbilityPhase for this Ability. These are returned as one of: AbilityPhase.READY, AbilityPhase.CAST, AbilityPhase.EXECUTE, AbilityPhase.RECOVERY and AbilityPhase.COOLDOWN.
--- 
--- @return AbilityPhase 
function AbilityInstance:GetCurrentPhase() end

--- Seconds left in the current phase.
--- 
--- @return number 
function AbilityInstance:GetPhaseTimeRemaining() end

--- Changes an Ability from Cast phase to Ready phase. If the Ability is in either Execute or Recovery phases it instead goes to Cooldown phase.
--- 
function AbilityInstance:Interrupt() end

--- Activates an Ability as if the button had been pressed.
--- 
function AbilityInstance:Activate() end

--- Advances a currently active Ability from its current phase to the next phase. For example, an ability in the Cast phase will begin the Execute phase, an ability on cooldown will become ready, etc.
--- 
function AbilityInstance:AdvancePhase() end

--- @param typeName string 
--- @return boolean 
function AbilityInstance:IsA(typeName) end

--- @class GlobalAbility : CoreObject 
Ability = {}

--- @class AbilityPhaseSettings 
--- @field duration number 
--- @field canMove boolean 
--- @field canJump boolean 
--- @field canRotate boolean 
--- @field preventsOtherAbilities boolean 
--- @field isTargetDataUpdated boolean 
--- @field facingMode AbilityFacingMode 
--- @field type string 
local AbilityPhaseSettingsInstance = {}
--- @param typeName string 
--- @return boolean 
function AbilityPhaseSettingsInstance:IsA(typeName) end

--- @class GlobalAbilityPhaseSettings 
AbilityPhaseSettings = {}

--- @class AbilityTarget 
--- @field hitPlayer Player 
--- @field hitObject Object 
--- @field spreadHalfAngle number 
--- @field spreadRandomSeed number 
--- @field type string 
local AbilityTargetInstance = {}
--- Gets the direction the Player is moving.
--- 
--- @return Rotation 
function AbilityTargetInstance:GetOwnerMovementRotation() end

--- Sets the direction the Player faces, if `Ability.facingMode` is set to `AbilityFacingMode.MOVEMENT`.
--- 
--- @param rotation Rotation 
function AbilityTargetInstance:SetOwnerMovementRotation(rotation) end

--- Returns the world space position of the camera.
--- 
--- @return Vector3 
function AbilityTargetInstance:GetAimPosition() end

--- The world space location of the camera. Setting this currently has no effect on the Player's camera.
--- 
--- @param worldPosition Vector3 
function AbilityTargetInstance:SetAimPosition(worldPosition) end

--- Returns the direction the camera is facing.
--- 
--- @return Vector3 
function AbilityTargetInstance:GetAimDirection() end

--- Sets the direction the camera is facing.
--- 
--- @param direction Vector3 
function AbilityTargetInstance:SetAimDirection(direction) end

--- Returns the world space position of the object under the Player's reticle. If there is no object, a position under the reticle in the distance. If the Player doesn't have a reticle displayed, uses the center of the screen as if there was a reticle there.
--- 
--- @return Vector3 
function AbilityTargetInstance:GetHitPosition() end

--- Sets the hit position property. This may affect weapon behavior.
--- 
--- @param worldPosition Vector3 
function AbilityTargetInstance:SetHitPosition(worldPosition) end

--- Returns physics information about the point being targeted
--- 
--- @return HitResult 
function AbilityTargetInstance:GetHitResult() end

--- Sets the hit result property. Setting this value has no affect on the Ability.
--- 
--- @param hitResult HitResult 
function AbilityTargetInstance:SetHitResult(hitResult) end

--- @param typeName string 
--- @return boolean 
function AbilityTargetInstance:IsA(typeName) end

--- @class GlobalAbilityTarget 
AbilityTarget = {}
--- Constructs a new Ability Target data object.
--- 
--- @return AbilityTarget 
function AbilityTarget.New() end


--- @class AnimatedMesh : CoreMesh 
--- @field animationEvent Event 
--- @field animationStance string 
--- @field animationStancePlaybackRate number 
--- @field animationStanceShouldLoop boolean 
--- @field playbackRateMultiplier number 
--- @field type string 
local AnimatedMeshInstance = {}
--- Returns an array of all available animations on this object.
--- 
--- @return table<number, string> 
function AnimatedMeshInstance:GetAnimationNames() end

--- Returns an array of all available animation stances on this object.
--- 
--- @return table<number, string> 
function AnimatedMeshInstance:GetAnimationStanceNames() end

--- Returns an array of all available sockets on this object.
--- 
--- @return table<number, string> 
function AnimatedMeshInstance:GetSocketNames() end

--- Returns an array of available animation event names for the specified animation. Raises an error if `animationName` is not a valid animation on this mesh.
--- 
--- @param animationName string 
--- @return table<number, string> 
function AnimatedMeshInstance:GetAnimationEventNames(animationName) end

--- Attaches the specified object to the specified socket on the mesh if they exist.
--- 
--- @param objectToAttach CoreObject 
--- @param socket string 
function AnimatedMeshInstance:AttachCoreObject(objectToAttach, socket) end

--- Plays an animation on the animated mesh.<br /> Optional parameters can be provided to control the animation playback: `startPosition (number)`: A number between 0 and 1 controlling where in the animation playback will start; `playbackRate (number)`: Controls how fast the animation plays; `shouldLoop (boolean)`: If `true`, the animation will keep playing in a loop. If `false` the animation will stop playing once completed.
--- 
--- @overload fun(animationName: string)
--- @param animationName string 
--- @param optionalParameters table 
function AnimatedMeshInstance:PlayAnimation(animationName, optionalParameters) end

--- Stops all in-progress animations played via `PlayAnimation` on this object.
--- 
function AnimatedMeshInstance:StopAnimations() end

--- Returns the duration of the animation in seconds. Raises an error if `animationName` is not a valid animation on this mesh.
--- 
--- @param animationName string 
--- @return number 
function AnimatedMeshInstance:GetAnimationDuration(animationName) end

--- Assigns a mesh to the specified slot on this `AnimatedMesh`. If `assetId` is an empty string or identifies an incompatible asset, the slot will be cleared.
--- 
--- @param slotIndex number 
--- @param assetId string 
function AnimatedMeshInstance:SetMeshForSlot(slotIndex, assetId) end

--- Returns the asset ID of the mesh assigned to the specified slot on this `AnimatedMesh`. Returns `nil` if no mesh is assigned to the slot.
--- 
--- @param slotIndex number 
--- @return string 
function AnimatedMeshInstance:GetMeshForSlot(slotIndex) end

--- Set the material in the given slot to the material specified by assetId.
--- 
--- @param assetId string 
--- @param slotName string 
function AnimatedMeshInstance:SetMaterialForSlot(assetId, slotName) end

--- Get the MaterialSlot object for the given slot. If called on the client on a networked object, the resulting object cannot be modified.
--- 
--- @param slotName string 
--- @return MaterialSlot 
function AnimatedMeshInstance:GetMaterialSlot(slotName) end

--- Get an array of all MaterialSlots on this mesh. If called on the client on a networked object, the resulting object cannot be modified.
--- 
--- @return table<number, MaterialSlot> 
function AnimatedMeshInstance:GetMaterialSlots() end

--- Resets a material slot to its original state.
--- 
--- @param slotName string 
function AnimatedMeshInstance:ResetMaterialSlot(slotName) end

--- @param typeName string 
--- @return boolean 
function AnimatedMeshInstance:IsA(typeName) end

--- @class GlobalAnimatedMesh : CoreMesh 
AnimatedMesh = {}

--- @class AreaLight : Light 
--- @field sourceWidth number 
--- @field sourceHeight number 
--- @field barnDoorAngle number 
--- @field barnDoorLength number 
--- @field type string 
local AreaLightInstance = {}
--- @param typeName string 
--- @return boolean 
function AreaLightInstance:IsA(typeName) end

--- @class GlobalAreaLight : Light 
AreaLight = {}

--- @class Audio : CoreObject 
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
local AudioInstance = {}
--- Begins sound playback.
--- 
function AudioInstance:Play() end

--- Stops sound playback.
--- 
function AudioInstance:Stop() end

--- Starts playing and fades in the sound over the given time.
--- 
--- @param time number 
function AudioInstance:FadeIn(time) end

--- Fades the sound out and stops over time seconds.
--- 
--- @param time number 
function AudioInstance:FadeOut(time) end

--- @param typeName string 
--- @return boolean 
function AudioInstance:IsA(typeName) end

--- @class GlobalAudio : CoreObject 
Audio = {}

--- @class Camera : CoreObject 
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
--- @field useAsAudioListener boolean 
--- @field audioListenerOffset Vector3 
--- @field lerpTime number 
--- @field isUsingCameraRotation boolean 
--- @field type string 
local CameraInstance = {}
--- An offset added to the camera or follow target's eye position to the Player's view.
--- 
--- @return Vector3 
function CameraInstance:GetPositionOffset() end

--- An offset added to the camera or follow target's eye position to the Player's view.
--- 
--- @param positionOffset Vector3 
function CameraInstance:SetPositionOffset(positionOffset) end

--- A rotation added to the camera or follow target's eye position.
--- 
--- @return Rotation 
function CameraInstance:GetRotationOffset() end

--- A rotation added to the camera or follow target's eye position.
--- 
--- @param rotationOffset Rotation 
function CameraInstance:SetRotationOffset(rotationOffset) end

--- Returns the local offset to the view position when using this camera as the audio listener.
--- 
--- @return Vector3 
function CameraInstance:GetAudioListenerOffset() end

--- Sets the local offset to the view position when using this camera as the audio listener.
--- 
--- @param offset Vector3 
function CameraInstance:SetAudioListenerOffset(offset) end

--- Captures an image at the specified resolution using this camera. Returns a `CameraCapture` object that may be used to display this image or refresh the capture. May return `nil` if the maximum number of capture instances at the desired resolution has been exceeded. The optional parameter table is currently unused.
--- 
--- @overload fun(resolution: CameraCaptureResolution): CameraCapture
--- @param resolution CameraCaptureResolution 
--- @param optionalParameters table 
--- @return CameraCapture 
function CameraInstance:Capture(resolution, optionalParameters) end

--- @param typeName string 
--- @return boolean 
function CameraInstance:IsA(typeName) end

--- @class GlobalCamera : CoreObject 
Camera = {}

--- @class CameraCapture 
--- @field resolution CameraCaptureResolution 
--- @field camera Camera 
--- @field type string 
local CameraCaptureInstance = {}
--- Returns `true` if this capture instance has valid resources.
--- 
--- @return boolean 
function CameraCaptureInstance:IsValid() end

--- Recaptures the render using the current camera.
--- 
function CameraCaptureInstance:Refresh() end

--- Releases the texture resources associated with this capture instance. This instance will become invalid and should no longer be used.
--- 
function CameraCaptureInstance:Release() end

--- @param typeName string 
--- @return boolean 
function CameraCaptureInstance:IsA(typeName) end

--- @class GlobalCameraCapture 
CameraCapture = {}

--- @class Color 
--- @field r number 
--- @field g number 
--- @field b number 
--- @field a number 
--- @field type string 
local ColorInstance = {}
--- Returns the desaturated version of the Color. 0 represents no desaturation and 1 represents full desaturation.
--- 
--- @param desaturation number 
--- @return Color 
function ColorInstance:GetDesaturated(desaturation) end

--- Returns a hexadecimal sRGB representation of this color, in the format "#RRGGBBAA". Channel values outside the normal 0-1 range will be clamped, and some precision may be lost.
--- 
--- @return string 
function ColorInstance:ToStandardHex() end

--- Returns a hexadecimal linear RGB representation of this color, in the format "#RRGGBBAA". Channel values outside the normal 0-1 range will be clamped, and some precision may be lost.
--- 
--- @return string 
function ColorInstance:ToLinearHex() end

--- @param typeName string 
--- @return boolean 
function ColorInstance:IsA(typeName) end

--- @class GlobalColor 
Color = {}
--- Returns a new color with random RGB values and Alpha of 1.0.
--- 
--- @return Color 
function Color.Random() end

--- Linearly interpolates between two colors in HSV space by the specified progress amount and returns the resultant Color.
--- 
--- @param from Color 
--- @param to Color 
--- @param progress number 
--- @return Color 
function Color.Lerp(from, to, progress) end

--- Creates a Color from the given sRGB hexadecimal string. Supported formats include "#RGB", "#RGBA", "#RRGGBB", and "#RRGGBBAA", with or without the leading "#".
--- 
--- @param hexString string 
--- @return Color 
function Color.FromStandardHex(hexString) end

--- Creates a Color from the given linear RGB hexadecimal string. Supported formats include "#RGB", "#RGBA", "#RRGGBB", and "#RRGGBBAA", with or without the leading "#".
--- 
--- @param hexString string 
--- @return Color 
function Color.FromLinearHex(hexString) end

--- Constructs a new Color.
--- 
--- @overload fun(rgbaVector: Vector4): Color
--- @overload fun(rgbVector: Vector3): Color
--- @overload fun(red: number,green: number,blue: number,alpha: number): Color
--- @overload fun(red: number,green: number,blue: number): Color
--- @overload fun(): Color
--- @param color Color 
--- @return Color 
function Color.New(color) end


--- @class CoreFriendCollection 
--- @field hasMoreResults boolean 
--- @field type string 
local CoreFriendCollectionInstance = {}
--- Returns the list of friends contained in this set of results. This may return an empty table for players who have no friends.
--- 
--- @return table<number, CoreFriendCollectionEntry> 
function CoreFriendCollectionInstance:GetResults() end

--- Requests the next set of results for this list of friends and returns a new collection containing those results. Returns `nil` if the `hasMoreResults` property is `false`. This function may yield until a result is available, and may raise an error if an error occurs retrieving the information.
--- 
--- @return CoreFriendCollection 
function CoreFriendCollectionInstance:GetMoreResults() end

--- @param typeName string 
--- @return boolean 
function CoreFriendCollectionInstance:IsA(typeName) end

--- @class GlobalCoreFriendCollection 
CoreFriendCollection = {}

--- @class CoreFriendCollectionEntry 
--- @field id string 
--- @field name string 
--- @field type string 
local CoreFriendCollectionEntryInstance = {}
--- @param typeName string 
--- @return boolean 
function CoreFriendCollectionEntryInstance:IsA(typeName) end

--- @class GlobalCoreFriendCollectionEntry 
CoreFriendCollectionEntry = {}

--- @class CoreGameCollectionEntry 
--- @field id string 
--- @field parentGameId string 
--- @field name string 
--- @field ownerId string 
--- @field ownerName string 
--- @field isPromoted boolean 
--- @field type string 
local CoreGameCollectionEntryInstance = {}
--- @param typeName string 
--- @return boolean 
function CoreGameCollectionEntryInstance:IsA(typeName) end

--- @class GlobalCoreGameCollectionEntry 
CoreGameCollectionEntry = {}

--- @class CoreGameInfo 
--- @field id string 
--- @field parentGameId string 
--- @field name string 
--- @field description string 
--- @field ownerId string 
--- @field ownerName string 
--- @field maxPlayers number 
--- @field isQueueEnabled boolean 
--- @field screenshotCount number 
--- @field hasWorldCapture boolean 
--- @field type string 
local CoreGameInfoInstance = {}
--- Returns a list of the tags selected when this game was published.
--- 
--- @return table<number, string> 
function CoreGameInfoInstance:GetTags() end

--- @param typeName string 
--- @return boolean 
function CoreGameInfoInstance:IsA(typeName) end

--- @class GlobalCoreGameInfo 
CoreGameInfo = {}

--- @class CoreMesh : CoreObject 
--- @field meshAssetId string 
--- @field team number 
--- @field isTeamColorUsed boolean 
--- @field isTeamCollisionEnabled boolean 
--- @field isEnemyCollisionEnabled boolean 
--- @field isCameraCollisionEnabled boolean 
--- @field type string 
local CoreMeshInstance = {}
--- Returns the color override previously set from script, or `0, 0, 0, 0` if no such color has been set.
--- 
--- @return Color 
function CoreMeshInstance:GetColor() end

--- Overrides the color of all materials on the mesh, and replicates the new colors.
--- 
--- @param color Color 
function CoreMeshInstance:SetColor(color) end

--- Turns off the color override, if there is one.
--- 
function CoreMeshInstance:ResetColor() end

--- @param typeName string 
--- @return boolean 
function CoreMeshInstance:IsA(typeName) end

--- @class GlobalCoreMesh : CoreObject 
CoreMesh = {}

--- @class CoreObject 
--- @field childAddedEvent Event 
--- @field childRemovedEvent Event 
--- @field descendantAddedEvent Event 
--- @field descendantRemovedEvent Event 
--- @field destroyEvent Event 
--- @field networkedPropertyChangedEvent Event 
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
local CoreObjectInstance = {}
--- Returns a CoreObjectReference pointing at this object.
--- 
--- @return CoreObjectReference 
function CoreObjectInstance:GetReference() end

--- The Transform relative to this object's parent.
--- 
--- @return Transform 
function CoreObjectInstance:GetTransform() end

--- The Transform relative to this object's parent.
--- 
--- @param localTransform Transform 
function CoreObjectInstance:SetTransform(localTransform) end

--- The position of this object relative to its parent.
--- 
--- @return Vector3 
function CoreObjectInstance:GetPosition() end

--- The position of this object relative to its parent.
--- 
--- @param localPosition Vector3 
function CoreObjectInstance:SetPosition(localPosition) end

--- The rotation relative to its parent.
--- 
--- @return Rotation 
function CoreObjectInstance:GetRotation() end

--- The rotation relative to its parent.
--- 
--- @param localRotation Rotation 
function CoreObjectInstance:SetRotation(localRotation) end

--- The scale relative to its parent.
--- 
--- @return Vector3 
function CoreObjectInstance:GetScale() end

--- The scale relative to its parent.
--- 
--- @param localScale Vector3 
function CoreObjectInstance:SetScale(localScale) end

--- The absolute Transform of this object.
--- 
--- @return Transform 
function CoreObjectInstance:GetWorldTransform() end

--- The absolute Transform of this object.
--- 
--- @param worldTransform Transform 
function CoreObjectInstance:SetWorldTransform(worldTransform) end

--- The absolute position.
--- 
--- @return Vector3 
function CoreObjectInstance:GetWorldPosition() end

--- The absolute position.
--- 
--- @param worldPosition Vector3 
function CoreObjectInstance:SetWorldPosition(worldPosition) end

--- The absolute rotation.
--- 
--- @return Rotation 
function CoreObjectInstance:GetWorldRotation() end

--- The absolute rotation.
--- 
--- @param worldRotation Rotation 
function CoreObjectInstance:SetWorldRotation(worldRotation) end

--- The absolute scale.
--- 
--- @return Vector3 
function CoreObjectInstance:GetWorldScale() end

--- The absolute scale.
--- 
--- @param worldScale Vector3 
function CoreObjectInstance:SetWorldScale(worldScale) end

--- The object's velocity in world space. The velocity vector indicates the direction, with its magnitude expressed in centimeters per second.
--- 
--- @return Vector3 
function CoreObjectInstance:GetVelocity() end

--- Set the object's velocity in world space. Only works for physics objects. The velocity vector indicates the direction, with its magnitude expressed in centimeters per second.
--- 
--- @param velocity Vector3 
function CoreObjectInstance:SetVelocity(velocity) end

--- The object's angular velocity in degrees per second.
--- 
--- @return Vector3 
function CoreObjectInstance:GetAngularVelocity() end

--- Set the object's angular velocity in degrees per second in world space. Only works for physics objects.
--- 
--- @param angularVelocity Vector3 
function CoreObjectInstance:SetAngularVelocity(angularVelocity) end

--- Set the object's angular velocity in degrees per second in local space. Only works for physics objects.
--- 
--- @param localAngularVelocity Vector3 
function CoreObjectInstance:SetLocalAngularVelocity(localAngularVelocity) end

--- Returns a table containing the object's children, may be empty. Order is not guaranteed to match what is in the hierarchy.
--- 
--- @return table<number, CoreObject> 
function CoreObjectInstance:GetChildren() end

--- Attaches a CoreObject to a Player at a specified socket. The CoreObject will be un-parented from its current hierarchy and its `parent` property will be nil. See [Socket Names](../api/animations.md#socket-names) for the list of possible values.
--- 
--- @param player Player 
--- @param socketName string 
function CoreObjectInstance:AttachToPlayer(player, socketName) end

--- Attaches a CoreObject to the local player's camera. Reminder to turn off the object's collision otherwise it will cause camera to jitter.
--- 
function CoreObjectInstance:AttachToLocalView() end

--- Detaches a CoreObject from any player it has been attached to, or from its parent object.
--- 
function CoreObjectInstance:Detach() end

--- Returns the name of the socket this object is attached to.
--- 
--- @return string 
function CoreObjectInstance:GetAttachedToSocketName() end

--- Returns true if this object and all of its ancestors are visible.
--- 
--- @return boolean 
function CoreObjectInstance:IsVisibleInHierarchy() end

--- Returns true if this object and all of its ancestors are collidable.
--- 
--- @return boolean 
function CoreObjectInstance:IsCollidableInHierarchy() end

--- Returns true if this object and all of its ancestors are collidable with the camera.
--- 
--- @return boolean 
function CoreObjectInstance:IsCameraCollidableInHierarchy() end

--- Returns true if this object and all of its ancestors are enabled.
--- 
--- @return boolean 
function CoreObjectInstance:IsEnabledInHierarchy() end

--- Returns the first parent or ancestor whose name matches the provided name. If none match, returns nil.
--- 
--- @param name string 
--- @return CoreObject 
function CoreObjectInstance:FindAncestorByName(name) end

--- Returns the first immediate child whose name matches the provided name. If none match, returns nil.
--- 
--- @param name string 
--- @return CoreObject 
function CoreObjectInstance:FindChildByName(name) end

--- Returns the first child or descendant whose name matches the provided name. If none match, returns nil.
--- 
--- @param name string 
--- @return CoreObject 
function CoreObjectInstance:FindDescendantByName(name) end

--- Returns the descendants whose name matches the provided name. If none match, returns an empty table.
--- 
--- @param name string 
--- @return table<number, CoreObject> 
function CoreObjectInstance:FindDescendantsByName(name) end

--- Returns the first parent or ancestor whose type is or extends the specified type. For example, calling FindAncestorByType('CoreObject') will return the first ancestor that is any type of CoreObject, while FindAncestorByType('StaticMesh') will only return the first mesh. If no ancestors match, returns nil.
--- 
--- @param typeName string 
--- @return CoreObject 
function CoreObjectInstance:FindAncestorByType(typeName) end

--- Returns the first immediate child whose type is or extends the specified type. If none match, returns nil.
--- 
--- @param typeName string 
--- @return CoreObject 
function CoreObjectInstance:FindChildByType(typeName) end

--- Returns the first child or descendant whose type is or extends the specified type. If none match, returns nil.
--- 
--- @param typeName string 
--- @return CoreObject 
function CoreObjectInstance:FindDescendantByType(typeName) end

--- Returns the descendants whose type is or extends the specified type. If none match, returns an empty table.
--- 
--- @param typeName string 
--- @return table<number, CoreObject> 
function CoreObjectInstance:FindDescendantsByType(typeName) end

--- If the object is part of a template, returns the root object of the template (which may be itself). If not part of a template, returns nil.
--- 
--- @return CoreObject 
function CoreObjectInstance:FindTemplateRoot() end

--- Returns true if this CoreObject is a parent somewhere in the hierarchy above the given parameter object. False otherwise.
--- 
--- @param coreObject CoreObject 
--- @return boolean 
function CoreObjectInstance:IsAncestorOf(coreObject) end

--- Smoothly moves the object to the target location over a given amount of time (seconds). Third parameter specifies if the given destination is in local space (true) or world space (false).
--- 
--- @overload fun(worldPosition: Vector3,duration: number)
--- @param position Vector3 
--- @param duration number 
--- @param isLocalPosition boolean 
function CoreObjectInstance:MoveTo(position, duration, isLocalPosition) end

--- Smoothly moves the object over time by the given velocity vector. Second parameter specifies if the given velocity is in local space (true) or world space (false). The velocity vector indicates the direction, with its magnitude expressed in centimeters per second.
--- 
--- @overload fun(worldVelocity: Vector3)
--- @param worldVelocity Vector3 
--- @param isLocalVelocity boolean 
function CoreObjectInstance:MoveContinuous(worldVelocity, isLocalVelocity) end

--- Follows a CoreObject or Player at a certain speed. If the speed is not supplied it will follow as fast as possible. The third parameter specifies a distance to keep away from the target.
--- 
--- @overload fun(target: Player,speed: number)
--- @overload fun(target: Player)
--- @overload fun(target: CoreObject,speed: number,minimumDistance: number)
--- @overload fun(target: CoreObject,speed: number)
--- @overload fun(target: CoreObject)
--- @param target Player 
--- @param speed number 
--- @param minimumDistance number 
function CoreObjectInstance:Follow(target, speed, minimumDistance) end

--- Interrupts further movement from MoveTo(), MoveContinuous(), or Follow().
--- 
function CoreObjectInstance:StopMove() end

--- Smoothly rotates the object to the target orientation over a given amount of time. Third parameter specifies if given rotation is in local space (true) or world space (false).
--- 
--- @overload fun(worldRotation: Quaternion,duration: number)
--- @overload fun(rotation: Rotation,duration: number,isLocalRotation: boolean)
--- @overload fun(worldRotation: Rotation,duration: number)
--- @param rotation Quaternion 
--- @param duration number 
--- @param isLocalRotation boolean 
function CoreObjectInstance:RotateTo(rotation, duration, isLocalRotation) end

--- Smoothly rotates the object over time by the given rotation (per second). The second parameter is an optional multiplier, for very fast rotations. Third parameter specifies if the given rotation or quaternion is in local space (true) or world space (false (default)). Angular velocity is expressed in degrees per second.
--- 
--- @overload fun(angularVelocity: Vector3)
--- @overload fun(quaternionSpeed: Quaternion,multiplier: number,isLocalQuaternionSpeed: boolean)
--- @overload fun(quaternionSpeed: Quaternion,multiplier: number)
--- @overload fun(quaternionSpeed: Quaternion)
--- @overload fun(rotationSpeed: Rotation,multiplier: number,isLocalRotationSpeed: boolean)
--- @overload fun(rotationSpeed: Rotation,multiplier: number)
--- @overload fun(rotationSpeed: Rotation)
--- @param angularVelocity Vector3 
--- @param isLocalAngularVelocity boolean 
function CoreObjectInstance:RotateContinuous(angularVelocity, isLocalAngularVelocity) end

--- Instantly rotates the object to look at the given position.
--- 
--- @param worldPosition Vector3 
function CoreObjectInstance:LookAt(worldPosition) end

--- Smoothly rotates a CoreObject to look at another given CoreObject or Player. Second parameter is optional and locks the pitch, default is unlocked. Third parameter is optional and sets how fast it tracks the target (in radians/second). If speed is not supplied it tracks as fast as possible.
--- 
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
function CoreObjectInstance:LookAtContinuous(target, isPitchLocked, speed) end

--- Continuously looks at the local camera. The boolean parameter is optional and locks the pitch. (Client-only)
--- 
--- @overload fun()
--- @param isPitchLocked boolean 
function CoreObjectInstance:LookAtLocalView(isPitchLocked) end

--- Interrupts further rotation from RotateTo(), RotateContinuous(), LookAtContinuous(), or LookAtLocalView().
--- 
function CoreObjectInstance:StopRotate() end

--- Smoothly scales the object to the target scale over a given amount of time. Third parameter specifies if the given scale is in local space (true) or world space (false).
--- 
--- @overload fun(worldScale: Vector3,duration: number)
--- @param scale Vector3 
--- @param duration number 
--- @param isScaleLocal boolean 
function CoreObjectInstance:ScaleTo(scale, duration, isScaleLocal) end

--- Smoothly scales the object over time by the given scale vector per second. Second parameter specifies if the given scale rate is in local space (true) or world space (false).
--- 
--- @overload fun(scaleRate: Vector3)
--- @param scaleRate Vector3 
--- @param isLocalScaleRate boolean 
function CoreObjectInstance:ScaleContinuous(scaleRate, isLocalScaleRate) end

--- Interrupts further movement from ScaleTo() or ScaleContinuous().
--- 
function CoreObjectInstance:StopScale() end

--- Reorders this object before all of its siblings in the hierarchy.
--- 
function CoreObjectInstance:ReorderBeforeSiblings() end

--- Reorders this object after all of its siblings in the hierarchy.
--- 
function CoreObjectInstance:ReorderAfterSiblings() end

--- Reorders this object just before the specified sibling in the hierarchy.
--- 
--- @param sibling CoreObject 
function CoreObjectInstance:ReorderBefore(sibling) end

--- Reorders this object just after the specified sibling in the hierarchy.
--- 
--- @param sibling CoreObject 
function CoreObjectInstance:ReorderAfter(sibling) end

--- Destroys the object and all descendants. You can check whether an object has been destroyed by calling `Object.IsValid(object)`, which will return true if object is still a valid object, or false if it has been destroyed.
--- 
function CoreObjectInstance:Destroy() end

--- Returns a table containing the names and values of all custom properties on a CoreObject.
--- 
--- @return table 
function CoreObjectInstance:GetCustomProperties() end

--- Gets data which has been added to an object using the custom property system. Returns the value, which can be an integer, number, boolean, string, Vector2, Vector3, Vector4, Rotation, Color, CoreObjectReference, a MUID string (for Asset References), NetReference, or nil if not found. Second return value is a boolean, true if found and false if not.
--- 
--- @param propertyName string 
--- @return any|boolean 
function CoreObjectInstance:GetCustomProperty(propertyName) end

--- Sets the named custom property if it is marked as replicated and the object it belongs to is server-side networked or in a client/server context. The value must match the existing type of the property, with the exception of CoreObjectReference properties (which accept a CoreObjectReference or a CoreObject) and Asset Reference properties (which accept a string MUID). AssetReferences, CoreObjectReferences, and NetReferences also accept `nil` to clear their value, although `GetCustomProperty()` will still return an unassigned CoreObjectReference or NetReference rather than `nil`. (See the `.isAssigned` property on those types.)
--- 
--- @param propertyName string 
--- @param propertyValue any 
--- @return boolean 
function CoreObjectInstance:SetNetworkedCustomProperty(propertyName, propertyValue) end

--- @param typeName string 
--- @return boolean 
function CoreObjectInstance:IsA(typeName) end

--- @class GlobalCoreObject 
CoreObject = {}

--- @class CoreObjectReference 
--- @field id string 
--- @field isAssigned boolean 
--- @field type string 
local CoreObjectReferenceInstance = {}
--- Returns the CoreObject with a matching ID, if it exists. Will otherwise return nil.
--- 
--- @return CoreObject 
function CoreObjectReferenceInstance:GetObject() end

--- Returns the CoreObject with a matching ID, if it exists. If it does not, yields the current task until the object is spawned. Optional timeout parameter will cause the task to resume with a return value of false and an error message if the object has not been spawned within that many seconds.
--- 
--- @overload fun(): CoreObject
--- @param timeout number 
--- @return CoreObject 
function CoreObjectReferenceInstance:WaitForObject(timeout) end

--- @param typeName string 
--- @return boolean 
function CoreObjectReferenceInstance:IsA(typeName) end

--- @class GlobalCoreObjectReference 
CoreObjectReference = {}

--- @class CorePlayerProfile 
--- @field id string 
--- @field name string 
--- @field description string 
--- @field type string 
local CorePlayerProfileInstance = {}
--- @param typeName string 
--- @return boolean 
function CorePlayerProfileInstance:IsA(typeName) end

--- @class GlobalCorePlayerProfile 
CorePlayerProfile = {}

--- @class CurveKey 
--- @field interpolation CurveInterpolation 
--- @field time number 
--- @field value number 
--- @field arriveTangent number 
--- @field leaveTangent number 
--- @field type string 
local CurveKeyInstance = {}
--- @param typeName string 
--- @return boolean 
function CurveKeyInstance:IsA(typeName) end

--- @class GlobalCurveKey 
CurveKey = {}
--- Constructs a new CurveKey.
--- 
--- @overload fun(time: number,value: number,optionalParameters: table): CurveKey
--- @overload fun(time: number,value: number): CurveKey
--- @overload fun(): CurveKey
--- @param other CurveKey 
--- @return CurveKey 
function CurveKey.New(other) end


--- @class CustomMaterial 
--- @field type string 
local CustomMaterialInstance = {}
--- Sets the given property of the material.
--- 
--- @overload fun(propertyName: string,value: boolean)
--- @overload fun(propertyName: string,value: Vector3)
--- @overload fun(propertyName: string,value: Color)
--- @overload fun(propertyName: string,value: number)
--- @param propertyName string 
--- @param value Vector2 
function CustomMaterialInstance:SetProperty(propertyName, value) end

--- Gets the value of a given property.
--- 
--- @param propertyName string 
--- @return any 
function CustomMaterialInstance:GetProperty(propertyName) end

--- Returns an array of all property names on this CustomMaterial.
--- 
--- @return table<number, string> 
function CustomMaterialInstance:GetPropertyNames() end

--- Returns the asset id of the material this CustomMaterial was based on.
--- 
--- @return string 
function CustomMaterialInstance:GetBaseMaterialId() end

--- @param typeName string 
--- @return boolean 
function CustomMaterialInstance:IsA(typeName) end

--- @class GlobalCustomMaterial 
CustomMaterial = {}
--- Returns a CustomMaterial with the given assetId. This function may yield while loading data.
--- 
--- @param assetId string 
--- @return CustomMaterial 
function CustomMaterial.Find(assetId) end


--- @class Damage 
--- @field amount number 
--- @field reason DamageReason 
--- @field sourceAbility Ability 
--- @field sourcePlayer Player 
--- @field type string 
local DamageInstance = {}
--- Get the HitResult information if this damage was caused by a Projectile impact.
--- 
--- @return HitResult 
function DamageInstance:GetHitResult() end

--- Forward the HitResult information if this damage was caused by a Projectile impact.
--- 
--- @param hitResult HitResult 
function DamageInstance:SetHitResult(hitResult) end

--- @param typeName string 
--- @return boolean 
function DamageInstance:IsA(typeName) end

--- @class GlobalDamage 
Damage = {}
--- Constructs a damage object with the given number, defaults to 0.
--- 
--- @overload fun(): Damage
--- @param amount number 
--- @return Damage 
function Damage.New(amount) end


--- @class DamageableObject : CoreObject 
--- @field damagedEvent Event 
--- @field diedEvent Event 
--- @field hitPoints number 
--- @field maxHitPoints number 
--- @field isDead boolean 
--- @field isImmortal boolean 
--- @field isInvulnerable boolean 
--- @field destroyOnDeath boolean 
--- @field destroyOnDeathDelay number 
--- @field destroyOnDeathClientTemplateId string 
--- @field destroyOnDeathNetworkedTemplateId string 
--- @field type string 
local DamageableObjectInstance = {}
--- Damages the object, unless it is invulnerable. If its hit points reach 0 and it is not immortal, it dies.
--- 
--- @param damage Damage 
function DamageableObjectInstance:ApplyDamage(damage) end

--- Kills the object, unless it is immortal. The optional Damage parameter is a way to communicate cause of death.
--- 
--- @overload fun()
--- @param damage Damage 
function DamageableObjectInstance:Die(damage) end

--- @param typeName string 
--- @return boolean 
function DamageableObjectInstance:IsA(typeName) end

--- @class GlobalDamageableObject : CoreObject 
DamageableObject = {}

--- @class Decal : SmartObject 
--- @field type string 
local DecalInstance = {}
--- @param typeName string 
--- @return boolean 
function DecalInstance:IsA(typeName) end

--- @class GlobalDecal : SmartObject 
Decal = {}

--- @class Equipment : CoreObject 
--- @field equippedEvent Event 
--- @field unequippedEvent Event 
--- @field owner Player 
--- @field socket string 
--- @field type string 
local EquipmentInstance = {}
--- A table of Abilities that are assigned to this Equipment. Players who equip it will get these Abilities.
--- 
--- @return table<number, Ability> 
function EquipmentInstance:GetAbilities() end

--- Attaches the Equipment to a Player. They gain any abilities assigned to the Equipment. If the Equipment is already attached to another Player it will first unequip from that other Player before equipping unto the new one.
--- 
--- @param player Player 
function EquipmentInstance:Equip(player) end

--- Detaches the Equipment from any Player it may currently be attached to. The Player loses any abilities granted by the Equipment.
--- 
function EquipmentInstance:Unequip() end

--- Adds an Ability to the list of abilities on this Equipment.
--- 
--- @param ability Ability 
function EquipmentInstance:AddAbility(ability) end

--- @param typeName string 
--- @return boolean 
function EquipmentInstance:IsA(typeName) end

--- @class GlobalEquipment : CoreObject 
Equipment = {}

--- @class Event 
--- @field type string 
local EventInstance = {}
--- Registers the given function which will be called every time the event is fired. Returns an EventListener which can be used to disconnect from the event or check if the event is still connected. Accepts any number of additional arguments after the listener function, those arguments will be provided after the event's own parameters.
--- 
--- @overload fun(listener: function): EventListener
--- @param listener function 
--- @param additionalParameters any 
--- @return EventListener 
function EventInstance:Connect(listener, additionalParameters) end

--- @param typeName string 
--- @return boolean 
function EventInstance:IsA(typeName) end

--- @class GlobalEvent 
Event = {}

--- @class EventListener 
--- @field isConnected boolean 
--- @field type string 
local EventListenerInstance = {}
--- Disconnects this listener from its event, so it will no longer be called when the event is fired.
--- 
function EventListenerInstance:Disconnect() end

--- @param typeName string 
--- @return boolean 
function EventListenerInstance:IsA(typeName) end

--- @class GlobalEventListener 
EventListener = {}

--- @class Folder : CoreObject 
--- @field type string 
local FolderInstance = {}
--- @param typeName string 
--- @return boolean 
function FolderInstance:IsA(typeName) end

--- @class GlobalFolder : CoreObject 
Folder = {}

--- @class FourWheeledVehicle : Vehicle 
--- @field turnRadius number 
--- @field type string 
local FourWheeledVehicleInstance = {}
--- @param typeName string 
--- @return boolean 
function FourWheeledVehicleInstance:IsA(typeName) end

--- @class GlobalFourWheeledVehicle : Vehicle 
FourWheeledVehicle = {}

--- @class HitResult 
--- @field other Object 
--- @field socketName string 
--- @field type string 
local HitResultInstance = {}
--- The world position where the impact occurred.
--- 
--- @return Vector3 
function HitResultInstance:GetImpactPosition() end

--- Normal direction of the surface which was impacted.
--- 
--- @return Vector3 
function HitResultInstance:GetImpactNormal() end

--- Returns a Transform composed of the position of the impact in world space, the rotation of the normal, and a uniform scale of 1.
--- 
--- @return Transform 
function HitResultInstance:GetTransform() end

--- @param typeName string 
--- @return boolean 
function HitResultInstance:IsA(typeName) end

--- @class GlobalHitResult 
HitResult = {}

--- @class Hook 
--- @field type string 
local HookInstance = {}
--- Registers the given function which will be called every time the hook is fired. Returns a HookListener which can be used to disconnect from the hook or change the listener's priority. Accepts any number of additional arguments after the listener function, those arguments will be provided after the hook's own parameters.
--- 
--- @overload fun(listener: function): HookListener
--- @param listener function 
--- @param additionalParameters any 
--- @return HookListener 
function HookInstance:Connect(listener, additionalParameters) end

--- @param typeName string 
--- @return boolean 
function HookInstance:IsA(typeName) end

--- @class GlobalHook 
Hook = {}

--- @class HookListener 
--- @field isConnected boolean 
--- @field priority number 
--- @field type string 
local HookListenerInstance = {}
--- Disconnects this listener from its hook, so it will no longer be called when the hook is fired.
--- 
function HookListenerInstance:Disconnect() end

--- @param typeName string 
--- @return boolean 
function HookListenerInstance:IsA(typeName) end

--- @class GlobalHookListener 
HookListener = {}

--- @class IKAnchor : CoreObject 
--- @field activatedEvent Event 
--- @field deactivatedEvent Event 
--- @field target string 
--- @field anchorType IKAnchorType 
--- @field blendInTime number 
--- @field blendOutTime number 
--- @field weight number 
--- @field type string 
local IKAnchorInstance = {}
--- Activates the IKAnchor on the given player.
--- 
--- @param target Player 
function IKAnchorInstance:Activate(target) end

--- Deactivates the IKAnchor from whatever player it is active on.
--- 
function IKAnchorInstance:Deactivate() end

--- Returns the aim offset property.
--- 
--- @return Vector3 
function IKAnchorInstance:GetAimOffset() end

--- Sets the aim offset of this IKAnchor.
--- 
--- @param aimOffset Vector3 
function IKAnchorInstance:SetAimOffset(aimOffset) end

--- @param typeName string 
--- @return boolean 
function IKAnchorInstance:IsA(typeName) end

--- @class GlobalIKAnchor : CoreObject 
IKAnchor = {}

--- @class ImpactData 
--- @field targetObject Object 
--- @field projectile Projectile 
--- @field sourceAbility Ability 
--- @field weapon Weapon 
--- @field weaponOwner Player 
--- @field isHeadshot boolean 
--- @field travelDistance number 
--- @field type string 
local ImpactDataInstance = {}
--- Physics information about the impact between the Weapon and the other object.
--- 
--- @return HitResult 
function ImpactDataInstance:GetHitResult() end

--- Table with multiple HitResults that hit the same object, in the case of Weapons with multi-shot (e.g. Shotguns). If a single attack hits multiple targets you receive a separate interaction event for each object hit.
--- 
--- @return table<number, HitResult> 
function ImpactDataInstance:GetHitResults() end

--- @param typeName string 
--- @return boolean 
function ImpactDataInstance:IsA(typeName) end

--- @class GlobalImpactData 
ImpactData = {}

--- @class LeaderboardEntry 
--- @field id string 
--- @field name string 
--- @field score number 
--- @field additionalData string 
--- @field type string 
local LeaderboardEntryInstance = {}
--- @param typeName string 
--- @return boolean 
function LeaderboardEntryInstance:IsA(typeName) end

--- @class GlobalLeaderboardEntry 
LeaderboardEntry = {}

--- @class Light : CoreObject 
--- @field intensity number 
--- @field attenuationRadius number 
--- @field isShadowCaster boolean 
--- @field hasTemperature boolean 
--- @field temperature number 
--- @field team number 
--- @field isTeamColorUsed boolean 
--- @field type string 
local LightInstance = {}
--- The color of the light.
--- 
--- @return Color 
function LightInstance:GetColor() end

--- The color of the light.
--- 
--- @param color Color 
function LightInstance:SetColor(color) end

--- @param typeName string 
--- @return boolean 
function LightInstance:IsA(typeName) end

--- @class GlobalLight : CoreObject 
Light = {}

--- @class MaterialSlot 
--- @field slotName string 
--- @field mesh CoreMesh 
--- @field materialAssetName string 
--- @field materialAssetId string 
--- @field isSmartMaterial boolean 
--- @field type string 
local MaterialSlotInstance = {}
--- Set the U and V tiling values.
--- 
--- @overload fun(u: number,v: number)
--- @param uv Vector2 
function MaterialSlotInstance:SetUVTiling(uv) end

--- Returns a Vector2 of the U and V tiling values.
--- 
--- @return Vector2 
function MaterialSlotInstance:GetUVTiling() end

--- Set the color for this slot.
--- 
--- @param color Color 
function MaterialSlotInstance:SetColor(color) end

--- Returns the color of this slot.
--- 
--- @return Color 
function MaterialSlotInstance:GetColor() end

--- Resets the color of this slot to the original value.
--- 
function MaterialSlotInstance:ResetColor() end

--- Resets the U and V tiling to their original values.
--- 
function MaterialSlotInstance:ResetUVTiling() end

--- Resets whether or not this is used as a smart material.
--- 
function MaterialSlotInstance:ResetIsSmartMaterial() end

--- Resets this to the original material asset.
--- 
function MaterialSlotInstance:ResetMaterialAssetId() end

--- Get the custom material in this material slot. This errors if the slot does not have a custom material.
--- 
--- @return CustomMaterial 
function MaterialSlotInstance:GetCustomMaterial() end

--- @param typeName string 
--- @return boolean 
function MaterialSlotInstance:IsA(typeName) end

--- @class GlobalMaterialSlot 
MaterialSlot = {}

--- @class MergedModel : Folder 
--- @field type string 
local MergedModelInstance = {}
--- @param typeName string 
--- @return boolean 
function MergedModelInstance:IsA(typeName) end

--- @class GlobalMergedModel : Folder 
MergedModel = {}

--- @class NetReference 
--- @field isAssigned boolean 
--- @field referenceType NetReferenceType 
--- @field type string 
local NetReferenceInstance = {}
--- @param typeName string 
--- @return boolean 
function NetReferenceInstance:IsA(typeName) end

--- @class GlobalNetReference 
NetReference = {}

--- @class NetworkContext : CoreObject 
--- @field type string 
local NetworkContextInstance = {}
--- @param typeName string 
--- @return boolean 
function NetworkContextInstance:IsA(typeName) end

--- @class GlobalNetworkContext : CoreObject 
NetworkContext = {}

--- @class Object 
--- @field serverUserData table 
--- @field clientUserData table 
--- @field type string 
local ObjectInstance = {}
--- @param typeName string 
--- @return boolean 
function ObjectInstance:IsA(typeName) end

--- @class GlobalObject 
Object = {}
--- Returns true if object is still a valid Object, or false if it has been destroyed. Also returns false if passed a nil value or something that's not an Object, such as a Vector3 or a string.
--- 
--- @param object any 
--- @return boolean 
function Object.IsValid(object) end


--- @class PartyInfo 
--- @field id string 
--- @field name string 
--- @field partySize number 
--- @field maxPartySize number 
--- @field partyLeaderId string 
--- @field isPlayAsParty boolean 
--- @field isPublic boolean 
--- @field type string 
local PartyInfoInstance = {}
--- Returns an array of the party's tags.
--- 
--- @return table<number, string> 
function PartyInfoInstance:GetTags() end

--- Returns an array of the player IDs of the party's members.
--- 
--- @return table<number, string> 
function PartyInfoInstance:GetMemberIds() end

--- Returns `true` if the party is at maximum capacity.
--- 
--- @return boolean 
function PartyInfoInstance:IsFull() end

--- @param typeName string 
--- @return boolean 
function PartyInfoInstance:IsA(typeName) end

--- @class GlobalPartyInfo 
PartyInfo = {}

--- @class PhysicsObject : CoreObject 
--- @field damagedEvent Event 
--- @field diedEvent Event 
--- @field team number 
--- @field isTeamCollisionEnabled boolean 
--- @field isEnemyCollisionEnabled boolean 
--- @field hitPoints number 
--- @field maxHitPoints number 
--- @field isDead boolean 
--- @field isImmortal boolean 
--- @field isInvulnerable boolean 
--- @field destroyOnDeath boolean 
--- @field destroyOnDeathDelay number 
--- @field destroyOnDeathClientTemplateId string 
--- @field destroyOnDeathNetworkedTemplateId string 
--- @field type string 
local PhysicsObjectInstance = {}
--- Damages the object, unless it is invulnerable. If its hit points reach 0 and it is not immortal, it dies.
--- 
--- @param damage Damage 
function PhysicsObjectInstance:ApplyDamage(damage) end

--- Kills the object, unless it is immortal. The optional Damage parameter is a way to communicate cause of death.
--- 
--- @overload fun()
--- @param damage Damage 
function PhysicsObjectInstance:Die(damage) end

--- @param typeName string 
--- @return boolean 
function PhysicsObjectInstance:IsA(typeName) end

--- @class GlobalPhysicsObject : CoreObject 
PhysicsObject = {}

--- @class Player 
--- @field damagedEvent Event 
--- @field diedEvent Event 
--- @field spawnedEvent Event 
--- @field respawnedEvent Event 
--- @field bindingPressedEvent Event 
--- @field bindingReleasedEvent Event 
--- @field resourceChangedEvent Event 
--- @field movementModeChangedEvent Event 
--- @field animationEvent Event 
--- @field emoteStartedEvent Event 
--- @field emoteStoppedEvent Event 
--- @field perkChangedEvent Event 
--- @field privateNetworkedDataChangedEvent Event 
--- @field id string 
--- @field name string 
--- @field team number 
--- @field isInParty boolean 
--- @field isPartyLeader boolean 
--- @field hitPoints number 
--- @field maxHitPoints number 
--- @field kills number 
--- @field deaths number 
--- @field isSpawned boolean 
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
--- @field brakingDecelerationFlying number 
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
--- @field maxFlySpeed number 
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
--- @field spawnMode SpawnMode 
--- @field respawnMode RespawnMode 
--- @field respawnDelay number 
--- @field respawnTimeRemaining number 
--- @field occupiedVehicle Vehicle 
--- @field currentRotationRate number 
--- @field defaultRotationRate number 
--- @field type string 
local PlayerInstance = {}
--- If the player is in a party, returns a PartyInfo object with data about that party.
--- 
--- @return PartyInfo 
function PlayerInstance:GetPartyInfo() end

--- Returns whether both players are in the same public party.
--- 
--- @param player Player 
--- @return boolean 
function PlayerInstance:IsInPartyWith(player) end

--- The absolute Transform of this player.
--- 
--- @return Transform 
function PlayerInstance:GetWorldTransform() end

--- The absolute Transform of this player.
--- 
--- @param worldTransform Transform 
function PlayerInstance:SetWorldTransform(worldTransform) end

--- The absolute position of this player.
--- 
--- @return Vector3 
function PlayerInstance:GetWorldPosition() end

--- The absolute position of this player.
--- 
--- @param worldPosition Vector3 
function PlayerInstance:SetWorldPosition(worldPosition) end

--- The absolute rotation of this player.
--- 
--- @return Rotation 
function PlayerInstance:GetWorldRotation() end

--- The absolute rotation of this player.
--- 
--- @param worldRotation Rotation 
function PlayerInstance:SetWorldRotation(worldRotation) end

--- The absolute scale of this player.
--- 
--- @return Vector3 
function PlayerInstance:GetWorldScale() end

--- The absolute scale of this player (must be uniform).
--- 
--- @param worldScale Vector3 
function PlayerInstance:SetWorldScale(worldScale) end

--- Gets the current velocity of the Player. The velocity vector indicates the direction, with its magnitude expressed in centimeters per second.
--- 
--- @return Vector3 
function PlayerInstance:GetVelocity() end

--- Array of all Abilities assigned to this Player.
--- 
--- @return table<number, Ability> 
function PlayerInstance:GetAbilities() end

--- Array of all Equipment assigned to this Player.
--- 
--- @return table<number, Equipment> 
function PlayerInstance:GetEquipment() end

--- Returns a table containing CoreObjects attached to this player.
--- 
--- @return table<number, CoreObject> 
function PlayerInstance:GetAttachedObjects() end

--- Returns an array of all IKAnchor objects activated on this player.
--- 
--- @return table<number, IKAnchor> 
function PlayerInstance:GetIKAnchors() end

--- Adds an impulse force to the Player.
--- 
--- @param impulse Vector3 
function PlayerInstance:AddImpulse(impulse) end

--- Sets the Player's velocity to the given amount. The velocity vector indicates the direction, with its magnitude expressed in centimeters per second.
--- 
--- @param velocity Vector3 
function PlayerInstance:SetVelocity(velocity) end

--- Resets the Player's velocity to zero.
--- 
function PlayerInstance:ResetVelocity() end

--- Damages a Player. If their hit points go below 0 they die.
--- 
--- @param damage Damage 
function PlayerInstance:ApplyDamage(damage) end

--- Enables ragdoll for the Player, starting on `socketName` weighted by `weight` (between 0.0 and 1.0). This can cause the Player capsule to detach from the mesh. All parameters are optional; `socketName` defaults to the root and `weight` defaults to 1.0. Multiple bones can have ragdoll enabled simultaneously. See [Socket Names](../api/animations.md#socket-names) for the list of possible values.
--- 
--- @overload fun(socketName: string)
--- @overload fun()
--- @param socketName string 
--- @param weight number 
function PlayerInstance:EnableRagdoll(socketName, weight) end

--- Disables all ragdolls that have been set on the Player.
--- 
function PlayerInstance:DisableRagdoll() end

--- *This function is deprecated. Please use the `.isVisible` property instead.* Shows or hides the Player. The second parameter is optional, defaults to true, and determines if attachments to the Player are hidden as well as the Player.
--- 
--- @overload fun(isVisible: boolean)
--- @param isVisible boolean 
--- @param includeAttachments boolean 
function PlayerInstance:SetVisibility(isVisible, includeAttachments) end

--- Returns whether or not the Player is hidden.
--- 
--- @return boolean 
function PlayerInstance:GetVisibility() end

--- Get position of the Player's camera view.
--- 
--- @return Vector3 
function PlayerInstance:GetViewWorldPosition() end

--- Get rotation of the Player's camera view.
--- 
--- @return Rotation 
function PlayerInstance:GetViewWorldRotation() end

--- Kills the Player. They will ragdoll and ignore further Damage. The optional Damage parameter is a way to communicate cause of death.
--- 
--- @overload fun()
--- @param damage Damage 
function PlayerInstance:Die(damage) end

--- Resurrects a dead player or spawns a despawned player based on respawn settings in the game (default in-place). An optional table may be provided to override the following parameters:
--- 
--- `position (Vector3)`: Respawn at this position. Defaults to the position of the spawn point selected based on the game's respawn settings, or the player's current position if no spawn point was selected.
--- 
--- `rotation (Rotation)`: Sets the player's rotation after respawning. Defaults to the rotation of the selected spawn point, or the player's current rotation if no spawn point was selected.
--- 
--- `scale (Vector3)`: Sets the player's scale after respawning. Defaults to the Player Scale Multiplier of the selected spawn point, or the player's current scale if no spawn point was selected. Player scale must be uniform. (All three components must be equal.)
--- 
--- `spawnKey (string)`: Only spawn points with the given `spawnKey` will be considered. If omitted, only spawn points with a blank `spawnKey` are used.
--- 
--- @overload fun()
--- @param optionalParameters table 
function PlayerInstance:Spawn(optionalParameters) end

--- *This function is deprecated. Please use `Player:Spawn()` instead.* Resurrects a dead Player based on respawn settings in the game (default in-place). An optional table may be provided to override the following parameters:
--- 
--- `position (Vector3)`: Respawn at this position. Defaults to the position of the spawn point selected based on the game's respawn settings, or the player's current position if no spawn point was selected.
--- 
--- `rotation (Rotation)`: Sets the player's rotation after respawning. Defaults to the rotation of the selected spawn point, or the player's current rotation if no spawn point was selected.
--- 
--- `scale (Vector3)`: Sets the player's scale after respawning. Defaults to the Player Scale Multiplier of the selected spawn point, or the player's current scale if no spawn point was selected. Player scale must be uniform. (All three components must be equal.)
--- 
--- `spawnKey (string)`: Only spawn points with the given `spawnKey` will be considered. If omitted, only spawn points with a blank `spawnKey` are used.
--- 
--- @overload fun(optionalParameters: table)
--- @overload fun()
--- @param position Vector3 
--- @param rotation Rotation 
function PlayerInstance:Respawn(position, rotation) end

--- Despawns the player. While despawned, the player is invisible, has no collision, and cannot move. Use the `Spawn()` function to respawn the player.
--- 
function PlayerInstance:Despawn() end

--- Removes all resources from a player.
--- 
function PlayerInstance:ClearResources() end

--- Returns a table containing the names and amounts of the player's resources.
--- 
--- @return table 
function PlayerInstance:GetResources() end

--- Returns the amount of a resource owned by a player. Returns 0 by default.
--- 
--- @param resourceName string 
--- @return number 
function PlayerInstance:GetResource(resourceName) end

--- Sets a specific amount of a resource on a player.
--- 
--- @param resourceName string 
--- @param amount number 
--- @return number 
function PlayerInstance:SetResource(resourceName, amount) end

--- Adds an amount of a resource to a player.
--- 
--- @param resourceName string 
--- @param amount number 
--- @return number 
function PlayerInstance:AddResource(resourceName, amount) end

--- Subtracts an amount of a resource from a player. Does not go below 0.
--- 
--- @param resourceName string 
--- @param amount number 
--- @return number 
function PlayerInstance:RemoveResource(resourceName, amount) end

--- @return table<number, string> 
function PlayerInstance:GetResourceNames() end

--- @param resourceNamePrefix string 
--- @return table<number, string> 
function PlayerInstance:GetResourceNamesStartingWith(resourceNamePrefix) end

--- Does not work in preview mode or in games played locally. Transfers player to the game specified by the passed-in game ID. Example: The game ID for the URL `https://www.coregames.com/games/577d80/core-royale` is `577d80/core-royale`. This function will raise an error if called from a client script on a player other than the local player.
--- 
--- @overload fun(gameInfo: CoreGameInfo)
--- @overload fun(gameId: string)
--- @param gameCollectionEntry CoreGameCollectionEntry 
function PlayerInstance:TransferToGame(gameCollectionEntry) end

--- Does not work in preview mode or in games played locally. Transfers player to the scene specified by the passed-in scene name. The specified scene must be a scene within the same game. This function will raise an error if called from a client script on a player other than the local player. <br/>The following optional parameters are supported:<br/>`spawnKey (string)`: Spawns the player at a spawn point with a matching key. If an invalid key is provided, the player will spawn at the origin, (0, 0, 0).
--- 
--- @overload fun(sceneName: string)
--- @param sceneName string 
--- @param optionalParams table 
function PlayerInstance:TransferToScene(sceneName, optionalParams) end

--- Returns `true` if the player has one or more of the specified perk.
--- 
--- @param perkReference NetReference 
--- @return boolean 
function PlayerInstance:HasPerk(perkReference) end

--- Returns how many of the specified perk the player owns. For non-repeatable perks, returns `1` if the player owns the perk, or `0` if the player does not.
--- 
--- @param perkReference NetReference 
--- @return number 
function PlayerInstance:GetPerkCount(perkReference) end

--- Returns the amount of time remaining (in seconds) until a Limited Time Perk expires. Returns `0` if the player does not own the specified perk, or infinity for a permanent or repeatable perk that the player owns.
--- 
--- @param perkReference NetReference 
--- @return number 
function PlayerInstance:GetPerkTimeRemaining(perkReference) end

--- Adds an amount of Reward Points to a player for completing a certain activity.
--- 
--- @param rewardPoints number 
--- @param activityName string 
function PlayerInstance:GrantRewardPoints(rewardPoints, activityName) end

--- Activates the Player flying mode.
--- 
function PlayerInstance:ActivateFlying() end

--- Activate the Player walking mode.
--- 
function PlayerInstance:ActivateWalking() end

--- Forces a player in or out of mounted state.
--- 
--- @param isMounted boolean 
function PlayerInstance:SetMounted(isMounted) end

--- Returns whichever camera is currently active for the Player.
--- 
--- @return Camera 
function PlayerInstance:GetActiveCamera() end

--- Returns the default Camera object the Player is currently using.
--- 
--- @return Camera 
function PlayerInstance:GetDefaultCamera() end

--- Sets the default Camera object for the Player.
--- 
--- @overload fun(camera: Camera,lerpTime: number)
--- @param camera Camera 
function PlayerInstance:SetDefaultCamera(camera) end

--- Returns the override Camera object the Player is currently using.
--- 
--- @return Camera 
function PlayerInstance:GetOverrideCamera() end

--- Sets the override Camera object for the Player.
--- 
--- @overload fun(camera: Camera,lerpTime: number)
--- @param camera Camera 
function PlayerInstance:SetOverrideCamera(camera) end

--- Clears the override Camera object for the Player (to revert back to the default camera).
--- 
--- @overload fun(lerpTime: number)
function PlayerInstance:ClearOverrideCamera() end

--- Get the rotation for the direction the Player is facing.
--- 
--- @return Rotation 
function PlayerInstance:GetLookWorldRotation() end

--- Set the rotation for the direction the Player is facing.
--- 
--- @param newLookRotation Rotation 
function PlayerInstance:SetLookWorldRotation(newLookRotation) end

--- Returns `true` if the player is currently pressing the named binding. Possible values of the bindings are listed on the [Ability binding](../api/key_bindings.md) page. Note that when called on a client, this function will only work for the local player.
--- 
--- @param bindingName string 
--- @return boolean 
function PlayerInstance:IsBindingPressed(bindingName) end

--- Attaches the Player to the given CoreObject, treating that object as a parent and disabling player movement.
--- 
--- @param object CoreObject 
function PlayerInstance:AttachToCoreObject(object) end

--- If the Player is attached to a parent CoreObject, detaches them and re-enables player movement.
--- 
function PlayerInstance:Detach() end

--- Returns data indicating how a player joined the game (via browsing, portal, social invite, etc) and the game ID of their previous game if they joined directly from another game. Join data should be available during the player's entire session.
--- 
--- @return PlayerTransferData 
function PlayerInstance:GetJoinTransferData() end

--- Returns data indicating how a player left the game (via browsing, portal, social invite, etc) and the game ID of their next game if they are directly joining another game. Leave data is not valid until `Game.playerLeftEvent` has fired for the player.
--- 
--- @return PlayerTransferData 
function PlayerInstance:GetLeaveTransferData() end

--- Sets the private networked data for this player associated with the key. Value can be any type that could be sent with a networked event. Each key is replicated independently, and this data is only sent to the owning player.
--- 
--- @param key string 
--- @param value any 
--- @return PrivateNetworkedDataResultCode 
function PlayerInstance:SetPrivateNetworkedData(key, value) end

--- Returns the private networked data on this player associated with the given key or nil if no data is found.
--- 
--- @param key string 
--- @return any 
function PlayerInstance:GetPrivateNetworkedData(key) end

--- Returns an array of all keys with private data set.
--- 
--- @return table 
function PlayerInstance:GetPrivateNetworkedDataKeys() end

--- @param typeName string 
--- @return boolean 
function PlayerInstance:IsA(typeName) end

--- @class GlobalPlayer 
Player = {}

--- @class PlayerSettings : CoreObject 
--- @field type string 
local PlayerSettingsInstance = {}
--- Apply settings from this settings object to Player.
--- 
--- @param player Player 
function PlayerSettingsInstance:ApplyToPlayer(player) end

--- @param typeName string 
--- @return boolean 
function PlayerSettingsInstance:IsA(typeName) end

--- @class GlobalPlayerSettings : CoreObject 
PlayerSettings = {}

--- @class PlayerStart : CoreObject 
--- @field team number 
--- @field playerScaleMultiplier number 
--- @field spawnTemplateId string 
--- @field key string 
--- @field shouldDecrowdPlayers boolean 
--- @field type string 
local PlayerStartInstance = {}
--- @param typeName string 
--- @return boolean 
function PlayerStartInstance:IsA(typeName) end

--- @class GlobalPlayerStart : CoreObject 
PlayerStart = {}

--- @class PlayerTransferData 
--- @field reason PlayerTransferReason 
--- @field gameId string 
--- @field sceneId string 
--- @field type string 
local PlayerTransferDataInstance = {}
--- @param typeName string 
--- @return boolean 
function PlayerTransferDataInstance:IsA(typeName) end

--- @class GlobalPlayerTransferData 
PlayerTransferData = {}

--- @class PointLight : Light 
--- @field hasNaturalFalloff boolean 
--- @field falloffExponent number 
--- @field sourceRadius number 
--- @field sourceLength number 
--- @field type string 
local PointLightInstance = {}
--- @param typeName string 
--- @return boolean 
function PointLightInstance:IsA(typeName) end

--- @class GlobalPointLight : Light 
PointLight = {}

--- @class Projectile 
--- @field impactEvent Event 
--- @field lifeSpanEndedEvent Event 
--- @field homingFailedEvent Event 
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
local ProjectileInstance = {}
--- Transform data for the Projectile in world space.
--- 
--- @return Transform 
function ProjectileInstance:GetWorldTransform() end

--- Position of the Projectile in world space.
--- 
--- @return Vector3 
function ProjectileInstance:GetWorldPosition() end

--- Position of the Projectile in world space.
--- 
--- @param worldPosition Vector3 
function ProjectileInstance:SetWorldPosition(worldPosition) end

--- Current direction and speed vector of the Projectile. Speed is expressed in centimeters per second.
--- 
--- @return Vector3 
function ProjectileInstance:GetVelocity() end

--- Current direction and speed vector of the Projectile. Speed is expressed in centimeters per second.
--- 
--- @param velocity Vector3 
function ProjectileInstance:SetVelocity(velocity) end

--- Immediately destroys the object.
--- 
function ProjectileInstance:Destroy() end

--- @param typeName string 
--- @return boolean 
function ProjectileInstance:IsA(typeName) end

--- @class GlobalProjectile 
Projectile = {}
--- Spawns a Projectile with a child that is an instance of a template.
--- 
--- @param templateId string 
--- @param startPosition Vector3 
--- @param direction Vector3 
--- @return Projectile 
function Projectile.Spawn(templateId, startPosition, direction) end


--- @class Quaternion 
--- @field x number 
--- @field y number 
--- @field z number 
--- @field w number 
--- @field type string 
local QuaternionInstance = {}
--- Get the Rotation representation of the Quaternion.
--- 
--- @return Rotation 
function QuaternionInstance:GetRotation() end

--- Forward unit vector rotated by the quaternion.
--- 
--- @return Vector3 
function QuaternionInstance:GetForwardVector() end

--- Right unit vector rotated by the quaternion.
--- 
--- @return Vector3 
function QuaternionInstance:GetRightVector() end

--- Up unit vector rotated by the quaternion.
--- 
--- @return Vector3 
function QuaternionInstance:GetUpVector() end

--- @param typeName string 
--- @return boolean 
function QuaternionInstance:IsA(typeName) end

--- @class GlobalQuaternion 
Quaternion = {}
--- Spherical interpolation between two quaternions by the specified progress amount and returns the resultant, normalized Quaternion.
--- 
--- @param from Quaternion 
--- @param to Quaternion 
--- @param progress number 
--- @return Quaternion 
function Quaternion.Slerp(from, to, progress) end

--- Constructs a Quaternion with the given values. Defaults to 0, 0, 0, 1.
--- 
--- @overload fun(fromDirection: Vector3,toDirection: Vector3): Quaternion
--- @overload fun(axis: Vector3,angle: number): Quaternion
--- @overload fun(rotation: Rotation): Quaternion
--- @overload fun(x: number,y: number,z: number,w: number): Quaternion
--- @overload fun(): Quaternion
--- @param quaternion Quaternion 
--- @return Quaternion 
function Quaternion.New(quaternion) end


--- @class RandomStream 
--- @field seed number 
--- @field type string 
local RandomStreamInstance = {}
--- The seed that was used to initialize this stream.
--- 
--- @return number 
function RandomStreamInstance:GetInitialSeed() end

--- Function that sets the seed back to the initial seed.
--- 
function RandomStreamInstance:Reset() end

--- Moves the seed forward to the next seed.
--- 
function RandomStreamInstance:Mutate() end

--- Returns a floating point number between `min` and `max` (inclusive), defaults to `0` and `1` (exclusive).
--- 
--- @overload fun(min: number,max: number): number
--- @return number 
function RandomStreamInstance:GetNumber() end

--- Returns an integer number between `min` and `max` (inclusive).
--- 
--- @param min number 
--- @param max number 
--- @return number 
function RandomStreamInstance:GetInteger(min, max) end

--- Returns a random unit vector.
--- 
--- @return Vector3 
function RandomStreamInstance:GetVector3() end

--- Returns a random unit vector, uniformly distributed, from inside a cone defined by `direction`, `horizontalHalfAngle` and `verticalHalfAngle` (in degrees).
--- 
--- @overload fun(direction: Vector3,coneHalfAngle: number): Vector3
--- @param direction Vector3 
--- @param horizontalHalfAngle number 
--- @param verticalHalfAngle number 
--- @return Vector3 
function RandomStreamInstance:GetVector3FromCone(direction, horizontalHalfAngle, verticalHalfAngle) end

--- @param typeName string 
--- @return boolean 
function RandomStreamInstance:IsA(typeName) end

--- @class GlobalRandomStream 
RandomStream = {}
--- Constructor with specified seed, defaults to a random value.
--- 
--- @overload fun(): RandomStream
--- @param seed number 
--- @return RandomStream 
function RandomStream.New(seed) end


--- @class Rotation 
--- @field x number 
--- @field y number 
--- @field z number 
--- @field type string 
local RotationInstance = {}
--- @param typeName string 
--- @return boolean 
function RotationInstance:IsA(typeName) end

--- @class GlobalRotation 
Rotation = {}
--- Construct a rotation with the given values, defaults to (0, 0, 0).
--- 
--- @overload fun(rotation: Rotation): Rotation
--- @overload fun(quaternion: Quaternion): Rotation
--- @overload fun(x: number,y: number,z: number): Rotation
--- @overload fun(): Rotation
--- @param forwardVector Vector3 
--- @param upVector Vector3 
--- @return Rotation 
function Rotation.New(forwardVector, upVector) end


--- @class Script : CoreObject 
--- @field context table 
--- @field type string 
local ScriptInstance = {}
--- @param typeName string 
--- @return boolean 
function ScriptInstance:IsA(typeName) end

--- @class GlobalScript : CoreObject 
Script = {}

--- @class ScriptAsset 
--- @field name string 
--- @field id string 
--- @field type string 
local ScriptAssetInstance = {}
--- Returns a table containing the names and values of all custom properties on the script asset.
--- 
--- @return table 
function ScriptAssetInstance:GetCustomProperties() end

--- Gets an individual custom property from the script asset. Returns the value, which can be an integer, number, boolean, string, Vector3, Rotator, Color, a MUID string, or nil if not found. Second return value is a boolean, true if found and false if not.
--- 
--- @param propertyName string 
--- @return any|boolean 
function ScriptAssetInstance:GetCustomProperty(propertyName) end

--- @param typeName string 
--- @return boolean 
function ScriptAssetInstance:IsA(typeName) end

--- @class GlobalScriptAsset 
ScriptAsset = {}

--- @class SimpleCurve 
--- @field preExtrapolation CurveExtrapolation 
--- @field postExtrapolation CurveExtrapolation 
--- @field defaultValue number 
--- @field minTime number 
--- @field maxTime number 
--- @field minValue number 
--- @field maxValue number 
--- @field type string 
local SimpleCurveInstance = {}
--- Returns the value of the curve at the specified time.
--- 
--- @param time number 
--- @return number 
function SimpleCurveInstance:GetValue(time) end

--- Returns the slope (derivative) of the curve at the specified time. This may return nil in certain cases where the curve values are not continuous.
--- 
--- @param time number 
--- @return number 
function SimpleCurveInstance:GetSlope(time) end

--- @param typeName string 
--- @return boolean 
function SimpleCurveInstance:IsA(typeName) end

--- @class GlobalSimpleCurve 
SimpleCurve = {}
--- Constructs a SimpleCurve with a set of curve keys. An optional table may be provided to override the following parameters:
--- 
--- `preExtrapolation (CurveExtrapolation)`: Sets the `preExtrapolation` property of the curve. Defaults to `CurveExtrapolation.CYCLE`.
--- 
--- `postExtrapolation (CurveExtrapolation)`: Sets the `postExtrapolation` property of the curve. Defaults to `CurveExtrapolation.CYCLE`.
--- 
--- `defaultValue (number)`: Sets the `defaultValue` property of the curve. Defaults to 0.
--- 
--- @overload fun(keys: table): SimpleCurve
--- @overload fun(other: SimpleCurve): SimpleCurve
--- @param keys table 
--- @param optionalParameters table 
--- @return SimpleCurve 
function SimpleCurve.New(keys, optionalParameters) end


--- @class SmartAudio : SmartObject 
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
local SmartAudioInstance = {}
--- Begins sound playback.
--- 
function SmartAudioInstance:Play() end

--- Stops sound playback.
--- 
function SmartAudioInstance:Stop() end

--- Starts playing and fades in the sound over the given time.
--- 
--- @param time number 
function SmartAudioInstance:FadeIn(time) end

--- Fades the sound out and stops over time seconds.
--- 
--- @param time number 
function SmartAudioInstance:FadeOut(time) end

--- @param typeName string 
--- @return boolean 
function SmartAudioInstance:IsA(typeName) end

--- @class GlobalSmartAudio : SmartObject 
SmartAudio = {}

--- @class SmartObject : CoreObject 
--- @field team number 
--- @field isTeamColorUsed boolean 
--- @field type string 
local SmartObjectInstance = {}
--- Returns a table containing the names and values of all smart properties on a SmartObject.
--- 
--- @return table 
function SmartObjectInstance:GetSmartProperties() end

--- Given a property name, returns the current value of that property on a SmartObject. Returns the value, which can be an integer, number, boolean, string, Vector3, Rotator, Color, or nil if not found. Second return value is a boolean, true if the property was found and false if not.
--- 
--- @param propertyName string 
--- @return any|boolean 
function SmartObjectInstance:GetSmartProperty(propertyName) end

--- Sets the value of an exposed property. Value can be of type number, boolean, string, Vector3, Rotation or Color, but must match the type of the property. Returns true if the property was set successfully and false if not.
--- 
--- @param propertyName string 
--- @param propertyValue any 
--- @return boolean 
function SmartObjectInstance:SetSmartProperty(propertyName, propertyValue) end

--- @param typeName string 
--- @return boolean 
function SmartObjectInstance:IsA(typeName) end

--- @class GlobalSmartObject : CoreObject 
SmartObject = {}

--- @class SpotLight : Light 
--- @field hasNaturalFalloff boolean 
--- @field falloffExponent number 
--- @field sourceRadius number 
--- @field sourceLength number 
--- @field innerConeAngle number 
--- @field outerConeAngle number 
--- @field type string 
local SpotLightInstance = {}
--- @param typeName string 
--- @return boolean 
function SpotLightInstance:IsA(typeName) end

--- @class GlobalSpotLight : Light 
SpotLight = {}

--- @class StaticMesh : CoreMesh 
--- @field isSimulatingDebrisPhysics boolean 
--- @field type string 
local StaticMeshInstance = {}
--- Set the material in the given slot to the material specified by assetId.
--- 
--- @param assetId string 
--- @param slotName string 
function StaticMeshInstance:SetMaterialForSlot(assetId, slotName) end

--- Get the MaterialSlot object for the given slot. If called on the client on a networked object, the resulting object cannot be modified.
--- 
--- @param slotName string 
--- @return MaterialSlot 
function StaticMeshInstance:GetMaterialSlot(slotName) end

--- Get an array of all MaterialSlots on this mesh. If called on the client on a networked object, the resulting object cannot be modified.
--- 
--- @return table<number, MaterialSlot> 
function StaticMeshInstance:GetMaterialSlots() end

--- Resets a material slot to its original state.
--- 
--- @param slotName string 
function StaticMeshInstance:ResetMaterialSlot(slotName) end

--- @param typeName string 
--- @return boolean 
function StaticMeshInstance:IsA(typeName) end

--- @class GlobalStaticMesh : CoreMesh 
StaticMesh = {}

--- @class Task 
--- @field repeatInterval number 
--- @field repeatCount number 
--- @field id number 
--- @field type string 
local TaskInstance = {}
--- Cancels the Task immediately. It will no longer be executed, regardless of the state it was in. If called on the currently executing Task, that Task will halt execution.
--- 
function TaskInstance:Cancel() end

--- Returns the status of the Task. Possible values include: TaskStatus.UNINITIALIZED, TaskStatus.SCHEDULED, TaskStatus.RUNNING, TaskStatus.COMPLETED, TaskStatus.YIELDED, TaskStatus.FAILED, TaskStatus.CANCELED.
--- 
--- @return TaskStatus 
function TaskInstance:GetStatus() end

--- @param typeName string 
--- @return boolean 
function TaskInstance:IsA(typeName) end

--- @class GlobalTask 
Task = {}
--- Creates a new Task which will call taskFunction without blocking the current task. The optional delay parameter specifies how many seconds before the task scheduler should run the Task. By default, the scheduler will run the Task at the end of the current frame.
--- 
--- @overload fun(func: function): Task
--- @param func function 
--- @param delay number 
--- @return Task 
function Task.Spawn(func, delay) end

--- Returns the currently running Task.
--- 
--- @return Task 
function Task.GetCurrent() end

--- Yields the current Task, resuming in delay seconds, or during the next frame if delay is not specified. Returns the amount of time that was actually waited, as well as how long a wait was requested.
--- 
--- @overload fun()
--- @param delay number 
function Task.Wait(delay) end


--- @class Terrain : CoreObject 
--- @field type string 
local TerrainInstance = {}
--- @param typeName string 
--- @return boolean 
function TerrainInstance:IsA(typeName) end

--- @class GlobalTerrain : CoreObject 
Terrain = {}

--- @class Transform 
--- @field type string 
local TransformInstance = {}
--- Returns a copy of the Rotation component of the Transform.
--- 
--- @return Rotation 
function TransformInstance:GetRotation() end

--- Sets the rotation component of the Transform.
--- 
--- @param rotation Rotation 
function TransformInstance:SetRotation(rotation) end

--- Returns a copy of the position component of the Transform.
--- 
--- @return Vector3 
function TransformInstance:GetPosition() end

--- Sets the position component of the Transform.
--- 
--- @param position Vector3 
function TransformInstance:SetPosition(position) end

--- Returns a copy of the scale component of the Transform.
--- 
--- @return Vector3 
function TransformInstance:GetScale() end

--- Sets the scale component of the Transform.
--- 
--- @param scale Vector3 
function TransformInstance:SetScale(scale) end

--- Returns a quaternion-based representation of the Rotation.
--- 
--- @return Quaternion 
function TransformInstance:GetQuaternion() end

--- Sets the quaternion-based representation of the Rotation.
--- 
--- @param quaternion Quaternion 
function TransformInstance:SetQuaternion(quaternion) end

--- Forward vector of the Transform.
--- 
--- @return Vector3 
function TransformInstance:GetForwardVector() end

--- Right vector of the Transform.
--- 
--- @return Vector3 
function TransformInstance:GetRightVector() end

--- Up vector of the Transform.
--- 
--- @return Vector3 
function TransformInstance:GetUpVector() end

--- Inverse of the Transform.
--- 
--- @return Transform 
function TransformInstance:GetInverse() end

--- Applies the Transform to the given position in 3D space.
--- 
--- @param position Vector3 
--- @return Vector3 
function TransformInstance:TransformPosition(position) end

--- Applies the Transform to the given directional Vector3. This will rotate and scale the Vector3, but does not apply the Transform's position.
--- 
--- @param direction Vector3 
--- @return Vector3 
function TransformInstance:TransformDirection(direction) end

--- @param typeName string 
--- @return boolean 
function TransformInstance:IsA(typeName) end

--- @class GlobalTransform 
Transform = {}
--- Constructs a new identity Transform.
--- 
--- @overload fun(xAxis: Vector3,yAxis: Vector3,zAxis: Vector3,position: Vector3): Transform
--- @overload fun(rotation: Rotation,position: Vector3,scale: Vector3): Transform
--- @overload fun(rotation: Quaternion,position: Vector3,scale: Vector3): Transform
--- @overload fun(): Transform
--- @param transform Transform 
--- @return Transform 
function Transform.New(transform) end


--- @class TreadedVehicle : Vehicle 
--- @field turnSpeed number 
--- @field type string 
local TreadedVehicleInstance = {}
--- @param typeName string 
--- @return boolean 
function TreadedVehicleInstance:IsA(typeName) end

--- @class GlobalTreadedVehicle : Vehicle 
TreadedVehicle = {}

--- @class Trigger : CoreObject 
--- @field beginOverlapEvent Event 
--- @field endOverlapEvent Event 
--- @field interactedEvent Event 
--- @field isInteractable boolean 
--- @field interactionLabel string 
--- @field team number 
--- @field isTeamCollisionEnabled boolean 
--- @field isEnemyCollisionEnabled boolean 
--- @field type string 
local TriggerInstance = {}
--- Returns true if given player overlaps with the Trigger.
--- 
--- @param OtherObject Object 
--- @return boolean 
function TriggerInstance:IsOverlapping(OtherObject) end

--- Returns a list of all objects that are currently overlapping with the Trigger.
--- 
--- @return table<number, Object> 
function TriggerInstance:GetOverlappingObjects() end

--- @param typeName string 
--- @return boolean 
function TriggerInstance:IsA(typeName) end

--- @class GlobalTrigger : CoreObject 
Trigger = {}

--- @class UIButton : UIControl 
--- @field clickedEvent Event 
--- @field pressedEvent Event 
--- @field releasedEvent Event 
--- @field hoveredEvent Event 
--- @field unhoveredEvent Event 
--- @field text string 
--- @field fontSize number 
--- @field isInteractable boolean 
--- @field shouldClipToSize boolean 
--- @field shouldScaleToFit boolean 
--- @field type string 
local UIButtonInstance = {}
--- Sets the image to a new MUID. You can get this MUID from an Asset Reference.
--- 
--- @param imageId string 
function UIButtonInstance:SetImage(imageId) end

--- Gets the button's default color.
--- 
--- @return Color 
function UIButtonInstance:GetButtonColor() end

--- Sets the button's default color.
--- 
--- @param color Color 
function UIButtonInstance:SetButtonColor(color) end

--- Gets the button's color when hovered.
--- 
--- @return Color 
function UIButtonInstance:GetHoveredColor() end

--- Sets the button's color when hovered.
--- 
--- @param color Color 
function UIButtonInstance:SetHoveredColor(color) end

--- Gets the button's color when pressed.
--- 
--- @return Color 
function UIButtonInstance:GetPressedColor() end

--- Sets the button's color when pressed.
--- 
--- @param color Color 
function UIButtonInstance:SetPressedColor(color) end

--- Gets the button's color when it's not interactable.
--- 
--- @return Color 
function UIButtonInstance:GetDisabledColor() end

--- Sets the button's color when it's not interactable.
--- 
--- @param color Color 
function UIButtonInstance:SetDisabledColor(color) end

--- Gets the font's color.
--- 
--- @return Color 
function UIButtonInstance:GetFontColor() end

--- Sets the font's color.
--- 
--- @param color Color 
function UIButtonInstance:SetFontColor(color) end

--- Sets the button's text to use the specified font asset.
--- 
--- @param font string 
function UIButtonInstance:SetFont(font) end

--- Returns the color of the button's drop shadow.
--- 
--- @return Color 
function UIButtonInstance:GetShadowColor() end

--- Sets the color of the button's drop shadow.
--- 
--- @param color Color 
function UIButtonInstance:SetShadowColor(color) end

--- Returns the offset of the button's drop shadow in UI space.
--- 
--- @return Vector2 
function UIButtonInstance:GetShadowOffset() end

--- Sets the offset of the button's drop shadow in UI space.
--- 
--- @param vector2 Vector2 
function UIButtonInstance:SetShadowOffset(vector2) end

--- @param typeName string 
--- @return boolean 
function UIButtonInstance:IsA(typeName) end

--- @class GlobalUIButton : UIControl 
UIButton = {}

--- @class UIContainer : UIControl 
--- @field opacity number 
--- @field cylinderArcAngle number 
--- @field type string 
local UIContainerInstance = {}
--- Returns the size of the canvas when drawn in 3D space.
--- 
--- @return Vector2 
function UIContainerInstance:GetCanvasSize() end

--- Sets the size of the canvas when drawn in 3D space.
--- 
--- @param size Vector2 
function UIContainerInstance:SetCanvasSize(size) end

--- @param typeName string 
--- @return boolean 
function UIContainerInstance:IsA(typeName) end

--- @class GlobalUIContainer : UIControl 
UIContainer = {}

--- @class UIControl : CoreObject 
--- @field x number 
--- @field y number 
--- @field width number 
--- @field height number 
--- @field rotationAngle number 
--- @field anchor UIPivot 
--- @field dock UIPivot 
--- @field type string 
local UIControlInstance = {}
--- @param typeName string 
--- @return boolean 
function UIControlInstance:IsA(typeName) end

--- @class GlobalUIControl : CoreObject 
UIControl = {}

--- @class UIImage : UIControl 
--- @field isTeamColorUsed boolean 
--- @field team number 
--- @field shouldClipToSize boolean 
--- @field isFlippedHorizontal boolean 
--- @field isFlippedVertical boolean 
--- @field type string 
local UIImageInstance = {}
--- Returns the current color of the UIImage.
--- 
--- @return Color 
function UIImageInstance:GetColor() end

--- Sets the UIImage to a color.
--- 
--- @param color Color 
function UIImageInstance:SetColor(color) end

--- Sets the UIImage to a new image asset ID. You can get this ID from an Asset Reference.
--- 
--- @overload fun(imageId: string)
--- @param player Player 
function UIImageInstance:SetImage(player) end

--- Downloads and sets a Player's profile picture as the texture for this UIImage control.
--- 
--- @overload fun(playerId: string)
--- @overload fun(friend: CoreFriendCollectionEntry)
--- @overload fun(playerProfile: CorePlayerProfile)
--- @param player Player 
function UIImageInstance:SetPlayerProfile(player) end

--- Downloads and sets a game screenshot as the texture for this UIImage control. The screenshot may come from a different game.
--- 
--- @overload fun(gameId: string)
--- @param gameId string 
--- @param screenshotIndex number 
function UIImageInstance:SetGameScreenshot(gameId, screenshotIndex) end

--- Returns the `imageId` assigned to this UIImage control. **Note:** As of 1.0.211, this function returns `nil` instead of `"0BADBADBADBADBAD"` when no image asset has been set.
--- 
--- @return string 
function UIImageInstance:GetImage() end

--- Returns the color of the image's drop shadow.
--- 
--- @return Color 
function UIImageInstance:GetShadowColor() end

--- Sets the color of the image's drop shadow.
--- 
--- @param color Color 
function UIImageInstance:SetShadowColor(color) end

--- Returns the offset of the image's drop shadow in UI space.
--- 
--- @return Vector2 
function UIImageInstance:GetShadowOffset() end

--- Sets the offset of the image's drop shadow in UI space.
--- 
--- @param vector2 Vector2 
function UIImageInstance:SetShadowOffset(vector2) end

--- Sets the UIImage to display the given camera capture. If the given capture is not valid, it will be ignored. If the capture is released while in use, this UIImage will revert to its default image.
--- 
--- @param cameraCapture CameraCapture 
function UIImageInstance:SetCameraCapture(cameraCapture) end

--- @param typeName string 
--- @return boolean 
function UIImageInstance:IsA(typeName) end

--- @class GlobalUIImage : UIControl 
UIImage = {}

--- @class UIPanel : UIControl 
--- @field shouldClipChildren number 
--- @field opacity number 
--- @field type string 
local UIPanelInstance = {}
--- @param typeName string 
--- @return boolean 
function UIPanelInstance:IsA(typeName) end

--- @class GlobalUIPanel : UIControl 
UIPanel = {}

--- @class UIPerkPurchaseButton : UIControl 
--- @field clickedEvent Event 
--- @field pressedEvent Event 
--- @field releasedEvent Event 
--- @field hoveredEvent Event 
--- @field unhoveredEvent Event 
--- @field isInteractable boolean 
--- @field type string 
local UIPerkPurchaseButtonInstance = {}
--- Configures this button to use the specified perk.
--- 
--- @param perkReference NetReference 
function UIPerkPurchaseButtonInstance:SetPerkReference(perkReference) end

--- Returns a reference to the perk for which this button is currently configured. If no perk has been set, returns an unassigned NetReference. (See the `.isAssigned` property on `NetReference`.)
--- 
--- @return NetReference 
function UIPerkPurchaseButtonInstance:GetPerkReference() end

--- @param typeName string 
--- @return boolean 
function UIPerkPurchaseButtonInstance:IsA(typeName) end

--- @class GlobalUIPerkPurchaseButton : UIControl 
UIPerkPurchaseButton = {}

--- @class UIProgressBar : UIControl 
--- @field progress number 
--- @field fillType ProgressBarFillType 
--- @field fillTileType ImageTileType 
--- @field backgroundTileType ImageTileType 
--- @field type string 
local UIProgressBarInstance = {}
--- Sets the progress bar fill to use the image specified by the given asset ID.
--- 
--- @param imageId string 
function UIProgressBarInstance:SetFillImage(imageId) end

--- Returns the asset ID of the image used for the progress bar fill.
--- 
--- @return string 
function UIProgressBarInstance:GetFillImage() end

--- Sets the progress bar background to use the image specified by the given asset ID.
--- 
--- @param imageId string 
function UIProgressBarInstance:SetBackgroundImage(imageId) end

--- Returns the asset ID of the image used for the progress bar background.
--- 
--- @return string 
function UIProgressBarInstance:GetBackgroundImage() end

--- Returns the color of the fill.
--- 
--- @return Color 
function UIProgressBarInstance:GetFillColor() end

--- Sets the color of the fill.
--- 
--- @param color Color 
function UIProgressBarInstance:SetFillColor(color) end

--- Returns the color of the background.
--- 
--- @return Color 
function UIProgressBarInstance:GetBackgroundColor() end

--- Sets the color of the background.
--- 
--- @param color Color 
function UIProgressBarInstance:SetBackgroundColor(color) end

--- @param typeName string 
--- @return boolean 
function UIProgressBarInstance:IsA(typeName) end

--- @class GlobalUIProgressBar : UIControl 
UIProgressBar = {}

--- @class UIRewardPointsMeter : UIControl 
--- @field type string 
local UIRewardPointsMeterInstance = {}
--- @param typeName string 
--- @return boolean 
function UIRewardPointsMeterInstance:IsA(typeName) end

--- @class GlobalUIRewardPointsMeter : UIControl 
UIRewardPointsMeter = {}

--- @class UIScrollPanel : UIControl 
--- @field orientation Orientation 
--- @field scrollPosition number 
--- @field contentLength number 
--- @field type string 
local UIScrollPanelInstance = {}
--- @param typeName string 
--- @return boolean 
function UIScrollPanelInstance:IsA(typeName) end

--- @class GlobalUIScrollPanel : UIControl 
UIScrollPanel = {}

--- @class UIText : UIControl 
--- @field text string 
--- @field fontSize number 
--- @field outlineSize number 
--- @field justification TextJustify 
--- @field shouldWrapText boolean 
--- @field shouldClipText boolean 
--- @field shouldScaleToFit boolean 
--- @field type string 
local UITextInstance = {}
--- Returns the color of the Text.
--- 
--- @return Color 
function UITextInstance:GetColor() end

--- Sets the color of the Text.
--- 
--- @param color Color 
function UITextInstance:SetColor(color) end

--- Attempts to determine the size of the rendered block of text. This may return `nil` if the size cannot be determined, for example because the underlying widget has not been fully initialized yet.
--- 
--- @return Vector2 
function UITextInstance:ComputeApproximateSize() end

--- Sets the text to use the specified font asset.
--- 
--- @param font string 
function UITextInstance:SetFont(font) end

--- Returns the color of the text's drop shadow.
--- 
--- @return Color 
function UITextInstance:GetShadowColor() end

--- Sets the color of the text's drop shadow.
--- 
--- @param color Color 
function UITextInstance:SetShadowColor(color) end

--- Returns the offset of the text's drop shadow in UI space.
--- 
--- @return Vector2 
function UITextInstance:GetShadowOffset() end

--- Sets the offset of the text's drop shadow in UI space.
--- 
--- @param vector2 Vector2 
function UITextInstance:SetShadowOffset(vector2) end

--- Returns the color of the text's outline.
--- 
--- @return Color 
function UITextInstance:GetOutlineColor() end

--- Sets the color of the text's outline.
--- 
--- @param color Color 
function UITextInstance:SetOutlineColor(color) end

--- @param typeName string 
--- @return boolean 
function UITextInstance:IsA(typeName) end

--- @class GlobalUIText : UIControl 
UIText = {}

--- @class Vector2 
--- @field x number 
--- @field y number 
--- @field size number 
--- @field sizeSquared number 
--- @field type string 
local Vector2Instance = {}
--- Returns a new Vector2 with size 1, but still pointing in the same direction. Returns (0, 0) if the vector is too small to be normalized.
--- 
--- @return Vector2 
function Vector2Instance:GetNormalized() end

--- @param typeName string 
--- @return boolean 
function Vector2Instance:IsA(typeName) end

--- @class GlobalVector2 
Vector2 = {}
--- Linearly interpolates between two vectors by the specified progress amount and returns the resultant Vector2.
--- 
--- @param from Vector2 
--- @param to Vector2 
--- @param progress number 
--- @return Vector2 
function Vector2.Lerp(from, to, progress) end

--- Constructs a Vector2 with the given `x`, `y` values, defaults to (0, 0).
--- 
--- @overload fun(vector: Vector3): Vector2
--- @overload fun(vector: Vector2): Vector2
--- @overload fun(x: number,y: number): Vector2
--- @overload fun(): Vector2
--- @param xy number 
--- @return Vector2 
function Vector2.New(xy) end


--- @class Vector3 
--- @field x number 
--- @field y number 
--- @field z number 
--- @field size number 
--- @field sizeSquared number 
--- @field type string 
local Vector3Instance = {}
--- Returns a new Vector3 with size 1, but still pointing in the same direction. Returns (0, 0, 0) if the vector is too small to be normalized.
--- 
--- @return Vector3 
function Vector3Instance:GetNormalized() end

--- @param typeName string 
--- @return boolean 
function Vector3Instance:IsA(typeName) end

--- @class GlobalVector3 
Vector3 = {}
--- Linearly interpolates between two vectors by the specified progress amount and returns the resultant Vector3.
--- 
--- @param from Vector3 
--- @param to Vector3 
--- @param progress number 
--- @return Vector3 
function Vector3.Lerp(from, to, progress) end

--- Constructs a Vector3 with the given `x`, `y`, `z` values, defaults to (0, 0, 0).
--- 
--- @overload fun(vector: Vector4): Vector3
--- @overload fun(vector: Vector3): Vector3
--- @overload fun(xy: Vector2,z: number): Vector3
--- @overload fun(x: number,y: number,z: number): Vector3
--- @overload fun(): Vector3
--- @param xyz number 
--- @return Vector3 
function Vector3.New(xyz) end


--- @class Vector4 
--- @field x number 
--- @field y number 
--- @field z number 
--- @field w number 
--- @field size number 
--- @field sizeSquared number 
--- @field type string 
local Vector4Instance = {}
--- Returns a new Vector4 with size 1, but still pointing in the same direction. Returns (0, 0, 0, 0) if the vector is too small to be normalized.
--- 
--- @return Vector4 
function Vector4Instance:GetNormalized() end

--- @param typeName string 
--- @return boolean 
function Vector4Instance:IsA(typeName) end

--- @class GlobalVector4 
Vector4 = {}
--- Linearly interpolates between two vectors by the specified progress amount and returns the resultant Vector4.
--- 
--- @param from Vector4 
--- @param to Vector4 
--- @param progress number 
--- @return Vector4 
function Vector4.Lerp(from, to, progress) end

--- Constructs a Vector4 with the given `x`, `y`, `z`, `w` values, defaults to (0, 0, 0, 0).
--- 
--- @overload fun(color: Color): Vector4
--- @overload fun(xyzw: number): Vector4
--- @overload fun(xyz: Vector3,w: number): Vector4
--- @overload fun(vector: Vector4): Vector4
--- @overload fun(x: number,y: number,z: number,w: number): Vector4
--- @overload fun(): Vector4
--- @param xy Vector2 
--- @param zw Vector2 
--- @return Vector4 
function Vector4.New(xy, zw) end


--- @class Vehicle : CoreObject 
--- @field driverEnteredEvent Event 
--- @field driverExitedEvent Event 
--- @field damagedEvent Event 
--- @field diedEvent Event 
--- @field isAccelerating boolean 
--- @field driver Player 
--- @field mass number 
--- @field maxSpeed number 
--- @field accelerationRate number 
--- @field brakeStrength number 
--- @field coastBrakeStrength number 
--- @field tireFriction number 
--- @field gravityScale number 
--- @field isDriverHidden boolean 
--- @field isDriverAttached boolean 
--- @field isBrakeEngaged boolean 
--- @field isHandbrakeEngaged boolean 
--- @field driverAnimationStance string 
--- @field enterTrigger Trigger 
--- @field camera Camera 
--- @field hitPoints number 
--- @field maxHitPoints number 
--- @field isDead boolean 
--- @field isImmortal boolean 
--- @field isInvulnerable boolean 
--- @field destroyOnDeath boolean 
--- @field destroyOnDeathDelay number 
--- @field destroyOnDeathClientTemplateId string 
--- @field destroyOnDeathNetworkedTemplateId string 
--- @field type string 
local VehicleInstance = {}
--- Returns the positional offset for the body collision of the vehicle.
--- 
--- @return Vector3 
function VehicleInstance:GetPhysicsBodyOffset() end

--- Returns the scale offset for the body collision of the vehicle.
--- 
--- @return Vector3 
function VehicleInstance:GetPhysicsBodyScale() end

--- Sets the given player as the new driver of the vehicle. A `nil` value will remove the current driver.
--- 
--- @param driver Player 
function VehicleInstance:SetDriver(driver) end

--- Removes the current driver from the vehicle.
--- 
function VehicleInstance:RemoveDriver() end

--- Adds an impulse force to the vehicle.
--- 
--- @param impulse Vector3 
function VehicleInstance:AddImpulse(impulse) end

--- Returns the position relative to the vehicle at which the driver is attached while occupying the vehicle.
--- 
--- @return Vector3 
function VehicleInstance:GetDriverPosition() end

--- Returns the rotation with which the driver is attached while occupying the vehicle.
--- 
--- @return Rotation 
function VehicleInstance:GetDriverRotation() end

--- Returns the center of mass offset for this vehicle.
--- 
--- @return Vector3 
function VehicleInstance:GetCenterOfMassOffset() end

--- Sets the center of mass offset for this vehicle. This resets the vehicle state and may not behave nicely if called repeatedly or while in motion.
--- 
--- @param offset Vector3 
function VehicleInstance:SetCenterOfMassOffset(offset) end

--- Damages the vehicle, unless it is invulnerable. If its hit points reach 0 and it is not immortal, it dies.
--- 
--- @param damage Damage 
function VehicleInstance:ApplyDamage(damage) end

--- Kills the vehicle, unless it is immortal. The optional Damage parameter is a way to communicate cause of death.
--- 
--- @overload fun()
--- @param damage Damage 
function VehicleInstance:Die(damage) end

--- @param typeName string 
--- @return boolean 
function VehicleInstance:IsA(typeName) end

--- @class GlobalVehicle : CoreObject 
Vehicle = {}

--- @class Vfx : SmartObject 
--- @field type string 
local VfxInstance = {}
--- Starts playing the effect. The `optionalParameters` table may be provided containing:<br/> `includeDescendants (boolean)`: If `true`, also plays any `Vfx` descendants of this instance.
--- 
--- @overload fun()
--- @param optionalParameters table 
function VfxInstance:Play(optionalParameters) end

--- Stops playing the effect. The `optionalParameters` table may be provided containing:<br/> `includeDescendants (boolean)`: If `true`, also stops any `Vfx` descendants of this instance.
--- 
--- @overload fun()
--- @param optionalParameters table 
function VfxInstance:Stop(optionalParameters) end

--- @param typeName string 
--- @return boolean 
function VfxInstance:IsA(typeName) end

--- @class GlobalVfx : SmartObject 
Vfx = {}

--- @class VoiceChatChannel 
--- @field name string 
--- @field channelType VoiceChannelType 
--- @field type string 
local VoiceChatChannelInstance = {}
--- Returns a list of players in this channel.
--- 
--- @return table<number, Player> 
function VoiceChatChannelInstance:GetPlayers() end

--- Returns `true` if the given player is in this channel, otherwise returns `false`.
--- 
--- @param player Player 
--- @return boolean 
function VoiceChatChannelInstance:IsPlayerInChannel(player) end

--- Returns `true` if the given player is muted in this channel, otherwise returns `false`.
--- 
--- @param player Player 
--- @return boolean 
function VoiceChatChannelInstance:IsPlayerMuted(player) end

--- Mutes the given player in this channel.
--- 
--- @param player Player 
function VoiceChatChannelInstance:MutePlayer(player) end

--- Unmutes the given player in this channel.
--- 
--- @param player Player 
function VoiceChatChannelInstance:UnmutePlayer(player) end

--- @param typeName string 
--- @return boolean 
function VoiceChatChannelInstance:IsA(typeName) end

--- @class GlobalVoiceChatChannel 
VoiceChatChannel = {}

--- @class Weapon : Equipment 
--- @field projectileSpawnedEvent Event 
--- @field targetImpactedEvent Event 
--- @field targetInteractionEvent Event 
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
local WeaponInstance = {}
--- Informs whether the Weapon is able to attack or not.
--- 
--- @return boolean 
function WeaponInstance:HasAmmo() end

--- Triggers the main ability of the Weapon. Optional target parameter can be a Vector3 world position, a Player, or a CoreObject.
--- 
--- @overload fun(targetObject: CoreObject)
--- @overload fun(targetWorldPosition: Vector3)
--- @overload fun()
--- @param targetPlayer Player 
function WeaponInstance:Attack(targetPlayer) end

--- @param typeName string 
--- @return boolean 
function WeaponInstance:IsA(typeName) end

--- @class GlobalWeapon : Equipment 
Weapon = {}

--- @class WorldText : CoreObject 
--- @field text string 
--- @field type string 
local WorldTextInstance = {}
--- The color of the Text.
--- 
--- @return Color 
function WorldTextInstance:GetColor() end

--- The color of the Text.
--- 
--- @param color Color 
function WorldTextInstance:SetColor(color) end

--- Sets the text to use the specified font asset.
--- 
--- @param font string 
function WorldTextInstance:SetFont(font) end

--- @param typeName string 
--- @return boolean 
function WorldTextInstance:IsA(typeName) end

--- @class GlobalWorldText : CoreObject 
WorldText = {}






--- @class Chat 
local ChatInstance = {}
--- @class GlobalChat 
Chat = {}
--- Sends a chat message to players. Messages sent from the server have a rate limit of 10 messages per second. Maximum message length is 280 characters. Messages exceeding that length will be cropped.<br />Optional parameters: `players` (Player or Array<Player>): A list of players who should receive the message. Defaults to all players in the game.
--- 
--- @overload fun(message: string): BroadcastMessageResultCode|string
--- @param message string 
--- @param optionalParams table 
--- @return BroadcastMessageResultCode|string 
function Chat.BroadcastMessage(message, optionalParams) end

--- Sends a chat message to the local player. Maximum message length is 280 characters. There is no rate limit for local messages.
--- 
--- @overload fun(message: string)
--- @param message string 
--- @param optionalParams table 
function Chat.LocalMessage(message, optionalParams) end


--- @class CoreDebug 
local CoreDebugInstance = {}
--- @class GlobalCoreDebug 
CoreDebug = {}
--- Draws a debug line. `optionalParameters: duration (number), thickness (number), color (Color)`. 0 or negative duration results in a single frame.
--- 
--- @overload fun(startPosition: Vector3,endPosition: Vector3)
--- @param startPosition Vector3 
--- @param endPosition Vector3 
--- @param parameters table 
function CoreDebug.DrawLine(startPosition, endPosition, parameters) end

--- Draws a debug box, with dimension specified as a vector. `optionalParameters` has same options as `DrawLine()`, with addition of: `rotation (Rotation)` - rotation of the box.
--- 
--- @overload fun(centerPosition: Vector3,scale: Vector3)
--- @param centerPosition Vector3 
--- @param scale Vector3 
--- @param parameters table 
function CoreDebug.DrawBox(centerPosition, scale, parameters) end

--- Draws a debug sphere. `optionalParameters` has the same options as `DrawLine()`.
--- 
--- @overload fun(centerPosition: Vector3,radius: number)
--- @param centerPosition Vector3 
--- @param radius number 
--- @param parameters table 
function CoreDebug.DrawSphere(centerPosition, radius, parameters) end

--- Returns a stack trace listing all actively executing Lua tasks and their method calls. Usually there is only one task actively executing at a time, with others in a yielded state and excluded from this trace. Multiple tasks can be included in the trace if one task triggers an event that has listeners registered, or if a task calls `require()` to load a new script.
--- 
--- @return string 
function CoreDebug.GetStackTrace() end

--- Returns a stack trace listing the Lua method calls currently in progress by the given Task. Defaults to the current Task if `task` is not specified.
--- 
--- @overload fun(task: Task): string
--- @return string 
function CoreDebug.GetTaskStackTrace() end


--- @class CoreMath 
local CoreMathInstance = {}
--- @class GlobalCoreMath 
CoreMath = {}
--- Rounds value to an integer, or to an optional number of decimal places, and returns the rounded value.
--- 
--- @overload fun(x: number): number
--- @param x number 
--- @param decimals number 
--- @return number 
function CoreMath.Round(x, decimals) end

--- Linear interpolation between from and to. t should be a floating point number from 0 to 1, with 0 returning from and 1 returning to.
--- 
--- @overload fun(from: number,to: number): number
--- @param from number 
--- @param to number 
--- @param progress number 
--- @return number 
function CoreMath.Lerp(from, to, progress) end

--- Clamps value between lower and upper, inclusive. If lower and upper are not specified, defaults to 0 and 1.
--- 
--- @overload fun(x: number): number
--- @param x number 
--- @param min number 
--- @param max number 
--- @return number 
function CoreMath.Clamp(x, min, max) end


--- @class CorePlatform 
local CorePlatformInstance = {}
--- @class GlobalCorePlatform 
CorePlatform = {}
--- Requests metadata for a game with the given ID. Accepts full game IDs (eg "67442ee5c0654855b51c4f5fc96ab0fd") as well as the shorter slug version ("67442e/farmers-market"). This function may yield until a result is available, and may raise an error if the game ID is invalid or if an error occurs retrieving the information. Results may be cached for later calls.
--- 
--- @param gameId string 
--- @return CoreGameInfo 
function CorePlatform.GetGameInfo(gameId) end

--- Requests a list of games belonging to a given collection. This function may yield until a result is available, and may raise an error if the collection ID is invalid or if an error occurs retrieving the information. Results may be cached for later calls. Supported collection IDs include: "new", "popular", "hot_games", "active", "featured", "highest_rated", "most_played", "most_engaging", "solo_friendly", and "tournament".
--- 
--- @param collectionId string 
--- @return table<number, CoreGameCollectionEntry> 
function CorePlatform.GetGameCollection(collectionId) end

--- Requests the public account profile for the player with the given ID. This function may yield until a result is available, and may raise an error if the player ID is invalid or if an error occurs retrieving the information. Results may be cached for later calls. When called in preview mode with a bot's player ID, a placeholder profile will be returned.
--- 
--- @param playerId string 
--- @return CorePlayerProfile 
function CorePlatform.GetPlayerProfile(playerId) end


--- @class CoreSocial 
local CoreSocialInstance = {}
--- @class GlobalCoreSocial 
CoreSocial = {}
--- Returns `true` if the specified player is friends with the local player.
--- 
--- @overload fun(player: Player): boolean
--- @param playerId string 
--- @return boolean 
function CoreSocial.IsFriendsWithLocalPlayer(playerId) end

--- Requests a list of the given Player's friends. This function may yield until a result is available, and may raise an error if an error occurs retrieving the information. Results may be cached for later calls. A partial list of friends may be returned, depending on how many friends the player has. See `CoreFriendCollection` for information on retrieving more results. If a player has no friends, or when called in multiplayer preview mode for a bot player, an empty `CoreFriendCollection` will be returned.
--- 
--- @param player Player 
--- @return CoreFriendCollection 
function CoreSocial.GetFriends(player) end


--- @class CoreString 
local CoreStringInstance = {}
--- @class GlobalCoreString 
CoreString = {}
--- Splits the string `s` into substrings separated by `delimiter`.<br/>Optional parameters in the `parameters` table include:<br/>`removeEmptyResults (boolean)`: If `true`, empty strings will be removed from the results. Defaults to `false`.<br/>`maxResults (integer)`: Limits the number of strings that will be returned. The last result will be any remaining unsplit portion of `s`.<br/>`delimiters (string or Array<string>)`:Allows splitting on multiple delimiters. If both this and the `delimiter` parameter are specified, the combined list is used. If neither is specified, default is to split on any whitespace characters.<br/>Note that this function does not return a table, it returns multiple strings. For example: `local myHello, myCore = CoreString.Split("Hello Core!")` If a table is desired, wrap the call to `Split()` in curly braces, eg: `local myTable = {CoreString.Split("Hello Core!")}`
--- 
--- @overload fun(string: string): any
--- @overload fun(string: string,optionalParameters: table): any
--- @overload fun(string: string,delimiter: string): any
--- @param string string 
--- @return any 
function CoreString.Split(string) end

--- Concatenates the given values together, separated by `delimiter`. If a given value is not a string, it is converted to one using `tostring()`.
--- 
--- @overload fun(delimiter: string): string
--- @param delimiter string 
--- @param strings any 
--- @return string 
function CoreString.Join(delimiter, strings) end

--- Trims whitespace from the start and end of `s`, returning the result. An optional list of strings may be provided to trim those strings from `s` instead of the default whitespace. For example, `CoreString.Trim("(==((Hello!))==)", "(==(", ")==)")` returns "(Hello!)".
--- 
--- @overload fun(string: string): string
--- @param string string 
--- @param trimmedStrings any 
--- @return string 
function CoreString.Trim(string, trimmedStrings) end


--- @class Environment 
local EnvironmentInstance = {}
--- @class GlobalEnvironment 
Environment = {}
--- Returns `true` if the script is running in a client environment. This includes scripts that are in a Client Context, as well as scripts in a Static Context on a multiplayer preview client or a client playing a hosted game. Note that single-player preview and the "Play Locally" option only execute Static Context scripts once, and that is in a server environment.
--- 
--- @return boolean 
function Environment.IsClient() end

--- Returns `true` if the script is running in a server environment. Note that this can include scripts running in the editor in preview mode (where the editor acts as server for the game) or for the "Play Locally" option in the Main Menu. This will always return `false` for scripts in a Client Context.
--- 
--- @return boolean 
function Environment.IsServer() end

--- Returns `true` if running in multiplayer preview mode.
--- 
--- @return boolean 
function Environment.IsMultiplayerPreview() end

--- Returns `true` if running in single-player preview mode.
--- 
--- @return boolean 
function Environment.IsSinglePlayerPreview() end

--- Returns `true` if running in preview mode.
--- 
--- @return boolean 
function Environment.IsPreview() end

--- Returns `true` if running in a local game on the player's computer. This includes preview mode, as well as the "Play Locally" option in the Main Menu.
--- 
--- @return boolean 
function Environment.IsLocalGame() end

--- Returns `true` if running in a published online game, for both clients and servers.
--- 
--- @return boolean 
function Environment.IsHostedGame() end


--- @class Events 
local EventsInstance = {}
--- @class GlobalEvents 
Events = {}
--- Registers the given function to the event name which will be called every time the event is fired using Broadcast. Returns an EventListener which can be used to disconnect from the event or check if the event is still connected. Accepts any number of additional arguments after the listener function, those arguments will be provided after the event's own parameters.
--- 
--- @overload fun(eventName: string,listener: function): EventListener
--- @param eventName string 
--- @param listener function 
--- @param additionalParameters any 
--- @return EventListener 
function Events.Connect(eventName, listener, additionalParameters) end

--- Registers the given function to the event name which will be called every time the event is fired using BroadcastToServer. The first parameter the function receives will be the Player that fired the event. Returns an EventListener which can be used to disconnect from the event or check if the event is still connected. Accepts any number of additional arguments after the listener function, those arguments will be provided after the event's own parameters.
--- 
--- @overload fun(eventName: string,listener: function): EventListener
--- @param eventName string 
--- @param listener function 
--- @param additionalParameters any 
--- @return EventListener 
function Events.ConnectForPlayer(eventName, listener, additionalParameters) end

--- Broadcasts the given event and fires all listeners attached to the given event name if any exists. Parameters after event name specifies the arguments passed to the listener. Any number of arguments can be passed to the listener function. The events are not networked and can fire events defined in the same context.
--- 
--- @overload fun(eventName: string)
--- @param eventName string 
--- @param argumentList any 
function Events.Broadcast(eventName, argumentList) end

--- Broadcasts the given event to the server over the network and fires all listeners attached to the given event name if any exists on the server. The parameters after event name specify the arguments passed to the listener on the server. The function returns a result code and a message. This is a networked event.
--- 
--- @overload fun(eventName: string): BroadcastEventResultCode|string
--- @param eventName string 
--- @param argumentList any 
--- @return BroadcastEventResultCode|string 
function Events.BroadcastToServer(eventName, argumentList) end

--- Broadcasts the given event to all clients over the network and fires all listeners attached to the given event name if any exists. Parameters after event name specify the arguments passed to the listener on the client. The function returns a result code and a message. This is a networked event.
--- 
--- @overload fun(eventName: string): BroadcastEventResultCode|string
--- @param eventName string 
--- @param argumentList any 
--- @return BroadcastEventResultCode|string 
function Events.BroadcastToAllPlayers(eventName, argumentList) end

--- Broadcasts the given event to a specific client over the network and fires all listeners attached to the given event name if any exists on that client. The first parameter specifies the Player to which the event will be sent. The parameters after event name specify the arguments passed to the listener on the client. The function returns a result code and a message. This is a networked event.
--- 
--- @overload fun(player: Player,eventName: string): BroadcastEventResultCode|string
--- @param player Player 
--- @param eventName string 
--- @param argumentList any 
--- @return BroadcastEventResultCode|string 
function Events.BroadcastToPlayer(player, eventName, argumentList) end


--- @class Game 
local GameInstance = {}
--- @class GlobalGame 
--- @field playerJoinedEvent Event 
--- @field playerLeftEvent Event 
--- @field abilitySpawnedEvent Event 
--- @field roundStartEvent Event 
--- @field roundEndEvent Event 
--- @field teamScoreChangedEvent Event 
Game = {}
--- Returns the local player.
--- 
--- @return Player 
function Game.GetLocalPlayer() end

--- Returns the Player with the given player ID, if they're currently in the game. Otherwise returns `nil`.
--- 
--- @param playerId string 
--- @return Player 
function Game.FindPlayer(playerId) end

--- Returns a table containing the players currently in the game. An optional table may be provided containing parameters to filter the list of players returned: ignoreDead(boolean), ignoreLiving(boolean), ignoreSpawned(boolean), ignoreDespawned(boolean), ignoreTeams(integer or table of integer), includeTeams(integer or table of integer), ignorePlayers(Player or table of Player), E.g.: `Game.GetPlayers({ignoreDead = true, ignorePlayers = Game.GetLocalPlayer()})`.
--- 
--- @overload fun(): table<number, Player>
--- @param optionalParams table 
--- @return table<number, Player> 
function Game.GetPlayers(optionalParams) end

--- Returns a table with all Players that are in the given area. Position's `z` is ignored with the cylindrical area always upright. An optional table may be provided containing parameters to filter the list of players considered. This supports the same list of parameters as GetPlayers().
--- 
--- @overload fun(worldPosition: Vector3,radius: number): table<number, Player>
--- @param worldPosition Vector3 
--- @param radius number 
--- @param optionalParams table 
--- @return table<number, Player> 
function Game.FindPlayersInCylinder(worldPosition, radius, optionalParams) end

--- Returns a table with all Players that are in the given spherical area. An optional table may be provided containing parameters to filter the list of players considered. This supports the same list of parameters as GetPlayers().
--- 
--- @overload fun(worldPosition: Vector3,radius: number): table<number, Player>
--- @param worldPosition Vector3 
--- @param radius number 
--- @param optionalParams table 
--- @return table<number, Player> 
function Game.FindPlayersInSphere(worldPosition, radius, optionalParams) end

--- Returns the Player that is nearest to the given position. An optional table may be provided containing parameters to filter the list of players considered. This supports the same list of parameters as GetPlayers().
--- 
--- @overload fun(worldPosition: Vector3): Player
--- @param worldPosition Vector3 
--- @param optionalParameters table 
--- @return Player 
function Game.FindNearestPlayer(worldPosition, optionalParameters) end

--- Fire all events attached to roundStartEvent.
--- 
function Game.StartRound() end

--- Fire all events attached to roundEndEvent.
--- 
function Game.EndRound() end

--- Returns the current score for the specified team. Only teams 0 - 4 are valid.
--- 
--- @param team number 
--- @return number 
function Game.GetTeamScore(team) end

--- Sets one team's score.
--- 
--- @param team number 
--- @param score number 
function Game.SetTeamScore(team, score) end

--- Increases one team's score.
--- 
--- @param team number 
--- @param scoreChange number 
function Game.IncreaseTeamScore(team, scoreChange) end

--- Decreases one team's score.
--- 
--- @param team number 
--- @param scoreChange number 
function Game.DecreaseTeamScore(team, scoreChange) end

--- Sets all teams' scores to 0.
--- 
function Game.ResetTeamScores() end

--- Locks the current server instance to stop accepting new players. Note that players already in the process of joining the server will still be accepted, and `Game.playerJoinedEvent` may still fire for a short period of time after a call to this function returns. Other new players will be directed to a different instance of the game.
--- 
function Game.StopAcceptingPlayers() end

--- Returns `true` if the current server instance is still accepting new players. Returns `false` if the server has stopped accepting new players due to a call to `Game.StopAcceptingPlayers()`.
--- 
--- @return boolean 
function Game.IsAcceptingPlayers() end

--- Similar to `Player:TransferToGame()`, transfers all players to the game specified by the passed in game ID. Does not work in preview mode or in games played locally.
--- 
--- @overload fun(gameInfo: CoreGameInfo)
--- @overload fun(gameId: string)
--- @param gameCollectionEntry CoreGameCollectionEntry 
function Game.TransferAllPlayersToGame(gameCollectionEntry) end

--- Similar to `Player:TransferToScene()`, transfers all players to the scene specified by the passed in scene name. Does not work in preview mode or in games played locally. <br/>The following optional parameters are supported:<br/>`spawnKey (string)`: Spawns the players at a spawn point with a matching key. If an invalid key is provided, the players will spawn at the origin, (0, 0, 0).
--- 
--- @overload fun(sceneName: string)
--- @param sceneName string 
--- @param optionalParams table 
function Game.TransferAllPlayersToScene(sceneName, optionalParams) end

--- Returns the name of the current scene.
--- 
--- @return string 
function Game.GetCurrentSceneName() end


--- @class Input 
local InputInstance = {}
--- @class GlobalInput 
Input = {}

--- @class Leaderboards 
local LeaderboardsInstance = {}
--- @class GlobalLeaderboards 
Leaderboards = {}
--- Submits a new score for the given Player on the specified leaderboard. The `NetReference` parameter should be retrieved from a custom property, assigned from the Global Leaderboards tab in the editor. This score may be ignored if the player already has a better score on this leaderboard. The optional `additionalData` parameter may be used to store a very small amount of data with the player's entry. If provided, this string must be 8 characters or fewer. (More specifically, 8 bytes when encoded as UTF-8.)
--- 
--- @param leaderboardReference NetReference 
--- @param player Player 
--- @param score number 
--- @param additionalData string 
function Leaderboards.SubmitPlayerScore(leaderboardReference, player, score, additionalData) end

--- Returns a table containing a list of entries for the specified leaderboard. The `NetReference` parameter should be retrieved from a custom property, assigned from the Global Leaderboards tab in the editor. This returns a copy of the data that has already been retrieved, so calling this function does not incur any additional network cost. If the requested leaderboard type has not been enabled for this leaderboard, an empty table will be returned. Supported leaderboard types include:<br/>`LeaderboardType.GLOBAL`<br/>`LeaderboardType.DAILY`<br/>`LeaderboardType.WEEKLY`<br/>`LeaderboardType.MONTHLY`
--- 
--- @param leaderboardReference NetReference 
--- @param leaderboardType LeaderboardType 
--- @return table 
function Leaderboards.GetLeaderboard(leaderboardReference, leaderboardType) end

--- Returns `true` if any leaderboard data is available. Returns `false` if leaderboards are still being retrieved, or if there is no leaderboard data.
--- 
--- @return boolean 
function Leaderboards.HasLeaderboards() end


--- @class Storage 
local StorageInstance = {}
--- @class GlobalStorage 
Storage = {}
--- Computes and returns the size required for the given `data` table when stored as Player data.
--- 
--- @param data table 
--- @return number 
function Storage.SizeOfData(data) end

--- Returns the player data associated with `player`. This returns a copy of the data that has already been retrieved for the player, so calling this function does not incur any additional network cost. Changes to the data in the returned table will not be persisted without calling `Storage.SetPlayerData()`.
--- 
--- @param player Player 
--- @return table 
function Storage.GetPlayerData(player) end

--- Updates the data associated with `player`. Returns a result code and an error message. See below for supported data types.
--- 
--- @param player Player 
--- @param data table 
--- @return StorageResultCode|string 
function Storage.SetPlayerData(player, data) end

--- Returns the shared player data associated with `player` and `sharedStorageKey`. This returns a copy of the data that has already been retrieved for the player, so calling this function does not incur any additional network cost. Changes to the data in the returned table will not be persisted without calling `Storage.SetSharedPlayerData()`.
--- 
--- @param sharedStorageKey NetReference 
--- @param player Player 
--- @return table 
function Storage.GetSharedPlayerData(sharedStorageKey, player) end

--- Updates the shared data associated with `player` and `sharedStorageKey`. Returns a result code and an error message. See below for supported data types.
--- 
--- @param sharedStorageKey NetReference 
--- @param player Player 
--- @param data table 
--- @return StorageResultCode|string 
function Storage.SetSharedPlayerData(sharedStorageKey, player, data) end

--- Requests the player data associated with the specified player who is not in the current instance of the game. This function may yield until data is available, and may raise an error if the player ID is invalid or if an error occurs retrieving the information. If the player is in the current instance of the game, `Storage.GetPlayerData()` should be used instead.
--- 
--- @param playerId string 
--- @return table 
function Storage.GetOfflinePlayerData(playerId) end

--- Requests the shared player data associated with `sharedStorageKey` and the specified player who is not in the current instance of the game. This function may yield until data is available, and may raise an error if the player ID is invalid or if an error occurs retrieving the information. If the player is in the current instance of the game, `Storage.GetSharedPlayerData()` should be used instead.
--- 
--- @param sharedStorageKey NetReference 
--- @param playerId string 
--- @return table 
function Storage.GetSharedOfflinePlayerData(sharedStorageKey, playerId) end


--- @class Teams 
local TeamsInstance = {}
--- @class GlobalTeams 
Teams = {}
--- Returns true if teams are considered friendly under the current TeamMode. If either team is TEAM_NEUTRAL=0, returns true.
--- 
--- @param team1 number 
--- @param team2 number 
--- @return boolean 
function Teams.AreTeamsFriendly(team1, team2) end

--- Returns true if teams are considered enemies under the current TeamMode. If either team is TEAM_NEUTRAL=0, returns false.
--- 
--- @param team1 number 
--- @param team2 number 
--- @return boolean 
function Teams.AreTeamsEnemies(team1, team2) end


--- @class UI 
local UIInstance = {}
--- @class GlobalUI 
--- @field coreModalChangedEvent Event 
UI = {}
--- Returns the currently active core modal, or nil if none is active.
--- 
--- @return CoreModalType 
function UI.GetCoreModalType() end

--- Shows a quick text on screen that tracks its position relative to a world position. The last parameter is an optional table containing additional parameters: duration (number) - How long the text should remain on the screen. Default duration is 0.5 seconds; color (Color) - The color of the Text. Default is white; font (string) - Asset ID for the font to use; isBig (boolean) - When true, larger text is used.
--- 
--- @overload fun(text: string,worldPosition: Vector3)
--- @param text string 
--- @param worldPosition Vector3 
--- @param optionalParameters table 
function UI.ShowFlyUpText(text, worldPosition, optionalParameters) end

--- Local player sees an arrow pointing towards some damage source. Lasts for 5 seconds.
--- 
--- @overload fun(sourcePlayer: Player)
--- @overload fun(sourceWorldPosition: Vector3)
--- @param sourceObject CoreObject 
function UI.ShowDamageDirection(sourceObject) end

--- Calculates the location that worldPosition appears on the screen. Returns a Vector2 with the `x`, `y` coordinates, or `nil` if worldPosition is behind the camera. Only gives results from a client context.
--- 
--- @param worldPosition Vector3 
--- @return Vector2 
function UI.GetScreenPosition(worldPosition) end

--- Returns a Vector2 with the size of the Player's screen in the `x`, `y` coordinates. Only gives results from a client context. May return `nil` if the screen size cannot be determined.
--- 
--- @return Vector2 
function UI.GetScreenSize() end

--- Draws a message on the corner of the screen. Second optional Color parameter can change the color from the default white.
--- 
--- @overload fun(message: string)
--- @param message string 
--- @param color Color 
function UI.PrintToScreen(message, color) end

--- Returns a Vector2 with the `x`, `y` coordinates of the mouse cursor on the screen. Only gives results from a client context. May return `nil` if the cursor position cannot be determined.
--- 
--- @return Vector2 
function UI.GetCursorPosition() end

--- Return hit result from local client's view in direction of the Projected cursor position. Meant for client-side use only, for Ability cast, please use `ability:GetTargetData():GetHitPosition()`, which would contain cursor hit position at time of cast, when in top-down camera mode.
--- 
--- @return HitResult 
function UI.GetCursorHitResult() end

--- Return intersection from local client's camera direction to given plane, specified by point on plane and optionally its normal. Meant for client-side use only. Example usage: `local hitPos = UI.GetCursorPlaneIntersection(Vector3.New(0, 0, 0))`.
--- 
--- @overload fun(pointOnPlane: Vector3): Vector3
--- @param pointOnPlane Vector3 
--- @param planeNormal Vector3 
--- @return Vector3 
function UI.GetCursorPlaneIntersection(pointOnPlane, planeNormal) end

--- Returns whether the cursor is visible.
--- 
--- @return boolean 
function UI.IsCursorVisible() end

--- Sets whether the cursor is visible.
--- 
--- @param isVisible boolean 
function UI.SetCursorVisible(isVisible) end

--- Returns whether to lock cursor in viewport.
--- 
--- @return boolean 
function UI.IsCursorLockedToViewport() end

--- Sets whether to lock cursor in viewport.
--- 
--- @param isLocked boolean 
function UI.SetCursorLockedToViewport(isLocked) end

--- Returns whether the cursor can interact with UI elements like buttons.
--- 
--- @return boolean 
function UI.CanCursorInteractWithUI() end

--- Sets whether the cursor can interact with UI elements like buttons.
--- 
--- @param canInteract boolean 
function UI.SetCanCursorInteractWithUI(canInteract) end

--- Check if reticle is visible.
--- 
--- @return boolean 
function UI.IsReticleVisible() end

--- Shows or hides the reticle for the Player.
--- 
--- @param isVisible boolean 
function UI.SetReticleVisible(isVisible) end

--- Sets whether the rewards dialog is visible, and optionally which tab is active.
--- 
--- @overload fun(isVisible: boolean)
--- @param isVisible boolean 
--- @param currentTab RewardsDialogTab 
function UI.SetRewardsDialogVisible(isVisible, currentTab) end

--- Returns whether the rewards dialog is currently visible.
--- 
--- @return boolean 
function UI.IsRewardsDialogVisible() end

--- Sets whether the social menu is enabled.
--- 
--- @param isEnabled boolean 
function UI.SetSocialMenuEnabled(isEnabled) end

--- Returns whether the social menu is enabled.
--- 
--- @return boolean 
function UI.IsSocialMenuEnabled() end


--- @class VoiceChat 
local VoiceChatInstance = {}
--- @class GlobalVoiceChat 
VoiceChat = {}
--- Returns the current voice chat mode.
--- 
--- @return VoiceChatMode 
function VoiceChat.GetVoiceChatMode() end

--- Enables or disables voice chat in the current game.
--- 
--- @param voiceChatMode VoiceChatMode 
function VoiceChat.SetVoiceChatMode(voiceChatMode) end

--- Returns the channel with the given name, or `nil` if no such channel exists.
--- 
--- @param channelName string 
--- @return VoiceChatChannel 
function VoiceChat.GetChannel(channelName) end

--- Returns a list of voice chat channels.
--- 
--- @return table<number, VoiceChatChannel> 
function VoiceChat.GetChannels() end

--- Returns a list of voice chat channels that the given player is in.
--- 
--- @param player Player 
--- @return table<number, VoiceChatChannel> 
function VoiceChat.GetChannelsForPlayer(player) end

--- Returns `true` if the given player is in the specified channel, otherwise returns `false`.
--- 
--- @param player Player 
--- @param channelName string 
--- @return boolean 
function VoiceChat.IsPlayerInChannel(player, channelName) end

--- Mutes the given player in the specified channel.
--- 
--- @param player Player 
--- @param channelName string 
function VoiceChat.MutePlayerInChannel(player, channelName) end

--- Unmutes the given player in the specified channel.
--- 
--- @param player Player 
--- @param channelName string 
function VoiceChat.UnmutePlayerInChannel(player, channelName) end

--- Returns `true` if the given player is muted in the specified channel, otherwise returns `false`.
--- 
--- @param player Player 
--- @param channelName string 
--- @return boolean 
function VoiceChat.IsPlayerMutedInChannel(player, channelName) end

--- Returns true if the given player is currently speaking in the game channel.
--- 
--- @param player Player 
--- @return boolean 
function VoiceChat.IsPlayerSpeaking(player) end

--- Returns a value from 0.0 to 1.0 to indicate how loudly the given player is speaking.
--- 
--- @param player Player 
--- @return number 
function VoiceChat.GetPlayerSpeakingVolume(player) end


--- @class World 
local WorldInstance = {}
--- @class GlobalWorld 
World = {}
--- Returns the root of the CoreObject hierarchy.
--- 
--- @return CoreObject 
function World.GetRootObject() end

--- Returns the object with a given MUID. Returns nil if no object has this ID.
--- 
--- @param id string 
--- @return CoreObject 
function World.FindObjectById(id) end

--- Returns the first object found with a matching name. In none match, nil is returned.
--- 
--- @param name string 
--- @return CoreObject 
function World.FindObjectByName(name) end

--- Returns a table containing all the objects in the hierarchy with a matching name. If none match, an empty table is returned.
--- 
--- @param name string 
--- @return table<number, CoreObject> 
function World.FindObjectsByName(name) end

--- Returns a table containing all the objects in the hierarchy whose type is or extends the specified type. If none match, an empty table is returned.
--- 
--- @param typeName string 
--- @return table<number, CoreObject> 
function World.FindObjectsByType(typeName) end

--- Spawns an instance of an asset into the world. Optional parameters can specify a parent for the spawned object. Supported parameters include: parent (CoreObject) <br /> If provided, the spawned asset will be a child of this parent, and any Transform parameters are relative to the parent's Transform; `position (Vector3)`: Position of the spawned object; `rotation (Rotation or Quaternion)`: Rotation of the spawned object; `scale (Vector3)`: Scale of the spawned object.
--- 
--- @overload fun(assetId: string): CoreObject
--- @param assetId string 
--- @param optionalParameters table 
--- @return CoreObject 
function World.SpawnAsset(assetId, optionalParameters) end

--- Traces a ray from `startPosition` to `endPosition`, returning a `HitResult` with data about the impact point and object. Returns `nil` if no intersection is found. Note that if a raycast starts inside an object, that object will not be returned by the raycast. <br /> Optional parameters can be provided to control the results of the Raycast:<br/>`ignoreTeams (integer or Array<integer>)`: Don't return any players belonging to the team or teams listed. <br/>`ignorePlayers (Player, Array<Player>, or boolean)`: Ignore any of the players listed. If `true`, ignore all players. <br/>`checkObjects (Object, Array<Object>)`: Only return results that are contained in this list. <br/>`ignoreObjects (Object, Array<Object>)`: Ignore results that are contained in this list. <br/>`shouldDebugRender (boolean)`: If `true`, enables visualization of the raycast in world space for debugging. <br/>`debugRenderDuration (number)`: Number of seconds for which debug rendering should remain on screen. Defaults to 1 second. <br/>`debugRenderThickness (number)`: The thickness of lines drawn for debug rendering. Defaults to 1. <br/>`debugRenderColor (Color)`: Overrides the color of lines drawn for debug rendering. If not specified, multiple colors may be used to indicate where results were hit.
--- 
--- @overload fun(startPosition: Vector3,endPosition: Vector3): HitResult
--- @param startPosition Vector3 
--- @param endPosition Vector3 
--- @param optionalParameters table 
--- @return HitResult 
function World.Raycast(startPosition, endPosition, optionalParameters) end

--- Traces a ray from `startPosition` to `endPosition`, returning a list of `HitResult` instances with data about all objects found along the ray. Returns an empty table if no intersection is found. Note that if a raycast starts inside an object, that object will not be returned by the raycast. Optional parameters can be provided to control the results of the raycast using the same parameters supported by `World.Raycast()`.
--- 
--- @overload fun(startPosition: Vector3,endPosition: Vector3): table<number, HitResult>
--- @param startPosition Vector3 
--- @param endPosition Vector3 
--- @param optionalParameters table 
--- @return table<number, HitResult> 
function World.RaycastAll(startPosition, endPosition, optionalParameters) end

--- Traces a sphere with the specified radius from `startPosition` to `endPosition`, returning a `HitResult` with data about the first object hit along the way. Returns `nil` if no intersection is found. Note that a sphere cast starting entirely inside an object with complex collision may not return that object. Optional parameters can be provided to control the results of the sphere cast using the same parameters supported by `World.Raycast()`.
--- 
--- @overload fun(startPosition: Vector3,endPosition: Vector3,radius: number): HitResult
--- @param startPosition Vector3 
--- @param endPosition Vector3 
--- @param radius number 
--- @param optionalParameters table 
--- @return HitResult 
function World.Spherecast(startPosition, endPosition, radius, optionalParameters) end

--- Traces a sphere with the specified radius from `startPosition` to `endPosition`, returning a list of `HitResult` instances with data about all objects found along the path of the sphere. Returns an empty table if no intersection is found. Note that a sphere cast starting entirely inside an object with complex collision may not return that object. Optional parameters can be provided to control the results of the sphere cast using the same parameters supported by `World.Raycast()`.
--- 
--- @overload fun(startPosition: Vector3,endPosition: Vector3,radius: number): table<number, HitResult>
--- @param startPosition Vector3 
--- @param endPosition Vector3 
--- @param radius number 
--- @param optionalParameters table 
--- @return table<number, HitResult> 
function World.SpherecastAll(startPosition, endPosition, radius, optionalParameters) end

--- Traces a box with the specified size from `startPosition` to `endPosition`, returning a `HitResult` with data about the first object hit along the way. Returns `nil` if no intersection is found. Note that a box cast starting entirely inside an object with complex collision may not return that object. Optional parameters can be provided to control the results of the box cast using the same parameters supported by `World.Raycast()`, as well as the following additional parameters: <br/>`shapeRotation (Rotation)`: Rotation of the box shape being cast. Defaults to (0, 0, 0). <br/>`isWorldShapeRotation (boolean)`: If `true`, the `shapeRotation` parameter specifies a rotation in world space, or if no `shapeRotation` is provided, the box will be axis-aligned. Defaults to `false`, meaning the rotation of the box is relative to the direction in which it is being cast.
--- 
--- @overload fun(startPosition: Vector3,endPosition: Vector3,boxSize: Vector3): HitResult
--- @param startPosition Vector3 
--- @param endPosition Vector3 
--- @param boxSize Vector3 
--- @param optionalParameters table 
--- @return HitResult 
function World.Boxcast(startPosition, endPosition, boxSize, optionalParameters) end

--- Traces a box with the specified size from `startPosition` to `endPosition`, returning a list of `HitResult` instances with data about all objects found along the path of the box. Returns an empty table if no intersection is found. Note that a box cast starting entirely inside an object with complex collision may not return that object. Optional parameters can be provided to control the results of the box cast using the same parameters supported by `World.Raycast()` and `World.Boxcast()`.
--- 
--- @overload fun(startPosition: Vector3,endPosition: Vector3,boxSize: Vector3): table<number, HitResult>
--- @param startPosition Vector3 
--- @param endPosition Vector3 
--- @param boxSize Vector3 
--- @param optionalParameters table 
--- @return table<number, HitResult> 
function World.BoxcastAll(startPosition, endPosition, boxSize, optionalParameters) end

--- Returns all objects found overlapping or within a sphere with the specified position and radius. Optional parameters can be provided to control the results of the search:<br/>`ignoreTeams (integer or Array<integer>)`: Don't return any players belonging to the team or teams listed. <br/>`ignorePlayers (Player, Array<Player>, or boolean)`: Ignore any of the players listed. If `true`, ignore all players. <br/>`checkObjects (Object, Array<Object>)`: Only return results that are contained in this list. <br/>`ignoreObjects (Object, Array<Object>)`: Ignore results that are contained in this list.
--- 
--- @overload fun(position: Vector3,radius: number): table<number, Object>
--- @param position Vector3 
--- @param radius number 
--- @param optionalParameters table 
--- @return table<number, Object> 
function World.FindObjectsOverlappingSphere(position, radius, optionalParameters) end

--- Returns all objects found overlapping or within a box with the specified position and size. Optional parameters can be provided to control the results of the search using the same parameters as `World.FindObjectsOverlappingSphere()`, as well as the following:<br/>`shapeRotation (Rotation)`: Rotation of the box shape being checked. Defaults to (0, 0, 0).
--- 
--- @overload fun(position: Vector3,boxSize: Vector3): table<number, Object>
--- @param position Vector3 
--- @param boxSize Vector3 
--- @param optionalParameters table 
--- @return table<number, Object> 
function World.FindObjectsOverlappingBox(position, boxSize, optionalParameters) end







--- @alias AbilityFacingMode 0 | 1 | 2
AbilityFacingMode = {
    NONE = 0,
    MOVEMENT = 1,
    AIM = 2,
}
--- @alias AbilityPhase 0 | 1 | 2 | 3 | 4
AbilityPhase = {
    READY = 0,
    CAST = 1,
    EXECUTE = 2,
    RECOVERY = 3,
    COOLDOWN = 4,
}
--- @alias BroadcastEventResultCode 0 | 1 | 2 | 3 | 4
BroadcastEventResultCode = {
    SUCCESS = 0,
    FAILURE = 1,
    EXCEEDED_SIZE_LIMIT = 2,
    EXCEEDED_RATE_WARNING_LIMIT = 3,
    EXCEEDED_RATE_LIMIT = 4,
}
--- @alias BroadcastMessageResultCode 0 | 1 | 2 | 3 | 4
BroadcastMessageResultCode = {
    SUCCESS = 0,
    FAILURE = 1,
    EXCEEDED_SIZE_LIMIT = 2,
    EXCEEDED_RATE_WARNING_LIMIT = 3,
    EXCEEDED_RATE_LIMIT = 4,
}
--- @alias CameraCaptureResolution 0 | 1 | 2 | 3 | 4
CameraCaptureResolution = {
    VERY_SMALL = 0,
    SMALL = 1,
    MEDIUM = 2,
    LARGE = 3,
    VERY_LARGE = 4,
}
--- @alias Collision 0 | 1 | 2
Collision = {
    INHERIT = 0,
    FORCE_ON = 1,
    FORCE_OFF = 2,
}
--- @alias CoreModalType 1 | 2 | 3 | 4 | 6
CoreModalType = {
    PAUSE_MENU = 1,
    CHARACTER_PICKER = 2,
    MOUNT_PICKER = 3,
    EMOTE_PICKER = 4,
    SOCIAL_MENU = 6,
}
--- @alias CurveExtrapolation 0 | 1 | 2 | 3 | 4
CurveExtrapolation = {
    CYCLE = 0,
    CYCLE_WITH_OFFSET = 1,
    OSCILLATE = 2,
    LINEAR = 3,
    CONSTANT = 4,
}
--- @alias CurveInterpolation 0 | 1 | 2
CurveInterpolation = {
    LINEAR = 0,
    CONSTANT = 1,
    CUBIC = 2,
}
--- @alias DamageReason 0 | 1 | 2 | 3 | 4
DamageReason = {
    UNKNOWN = 0,
    COMBAT = 1,
    FRIENDLY_FIRE = 2,
    MAP = 3,
    NPC = 4,
}
--- @alias FacingMode 0 | 1 | 2
FacingMode = {
    FACE_AIM_WHEN_ACTIVE = 0,
    FACE_AIM_ALWAYS = 1,
    FACE_MOVEMENT = 2,
}
--- @alias IKAnchorType 0 | 1 | 2 | 3 | 4
IKAnchorType = {
    LEFT_HAND = 0,
    RIGHT_HAND = 1,
    PELVIS = 2,
    LEFT_FOOT = 3,
    RIGHT_FOOT = 4,
}
--- @alias ImageTileType 0 | 1 | 2 | 3
ImageTileType = {
    NONE = 0,
    HORIZONTAL = 1,
    VERTICAL = 2,
    BOTH = 3,
}
--- @alias LeaderboardType 0 | 1 | 2 | 3
LeaderboardType = {
    GLOBAL = 0,
    DAILY = 1,
    WEEKLY = 2,
    MONTHLY = 3,
}
--- @alias LookControlMode 0 | 1 | 2
LookControlMode = {
    NONE = 0,
    RELATIVE = 1,
    LOOK_AT_CURSOR = 2,
}
--- @alias MovementControlMode 0 | 1 | 2 | 3 | 4
MovementControlMode = {
    NONE = 0,
    LOOK_RELATIVE = 1,
    VIEW_RELATIVE = 2,
    FACING_RELATIVE = 3,
    FIXED_AXES = 4,
}
--- @alias MovementMode 0 | 1 | 3 | 4 | 5 | 6
MovementMode = {
    NONE = 0,
    WALKING = 1,
    FALLING = 3,
    SWIMMING = 4,
    FLYING = 5,
    SLIDING = 6,
}
--- @alias NetReferenceType 1 | 2 | 3 | 0
NetReferenceType = {
    LEADERBOARD = 1,
    SHARED_STORAGE = 2,
    CREATOR_PERK = 3,
    UNKNOWN = 0,
}
--- @alias Orientation 0 | 1
Orientation = {
    HORIZONTAL = 0,
    VERTICAL = 1,
}
--- @alias PlayerTransferReason 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9
PlayerTransferReason = {
    UNKNOWN = 0,
    CHARACTER = 1,
    CREATE = 2,
    SHOP = 3,
    BROWSE = 4,
    SOCIAL = 5,
    PORTAL = 6,
    AFK = 7,
    EXIT = 8,
    PORTAL_SCENE = 9,
}
--- @alias PrivateNetworkedDataResultCode 0 | 1 | 2
PrivateNetworkedDataResultCode = {
    SUCCESS = 0,
    FAILURE = 1,
    EXCEEDED_SIZE_LIMIT = 2,
}
--- @alias ProgressBarFillType 0 | 1 | 3 | 4 | 2
ProgressBarFillType = {
    LEFT_TO_RIGHT = 0,
    RIGHT_TO_LEFT = 1,
    TOP_TO_BOTTOM = 3,
    BOTTOM_TO_TOP = 4,
    FROM_CENTER = 2,
}
--- @alias RespawnMode 0 | 1 | 2 | 3 | 4 | 5 | 6
RespawnMode = {
    NONE = 0,
    IN_PLACE = 1,
    ROUND_ROBIN = 2,
    AT_CLOSEST_SPAWN_POINT = 3,
    FARTHEST_FROM_OTHER_PLAYERS = 4,
    FARTHEST_FROM_ENEMY = 5,
    RANDOM = 6,
}
--- @alias RewardsDialogTab 1 | 2
RewardsDialogTab = {
    QUESTS = 1,
    GAMES = 2,
}
--- @alias RotationMode 0 | 1 | 2
RotationMode = {
    CAMERA = 0,
    NONE = 1,
    LOOK_ANGLE = 2,
}
--- @alias SpawnMode 0 | 1 | 2 | 3
SpawnMode = {
    RANDOM = 0,
    ROUND_ROBIN = 1,
    FARTHEST_FROM_OTHER_PLAYERS = 2,
    FARTHEST_FROM_ENEMY = 3,
}
--- @alias StorageResultCode 0 | 2 | 1 | 3
StorageResultCode = {
    SUCCESS = 0,
    FAILURE = 2,
    STORAGE_DISABLED = 1,
    EXCEEDED_SIZE_LIMIT = 3,
}
--- @alias TaskStatus 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7
TaskStatus = {
    UNINITIALIZED = 0,
    SCHEDULED = 1,
    RUNNING = 2,
    COMPLETED = 3,
    YIELDED = 4,
    FAILED = 5,
    CANCELED = 6,
    BLOCKED = 7,
}
--- @alias TextJustify 0 | 1 | 2
TextJustify = {
    LEFT = 0,
    CENTER = 1,
    RIGHT = 2,
}
--- @alias UIPivot 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9
UIPivot = {
    TOP_LEFT = 0,
    TOP_CENTER = 1,
    TOP_RIGHT = 2,
    MIDDLE_LEFT = 3,
    MIDDLE_CENTER = 4,
    MIDDLE_RIGHT = 5,
    BOTTOM_LEFT = 6,
    BOTTOM_CENTER = 7,
    BOTTOM_RIGHT = 8,
    CUSTOM = 9,
}
--- @alias Visibility 0 | 1 | 2
Visibility = {
    INHERIT = 0,
    FORCE_ON = 1,
    FORCE_OFF = 2,
}
--- @alias VoiceChannelType 0 | 1
VoiceChannelType = {
    NORMAL = 0,
    POSITIONAL = 1,
}
--- @alias VoiceChatMode 0 | 1 | 2
VoiceChatMode = {
    NONE = 0,
    TEAM = 1,
    ALL = 2,
}
--- @type CoreObject
script = nil