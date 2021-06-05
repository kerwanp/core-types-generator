--- @class AIActivity
--- @field public name string This activity's name.
--- @field public owner AIActivityHandler The AIActivityHandler that owns this activity. May be `nil` if this activity has been removed from its owner.
--- @field public priority number The current priority of this activity. Expected to be greater than 0, and expected to be adjusted by the `tick` function provided when adding the activity to its handler, though this can be set at any time.
--- @field public isDebugModeEnabled boolean True if this activity has debugging enabled in the AI Debugger. Useful for deciding whether to log additional information about specific activities.
--- @field public isHighestPriority boolean True if this activity is the activity with the highest priority among its owner's list of activities. Note that this value does not update immediately when setting an activity's priority, but will be updated by the handler each tick when the handler evaluates its list of activities.
--- @field public elapsedTime number If this activity is the highest priority for its handler, returns the length of time for which it has been highest priority. Otherwise returns the length of time since it was last highest priority, or since it was added to the handler.
--- @field public type string 
--- @field IsA fun(self, typeName: string ): boolean

--- @class AIActivityHandler
--- @field public isSelectedInDebugger boolean True if this activity handler is currently selected in the AI Debugger.
--- @field public type string 
--- @field AddActivity fun(self, name: string , functions: table ): AIActivity
--- @field RemoveActivity fun(self, name: string )
--- @field ClearActivities fun(self)
--- @field GetActivities fun(self): table<number, AIActivity>
--- @field FindActivity fun(self, name: string ): AIActivity
--- @field IsA fun(self, typeName: string ): boolean

--- @class Ability
--- @field public actionBinding string Which action binding will cause the Ability to activate. Possible values of the bindings are listed on the [Ability binding](../api/key_bindings.md) page.
--- @field public canActivateWhileDead boolean Indicates if the Ability can be used while the owning Player is dead. False by default.
--- @field public animation string Name of the animation the Player will play when the Ability is activated. Possible values: See [Ability Animation](../api/animations.md) for strings and other info.
--- @field public canBePrevented boolean Used in conjunction with the phase property `preventsOtherAbilities` so multiple abilities on the same Player can block each other during specific phases. True by default.
--- @field public castPhaseSettings AbilityPhaseSettings Config data for the Cast phase (see below).
--- @field public executePhaseSettings AbilityPhaseSettings Config data for the Execute phase.
--- @field public recoveryPhaseSettings AbilityPhaseSettings Config data for the Recovery phase.
--- @field public cooldownPhaseSettings AbilityPhaseSettings Config data for the Cooldown phase.
--- @field public isEnabled boolean Turns an Ability on/off. It stays on the Player but is interrupted if `isEnabled` is set to `false` during an active Ability. True by default.
--- @field public owner Object Assigning an owner applies the Ability to that Player.
--- @field public type string 
--- @field GetTargetData fun(self): AbilityTarget
--- @field SetTargetData fun(self, target: AbilityTarget )
--- @field GetCurrentPhase fun(self): AbilityPhase
--- @field GetPhaseTimeRemaining fun(self): number
--- @field Interrupt fun(self)
--- @field Activate fun(self)
--- @field AdvancePhase fun(self)
--- @field IsA fun(self, typeName: string ): boolean

--- @class AbilityPhaseSettings
--- @field public duration number Length in seconds of the phase. After this time the Ability moves to the next phase. Can be zero. Default values per phase: 0.15, 0, 0.5 and 3.
--- @field public canMove boolean Is the Player allowed to move during this phase. True by default.
--- @field public canJump boolean Is the Player allowed to jump during this phase. False by default in Cast & Execute, default True in Recovery & Cooldown.
--- @field public canRotate boolean Is the Player allowed to rotate during this phase. True by default.
--- @field public preventsOtherAbilities boolean When true this phase prevents the Player from casting another Ability, unless that other Ability has canBePrevented set to False. True by default in Cast & Execute, false in Recovery & Cooldown.
--- @field public isTargetDataUpdated boolean If `true`, there will be updated target information at the start of the phase. Otherwise, target information may be out of date.
--- @field public facingMode AbilityFacingMode How and if this Ability rotates the Player during execution. Cast and Execute default to "Aim", other phases default to "None". Options are: AbilityFacingMode.NONE, AbilityFacingMode.MOVEMENT, AbilityFacingMode.AIM
--- @field public type string 
--- @field IsA fun(self, typeName: string ): boolean

--- @class AbilityTarget
--- @field public hitPlayer Player Convenience property that is the same as hitObject, but only if hitObject is a Player.
--- @field public hitObject Object Object under the reticle, or center of the screen if no reticle is displayed. Can be a Player, StaticMesh, etc.
--- @field public spreadHalfAngle number Half-angle of cone of possible target space, in degrees.
--- @field public spreadRandomSeed number Seed that can be used with RandomStream for deterministic RNG.
--- @field public type string 
--- @field GetOwnerMovementRotation fun(self): Rotation
--- @field SetOwnerMovementRotation fun(self, rotation: Rotation )
--- @field GetAimPosition fun(self): Vector3
--- @field SetAimPosition fun(self, worldPosition: Vector3 )
--- @field GetAimDirection fun(self): Vector3
--- @field SetAimDirection fun(self, direction: Vector3 )
--- @field GetHitPosition fun(self): Vector3
--- @field SetHitPosition fun(self, worldPosition: Vector3 )
--- @field GetHitResult fun(self): HitResult
--- @field SetHitResult fun(self, hitResult: HitResult )
--- @field IsA fun(self, typeName: string ): boolean

--- @class AnimatedMesh
--- @field public animationStance string The stance the animated mesh plays.
--- @field public animationStancePlaybackRate number The playback rate for the animation stance being played. Negative values will play the animation in reverse.
--- @field public animationStanceShouldLoop boolean If `true`, the animation stance will keep playing in a loop. If `false` the animation will stop playing once completed.
--- @field public playbackRateMultiplier number Rate multiplier for all animations played on the animated mesh. Setting this to `0` will stop all animations on the mesh.
--- @field public type string 
--- @field GetAnimationNames fun(self): table<number, string>
--- @field GetAnimationStanceNames fun(self): table<number, string>
--- @field GetSocketNames fun(self): table<number, string>
--- @field GetAnimationEventNames fun(self, animationName: string ): table<number, string>
--- @field AttachCoreObject fun(self, objectToAttach: CoreObject , socket: string )
--- @field PlayAnimation fun(self, animationName: string , optionalParameters: table )
--- @field StopAnimations fun(self)
--- @field GetAnimationDuration fun(self, animationName: string ): number
--- @field SetMeshForSlot fun(self, slotIndex: number , assetId: string )
--- @field GetMeshForSlot fun(self, slotIndex: number ): string
--- @field IsA fun(self, typeName: string ): boolean

--- @class AreaLight
--- @field public sourceWidth number The width of the plane from which light is emitted. Must be greater than 0.
--- @field public sourceHeight number The height of the plane from which light is emitted. Must be greater than 0.
--- @field public barnDoorAngle number The angle of the barn doors, in degrees. Valid values are in the range from 0 to 90. Has no effect if `barnDoorLength` is 0.
--- @field public barnDoorLength number The length of the barn doors. Must be non-negative.
--- @field public type string 
--- @field IsA fun(self, typeName: string ): boolean

--- @class Audio
--- @field public isSpatializationEnabled boolean Default true. Set to false to play sound without 3D positioning.
--- @field public isAttenuationEnabled boolean Default true, meaning sounds will fade with distance.
--- @field public isOcclusionEnabled boolean Default true. Changes attenuation if there is geometry between the player and the audio source.
--- @field public isAutoPlayEnabled boolean Default false. If set to true when placed in the editor (or included in a template), the sound will be automatically played when loaded.
--- @field public isTransient boolean Default false. If set to true, the sound will automatically destroy itself after it finishes playing.
--- @field public isAutoRepeatEnabled boolean Loops when playback has finished. Some sounds are designed to automatically loop, this flag will force others that don't. Useful for looping music.
--- @field public pitch number Default 1. Multiplies the playback pitch of a sound. Note that some sounds have clamped pitch ranges (0.2 to 1).
--- @field public volume number Default 1. Multiplies the playback volume of a sound. Note that values above 1 can distort sound, so if you're trying to balance sounds, experiment to see if scaling down works better than scaling up.
--- @field public radius number Default 0. If non-zero, will override default 3D spatial parameters of the sound. Radius is the distance away from the sound position that will be played at 100% volume.
--- @field public falloff number Default 0. If non-zero, will override default 3D spatial parameters of the sound. Falloff is the distance outside the radius over which the sound volume will gradually fall to zero.
--- @field public isPlaying boolean Returns if the sound is currently playing.
--- @field public length number Returns the length (in seconds) of the Sound.
--- @field public currentPlaybackTime number Returns the playback position (in seconds) of the sound.
--- @field public fadeInTime number Sets the fade in time for the audio. When the audio is played, it will start at zero volume, and fade in over this many seconds.
--- @field public fadeOutTime number Sets the fadeout time of the audio. When the audio is stopped, it will keep playing for this many seconds, as it fades out.
--- @field public startTime number The start time of the audio track. Default is 0. Setting this to anything else means that the audio will skip ahead that many seconds when played.
--- @field public stopTime number The stop time of the audio track. Default is 0. A positive value means that the audio will stop that many seconds from the start of the track, including any fade out time.
--- @field public type string 
--- @field Play fun(self)
--- @field Stop fun(self)
--- @field FadeIn fun(self, time: number )
--- @field FadeOut fun(self, time: number )
--- @field IsA fun(self, typeName: string ): boolean

--- @class Camera
--- @field public followPlayer Player Which Player's view the camera should follow. Set to the local Player for a first or third person camera. Set to nil to detach.
--- @field public isOrthographic boolean Whether the camera uses an isometric (orthographic) view or perspective.
--- @field public fieldOfView number The field of view when using perspective view. Clamped between 1.0 and 170.0.
--- @field public viewWidth number The width of the view with an isometric view. Has a minimum value of 1.0.
--- @field public useCameraSocket boolean If you have a followPlayer, then use their camera socket. This is often preferable for first-person cameras, and gives a bit of view bob.
--- @field public currentDistance number The distance controlled by the Player with scroll wheel (by default).
--- @field public isDistanceAdjustable boolean Whether the Player can control their camera distance (with the mouse wheel by default). Creators can still access distance through currentDistance below, even if this value is false.
--- @field public minDistance number The minimum distance the Player can zoom in to.
--- @field public maxDistance number The maximum distance the Player can zoom out to.
--- @field public rotationMode RotationMode Which base rotation to use. Values: `RotationMode.CAMERA`, `RotationMode.NONE`, `RotationMode.LOOK_ANGLE`.
--- @field public hasFreeControl boolean Whether the Player can freely control their rotation (with mouse or thumbstick). Requires movement mode `RotationMode.CAMERA`. This has no effect if the camera is following a player.
--- @field public currentPitch number The current pitch of the Player's free control.
--- @field public minPitch number The minimum pitch for free control.
--- @field public maxPitch number The maximum pitch for free control.
--- @field public isYawLimited boolean Whether the Player's yaw has limits. If so, `maxYaw` must be at least `minYaw`, and should be outside the range `[0, 360]` if needed.
--- @field public currentYaw number The current yaw of the Player's free control.
--- @field public minYaw number The minimum yaw for free control.
--- @field public maxYaw number The maximum yaw for free control.
--- @field public lerpTime number 
--- @field public isUsingCameraRotation boolean 
--- @field public type string 
--- @field GetPositionOffset fun(self): Vector3
--- @field SetPositionOffset fun(self, positionOffset: Vector3 )
--- @field GetRotationOffset fun(self): Rotation
--- @field SetRotationOffset fun(self, rotationOffset: Rotation )
--- @field IsA fun(self, typeName: string ): boolean

--- @class Color
--- @field public r number The Red component of the Color.
--- @field public g number The Green component of the Color.
--- @field public b number The Blue component of the Color.
--- @field public a number The Alpha (transparency) component of the Color.
--- @field public type string 
--- @field GetDesaturated fun(self, desaturation: number ): Color
--- @field ToStandardHex fun(self): string
--- @field ToLinearHex fun(self): string
--- @field IsA fun(self, typeName: string ): boolean

--- @class CoreFriendCollection
--- @field public hasMoreResults boolean Returns `true` if there are more friends available to be requested.
--- @field public type string 
--- @field GetResults fun(self): table<number, CoreFriendCollectionEntry>
--- @field GetMoreResults fun(self): CoreFriendCollection
--- @field IsA fun(self, typeName: string ): boolean

--- @class CoreFriendCollectionEntry
--- @field public id string The ID of the friend.
--- @field public name string The name of the friend.
--- @field public type string 
--- @field IsA fun(self, typeName: string ): boolean

--- @class CoreGameCollectionEntry
--- @field public id string The ID of the game.
--- @field public parentGameId string The ID of this game's parent game if there is one, or else `nil`.
--- @field public name string The name of the game.
--- @field public ownerId string The player ID of the creator who published the game.
--- @field public ownerName string The player name of the creator who published the game.
--- @field public type string 
--- @field IsA fun(self, typeName: string ): boolean

--- @class CoreGameInfo
--- @field public id string The ID of the game.
--- @field public parentGameId string The ID of this game's parent game if there is one, or else `nil`.
--- @field public name string The name of the game.
--- @field public description string The description of the game.
--- @field public ownerId string The player ID of the creator who published the game.
--- @field public ownerName string The player name of the creator who published the game.
--- @field public isQueueEnabled boolean `true` if the game was published with queueing enabled.
--- @field public screenshotCount number The number of screenshots published with the game.
--- @field public hasWorldCapture boolean `true` if the game was published with a captured view of the world for use with portals.
--- @field public type string 
--- @field GetTags fun(self): table<number, string>
--- @field IsA fun(self, typeName: string ): boolean

--- @class CoreMesh
--- @field public meshAssetId string The ID of the mesh asset used by this mesh.
--- @field public team number Assigns the mesh to a team. Value range from `0` to `4`. `0` is neutral team.
--- @field public isTeamColorUsed boolean If `true`, and the mesh has been assigned to a valid team, players on that team will see a blue mesh, while other players will see red. Requires a material that supports the color property.
--- @field public isTeamCollisionEnabled boolean If `false`, and the mesh has been assigned to a valid team, players on that team will not collide with the mesh.
--- @field public isEnemyCollisionEnabled boolean If `false`, and the mesh has been assigned to a valid team, players on other teams will not collide with the mesh.
--- @field public isCameraCollisionEnabled boolean If `false`, the mesh will not push against the camera. Useful for things like railings or transparent walls. This property is deprecated, use the `cameraCollision` property instead.
--- @field public type string 
--- @field GetColor fun(self): Color
--- @field SetColor fun(self, color: Color )
--- @field ResetColor fun(self)
--- @field IsA fun(self, typeName: string ): boolean

--- @class CoreObject
--- @field public name string The object's name as seen in the Hierarchy.
--- @field public id string The object's MUID.
--- @field public isVisible boolean 
--- @field public visibility Visibility Turn on/off the rendering of an object and its children.
--- @field public isCollidable boolean 
--- @field public collision Collision Turn on/off the collision of an object and its children.
--- @field public cameraCollision Collision Turn on/off the collision of the camera with an object and its children.
--- @field public isEnabled boolean Turn on/off an object and its children completely.
--- @field public lifeSpan number Duration after which the object is destroyed.
--- @field public isStatic boolean If `true`, dynamic properties may not be written to, and dynamic functions may not be called.
--- @field public isNetworked boolean If `true`, this object replicates from the server to clients.
--- @field public isClientOnly boolean If `true`, this object was spawned on the client and is not replicated from the server.
--- @field public isServerOnly boolean If `true`, this object was spawned on the server and is not replicated to clients.
--- @field public parent CoreObject The object's parent object, may be nil.
--- @field public sourceTemplateId string The ID of the template from which this `CoreObject` was instantiated. `nil` if the object did not come from a template.
--- @field public type string 
--- @field GetReference fun(self): CoreObjectReference
--- @field GetTransform fun(self): Transform
--- @field SetTransform fun(self, localTransform: Transform )
--- @field GetPosition fun(self): Vector3
--- @field SetPosition fun(self, localPosition: Vector3 )
--- @field GetRotation fun(self): Rotation
--- @field SetRotation fun(self, localRotation: Rotation )
--- @field GetScale fun(self): Vector3
--- @field SetScale fun(self, localScale: Vector3 )
--- @field GetWorldTransform fun(self): Transform
--- @field SetWorldTransform fun(self, worldTransform: Transform )
--- @field GetWorldPosition fun(self): Vector3
--- @field SetWorldPosition fun(self, worldPosition: Vector3 )
--- @field GetWorldRotation fun(self): Rotation
--- @field SetWorldRotation fun(self, worldRotation: Rotation )
--- @field GetWorldScale fun(self): Vector3
--- @field SetWorldScale fun(self, worldScale: Vector3 )
--- @field GetVelocity fun(self): Vector3
--- @field SetVelocity fun(self, velocity: Vector3 )
--- @field GetAngularVelocity fun(self): Vector3
--- @field SetAngularVelocity fun(self, angularVelocity: Vector3 )
--- @field SetLocalAngularVelocity fun(self, localAngularVelocity: Vector3 )
--- @field GetChildren fun(self): table<number, CoreObject>
--- @field AttachToPlayer fun(self, player: Player , socketName: string )
--- @field AttachToLocalView fun(self)
--- @field Detach fun(self)
--- @field GetAttachedToSocketName fun(self): string
--- @field IsVisibleInHierarchy fun(self): boolean
--- @field IsCollidableInHierarchy fun(self): boolean
--- @field IsCameraCollidableInHierarchy fun(self): boolean
--- @field IsEnabledInHierarchy fun(self): boolean
--- @field FindAncestorByName fun(self, name: string ): CoreObject
--- @field FindChildByName fun(self, name: string ): CoreObject
--- @field FindDescendantByName fun(self, name: string ): CoreObject
--- @field FindDescendantsByName fun(self, name: string ): table<number, CoreObject>
--- @field FindAncestorByType fun(self, typeName: string ): CoreObject
--- @field FindChildByType fun(self, typeName: string ): CoreObject
--- @field FindDescendantByType fun(self, typeName: string ): CoreObject
--- @field FindDescendantsByType fun(self, typeName: string ): table<number, CoreObject>
--- @field FindTemplateRoot fun(self): CoreObject
--- @field IsAncestorOf fun(self, coreObject: CoreObject ): boolean
--- @field MoveTo fun(self, : Vector3|Vector3 , : number|number , isLocal: boolean )
--- @field MoveContinuous fun(self, world: Vector3|Vector3 , isLocal: boolean )
--- @field Follow fun(self, : Player|Player|CoreObject|CoreObject|CoreObject|Player , : number|number|number|number , minimum: number|number )
--- @field StopMove fun(self)
--- @field RotateTo fun(self, : Quaternion|Rotation|Rotation|Quaternion , : number|number|number|number , isLocal: boolean|boolean )
--- @field RotateContinuous fun(self, angular: Vector3|Quaternion|Quaternion|Quaternion|Rotation|Rotation|Rotation|Vector3 , isLocalAngular: number|number|number|number|boolean )
--- @field LookAt fun(self, worldPosition: Vector3 )
--- @field LookAtContinuous fun(self, : Player|Player|Player|CoreObject|CoreObject|CoreObject|CoreObject|Player , isPitch: number|boolean|boolean|number|boolean|boolean , : number|number )
--- @field LookAtLocalView fun(self, isPitch: boolean )
--- @field StopRotate fun(self)
--- @field ScaleTo fun(self, : Vector3|Vector3 , : number|number , isScale: boolean )
--- @field ScaleContinuous fun(self, scale: Vector3|Vector3 , isLocalScale: boolean )
--- @field StopScale fun(self)
--- @field Destroy fun(self)
--- @field GetCustomProperties fun(self): table
--- @field GetCustomProperty fun(self, propertyName: string ): table|boolean
--- @field SetNetworkedCustomProperty fun(self, propertyName: string , propertyValue: table ): boolean
--- @field IsA fun(self, typeName: string ): boolean

--- @class CoreObjectReference
--- @field public id string The MUID of the referred object.
--- @field public isAssigned boolean Returns true if this reference has been assigned a valid ID. This does not necessarily mean the object currently exists.
--- @field public type string 
--- @field GetObject fun(self): CoreObject
--- @field WaitForObject fun(self, timeout: number ): CoreObject
--- @field IsA fun(self, typeName: string ): boolean

--- @class CorePlayerProfile
--- @field public id string The ID of the player.
--- @field public name string The name of the player. This field does not reflect changes that may have been made to the `name` property of a `Player` currently in the game.
--- @field public description string A description of the player, provided by the player in the About section of their profile.
--- @field public type string 
--- @field IsA fun(self, typeName: string ): boolean

--- @class Damage
--- @field public amount number The numeric amount of damage to inflict.
--- @field public reason DamageReason What is the context for this Damage? DamageReason.UNKNOWN (default value), DamageReason.COMBAT, DamageReason.FRIENDLY_FIRE, DamageReason.MAP, DamageReason.NPC.
--- @field public sourceAbility Ability Reference to the Ability which caused the Damage. Setting this allows other systems to react to the damage event, e.g. a kill feed can show what killed a Player.
--- @field public sourcePlayer Player Reference to the Player who caused the Damage. Setting this allows other systems to react to the damage event, e.g. a kill feed can show who killed a Player.
--- @field public type string 
--- @field GetHitResult fun(self): HitResult
--- @field SetHitResult fun(self, hitResult: HitResult )
--- @field IsA fun(self, typeName: string ): boolean

--- @class Decal
--- @field public type string 
--- @field IsA fun(self, typeName: string ): boolean

--- @class Equipment
--- @field public owner Player Which Player the Equipment is attached to.
--- @field public socket string Determines which point on the avatar's body this equipment will be attached. See [Socket Names](../api/animations.md#socket-names) for the list of possible values.
--- @field public type string 
--- @field GetAbilities fun(self): table<number, Ability>
--- @field Equip fun(self, player: Player )
--- @field Unequip fun(self)
--- @field AddAbility fun(self, ability: Ability )
--- @field IsA fun(self, typeName: string ): boolean

--- @class Event
--- @field public type string 
--- @field Connect fun(self, listener: function , additionalParameters: void  = nil): EventListener
--- @field IsA fun(self, typeName: string ): boolean

--- @class EventListener
--- @field public isConnected boolean Returns true if this listener is still connected to its event. false if the event owner was destroyed or if Disconnect was called.
--- @field public type string 
--- @field Disconnect fun(self)
--- @field IsA fun(self, typeName: string ): boolean

--- @class Folder
--- @field public type string 
--- @field IsA fun(self, typeName: string ): boolean

--- @class FourWheeledVehicle
--- @field public turnRadius number Returns the radius, in centimeters, measured by the inner wheels of the vehicle while making a turn.
--- @field public type string 
--- @field IsA fun(self, typeName: string ): boolean

--- @class HitResult
--- @field public other Object Reference to a CoreObject or Player impacted.
--- @field public socketName string If the hit was on a Player, `socketName` tells you which spot on the body was hit.
--- @field public type string 
--- @field GetImpactPosition fun(self): Vector3
--- @field GetImpactNormal fun(self): Vector3
--- @field GetTransform fun(self): Transform
--- @field IsA fun(self, typeName: string ): boolean

--- @class Hook
--- @field public type string 
--- @field Connect fun(self, listener: function , additionalParameters: void  = nil): HookListener
--- @field IsA fun(self, typeName: string ): boolean

--- @class HookListener
--- @field public isConnected boolean Returns `true` if this listener is still connected to its hook, `false` if the hook owner was destroyed or if `Disconnect` was called.
--- @field public priority number The priority of this listener. When a given hook is fired, listeners with a higher priority are called first. Default value is `100`.
--- @field public type string 
--- @field Disconnect fun(self)
--- @field IsA fun(self, typeName: string ): boolean

--- @class ImpactData
--- @field public targetObject Object Reference to the CoreObject/Player hit by the Weapon.
--- @field public projectile Projectile Reference to a Projectile, if one was produced as part of this interaction.
--- @field public sourceAbility Ability Reference to the Ability which initiated the interaction.
--- @field public weapon Weapon Reference to the Weapon that is interacting.
--- @field public weaponOwner Player Reference to the Player who had the Weapon equipped at the time it was activated, ultimately leading to this interaction.
--- @field public isHeadshot boolean True if the Weapon hit another player in the head.
--- @field public travelDistance number The distance in cm between where the Weapon attack started until it impacted something.
--- @field public type string 
--- @field GetHitResult fun(self): HitResult
--- @field GetHitResults fun(self): table<number, HitResult>
--- @field IsA fun(self, typeName: string ): boolean

--- @class LeaderboardEntry
--- @field public id string The ID of the `Player` whose entry this is.
--- @field public name string The name of the `Player` whose entry this is.
--- @field public score number The Player's score.
--- @field public additionalData string Optional additional data that was submitted along with the Player's score. (See `Leaderboards.SubmitPlayerScore()` for more information.)
--- @field public type string 
--- @field IsA fun(self, typeName: string ): boolean

--- @class Light
--- @field public intensity number The intensity of the light. For PointLights and SpotLights, this has two interpretations, depending on the value of the `hasNaturalFallOff` property. If `true`, the light's Intensity is in units of lumens, where 1700 lumens is a 100W lightbulb. If `false`, the light's Intensity is a brightness scale.
--- @field public attenuationRadius number Bounds the light's visible influence. This clamping of the light's influence is not physically correct but very important for performance, larger lights cost more.
--- @field public isShadowCaster boolean Does this light cast shadows?
--- @field public hasTemperature boolean true: use temperature value as illuminant. false: use white (D65) as illuminant.
--- @field public temperature number Color temperature in Kelvin of the blackbody illuminant. White (D65) is 6500K.
--- @field public team number Assigns the light to a team. Value range from 0 to 4. 0 is a neutral team.
--- @field public isTeamColorUsed boolean If `true`, and the light has been assigned to a valid team, players on that team will see a blue light, while other players will see red.
--- @field public type string 
--- @field GetColor fun(self): Color
--- @field SetColor fun(self, color: Color )
--- @field IsA fun(self, typeName: string ): boolean

--- @class MergedModel
--- @field public type string 
--- @field IsA fun(self, typeName: string ): boolean

--- @class NetReference
--- @field public isAssigned boolean Returns true if this reference has been assigned a value. This does not necessarily mean the reference is valid, but does mean it is at least not empty.
--- @field public referenceType NetReferenceType Returns one of `NetReferenceType.LEADERBOARD`, `NetReferenceType.SHARED_STORAGE`, or `NetReferenceType.UNKNOWN` to indicate which type of NetReference this is.
--- @field public type string 
--- @field IsA fun(self, typeName: string ): boolean

--- @class NetworkContext
--- @field public type string 
--- @field IsA fun(self, typeName: string ): boolean

--- @class Object
--- @field public serverUserData table Table in which users can store any data they want on the server.
--- @field public clientUserData table Table in which users can store any data they want on the client.
--- @field public type string 
--- @field IsA fun(self, typeName: string ): boolean

--- @class Player
--- @field public id string The unique id of the Player. Consistent across sessions.
--- @field public name string The Player's name.
--- @field public team number The number of the team to which the Player is assigned. By default, this value is 255 in FFA mode.
--- @field public hitPoints number Current amount of hitpoints.
--- @field public maxHitPoints number Maximum amount of hitpoints.
--- @field public kills number The number of times the player has killed another player.
--- @field public deaths number The number of times the player has died.
--- @field public isDead boolean True if the Player is dead, otherwise false.
--- @field public mass number Gets the mass of the Player.
--- @field public isAccelerating boolean True if the Player is accelerating, such as from input to move.
--- @field public isCrouching boolean True if the Player is crouching.
--- @field public isFlying boolean True if the Player is flying.
--- @field public isGrounded boolean True if the Player is on the ground with no upward velocity, otherwise false.
--- @field public isJumping boolean True if the Player is jumping.
--- @field public isMounted boolean True if the Player is mounted on another object.
--- @field public isSwimming boolean True if the Player is swimming in water.
--- @field public isWalking boolean True if the Player is in walking mode.
--- @field public isSliding boolean 
--- @field public maxWalkSpeed number Maximum speed while the player is on the ground. Clients can only read. Default = 640.
--- @field public stepHeight number Maximum height in centimeters the Player can step up. Range is 0-100. Default = 45.
--- @field public maxAcceleration number Max Acceleration (rate of change of velocity). Clients can only read. Default = 1800.
--- @field public brakingDecelerationFalling number Deceleration when falling and not applying acceleration. Default = 0.
--- @field public brakingDecelerationWalking number Deceleration when walking and movement input has stopped. Default = 1000.
--- @field public groundFriction number Friction when walking on ground. Default = 8.0
--- @field public brakingFrictionFactor number Multiplier for friction when braking. Default = 0.6.
--- @field public walkableFloorAngle number Max walkable floor angle, in degrees. Clients can only read. Default = 44.
--- @field public lookSensitivity number Multiplier on the Player look rotation speed relative to cursor movement. This is independent from user's preferences, both will be applied as multipliers together. Default = 1.0.
--- @field public animationStance string Which set of animations to use for this Player. See [Animation Stance Strings](../api/animations.md#animation-stance-strings) for possible values.
--- @field public activeEmote string Returns the id of the emote currently being played by the Player, or `nil` if no emote is playing.
--- @field public currentFacingMode FacingMode Current mode applied to player, including possible overrides. Possible values are FacingMode.FACE_AIM_WHEN_ACTIVE, FacingMode.FACE_AIM_ALWAYS, and FacingMode.FACE_MOVEMENT. See desiredFacingMode for details.
--- @field public desiredFacingMode FacingMode Which controls mode to use for this Player. May be overridden by certain movement modes like MovementMode.SWIMMING or when mounted. Possible values are FacingMode.FACE_AIM_WHEN_ACTIVE, FacingMode.FACE_AIM_ALWAYS, and FacingMode.FACE_MOVEMENT.
--- @field public maxJumpCount number Max number of jumps, to enable multiple jumps. Set to 0 to disable jumping.
--- @field public flipOnMultiJump boolean 
--- @field public shouldFlipOnMultiJump boolean 
--- @field public jumpVelocity number Vertical speed applied to Player when they jump. Default = 900.
--- @field public gravityScale number Multiplier on gravity applied. Default = 1.9.
--- @field public maxSwimSpeed number Maximum speed while the player is swimming. Default = 420.
--- @field public touchForceFactor number Force applied to physics objects when contacted with a Player. Default = 1.
--- @field public isCrouchEnabled boolean Turns crouching on/off for a Player.
--- @field public buoyancy number In water, buoyancy 1.0 is neutral (won't sink or float naturally). Less than 1 to sink, greater than 1 to float.
--- @field public isVisible boolean Defaults to `true`. Set to `false` to hide the player and any attached objects which are set to inherit visibility. Note that using this property in conjunction with the deprecated `SetVisibility()` function may cause unpredictable results.
--- @field public isVisibleToSelf boolean Set whether to hide the Player model on Player's own client, for sniper scope, etc.
--- @field public spreadModifier number Modifier added to the Player's targeting spread.
--- @field public currentSpread number Gets the Player's current targeting spread.
--- @field public canMount boolean Returns whether the Player can manually toggle on/off the mount.
--- @field public shouldDismountWhenDamaged boolean If `true`, and the Player is mounted they will dismount if they take damage.
--- @field public movementControlMode MovementControlMode Specify how players control their movement. Clients can only read. Default: MovementControlMode.LOOK_RELATIVE. MovementControlMode.NONE: Movement input is ignored. MovementControlMode.LOOK_RELATIVE: Forward movement follows the current player's look direction. MovementControlMode.VIEW_RELATIVE: Forward movement follows the current view's look direction. MovementControlMode.FACING_RELATIVE: Forward movement follows the current player's facing direction. MovementControlMode.FIXED_AXES: Movement axis are fixed.
--- @field public lookControlMode LookControlMode Specify how players control their look direction. Default: LookControlMode.RELATIVE. LookControlMode.NONE: Look input is ignored. LookControlMode.RELATIVE: Look input controls the current look direction. LookControlMode.LOOK_AT_CURSOR: Look input is ignored. The player's look direction is determined by drawing a line from the player to the cursor on the Cursor Plane.
--- @field public isMovementEnabled boolean Defaults to `true`. Set to `false` to disable player movement. Unlike `movementControlMode`, which can disable movement input, setting `isMovementEnabled` to `false` freezes the Player in place, ignoring gravity and reactions to collision or impulses, unless the Player's transform is explicitly changed or the Player is attached to a parent CoreObject that moves.
--- @field public isCollidable boolean Defaults to `true`. Set to `false` to disable collision on the player and any attached objects set to inherit collision.
--- @field public parentCoreObject CoreObject If the Player has been attached to a parent CoreObject, returns that object. Otherwise returns `nil`.
--- @field public occupiedVehicle Vehicle Returns the `Vehicle` that the player currently occupies, or `nil` if the player is not occupying a vehicle.
--- @field public currentRotationRate number Reports the real rotation rate that results from any active mechanics/movement overrides.
--- @field public defaultRotationRate number Determines how quickly the Player turns to match the camera's look. Set to -1 for immediate rotation. Currently only supports rotation around the Z-axis.
--- @field public type string 
--- @field GetWorldTransform fun(self): Transform
--- @field SetWorldTransform fun(self, worldTransform: Transform )
--- @field GetWorldPosition fun(self): Vector3
--- @field SetWorldPosition fun(self, worldPosition: Vector3 )
--- @field GetWorldRotation fun(self): Rotation
--- @field SetWorldRotation fun(self, worldRotation: Rotation )
--- @field GetWorldScale fun(self): Vector3
--- @field SetWorldScale fun(self, worldScale: Vector3 )
--- @field GetVelocity fun(self): Vector3
--- @field GetAbilities fun(self): table<number, Ability>
--- @field GetEquipment fun(self): table<number, Equipment>
--- @field GetAttachedObjects fun(self): table<number, CoreObject>
--- @field AddImpulse fun(self, impulse: Vector3 )
--- @field SetVelocity fun(self, velocity: Vector3 )
--- @field ResetVelocity fun(self)
--- @field ApplyDamage fun(self, damage: Damage )
--- @field EnableRagdoll fun(self, socket: string|string , : number )
--- @field DisableRagdoll fun(self)
--- @field SetVisibility fun(self, is: boolean|boolean , include: boolean )
--- @field GetVisibility fun(self): boolean
--- @field GetViewWorldPosition fun(self): Vector3
--- @field GetViewWorldRotation fun(self): Rotation
--- @field Die fun(self, : Damage )
--- @field Respawn fun(self, : table|Vector3 , : Rotation )
--- @field ClearResources fun(self)
--- @field GetResources fun(self): table
--- @field GetResource fun(self, resourceName: string ): number
--- @field SetResource fun(self, resourceName: string , amount: number ): number
--- @field AddResource fun(self, resourceName: string , amount: number ): number
--- @field RemoveResource fun(self, resourceName: string , amount: number ): number
--- @field GetResourceNames fun(self): table<number, string>
--- @field GetResourceNamesStartingWith fun(self, resourceNamePrefix: string ): table<number, string>
--- @field TransferToGame fun(self, gameCollection: CoreGameInfo|string|CoreGameCollectionEntry )
--- @field HasPerk fun(self, perkReference: NetReference ): boolean
--- @field GetPerkCount fun(self, perkReference: NetReference ): number
--- @field GetPerkTimeRemaining fun(self, perkReference: NetReference ): number
--- @field ActivateFlying fun(self)
--- @field ActivateWalking fun(self)
--- @field SetMounted fun(self, isMounted: boolean )
--- @field GetActiveCamera fun(self): Camera
--- @field GetDefaultCamera fun(self): Camera
--- @field SetDefaultCamera fun(self, : Camera|Camera )
--- @field GetOverrideCamera fun(self): Camera
--- @field SetOverrideCamera fun(self, : Camera|Camera )
--- @field ClearOverrideCamera fun(self)
--- @field GetLookWorldRotation fun(self): Rotation
--- @field SetLookWorldRotation fun(self, newLookRotation: Rotation )
--- @field IsBindingPressed fun(self, bindingName: string ): boolean
--- @field AttachToCoreObject fun(self, object: CoreObject )
--- @field Detach fun(self)
--- @field GetJoinTransferData fun(self): PlayerTransferData
--- @field GetLeaveTransferData fun(self): PlayerTransferData
--- @field IsA fun(self, typeName: string ): boolean

--- @class PlayerSettings
--- @field public type string 
--- @field ApplyToPlayer fun(self, player: Player )
--- @field IsA fun(self, typeName: string ): boolean

--- @class PlayerStart
--- @field public team number Determines which players are eligible to spawn/respawn at this point.
--- @field public type string 
--- @field IsA fun(self, typeName: string ): boolean

--- @class PlayerTransferData
--- @field public reason PlayerTransferReason Indicates how the player joined or left a game.
--- @field public gameId string The ID of the game the player joined from or left to join. Returns `nil` if the player joined while not already connected to a game or left for a reason other than joining another game. Also returns `nil` if the player has opted out of sharing this information.
--- @field public type string 
--- @field IsA fun(self, typeName: string ): boolean

--- @class PointLight
--- @field public hasNaturalFalloff boolean The attenuation method of the light. When enabled, `attenuationRadius` is used. When disabled, `falloffExponent` is used. Also changes the interpretation of the intensity property, see intensity for details.
--- @field public falloffExponent number Controls the radial falloff of the light when `hasNaturalFalloff` is false. 2.0 is almost linear and very unrealistic and around 8.0 it looks reasonable. With large exponents, the light has contribution to only a small area of its influence radius but still costs the same as low exponents.
--- @field public sourceRadius number Radius of light source shape.
--- @field public sourceLength number Length of light source shape.
--- @field public type string 
--- @field IsA fun(self, typeName: string ): boolean

--- @class Projectile
--- @field public sourceAbility Ability Reference to the Ability from which the Projectile was created.
--- @field public shouldBounceOnPlayers boolean Determines if the Projectile should bounce off players or be destroyed, when bouncesRemaining is used. Default false.
--- @field public shouldDieOnImpact boolean If `true`, the Projectile is automatically destroyed when it hits something, unless it has bounces remaining. Default true.
--- @field public owner Player The Player who fired this Projectile. Setting this property ensures the Projectile does not impact the owner or their allies. This will also change the color of the Projectile if teams are being used in the game.
--- @field public speed number Centimeters per second movement. Default 5000.
--- @field public maxSpeed number Max cm/s. Default 0. Zero means no limit.
--- @field public gravityScale number How much drop. Default 1. 1 means normal gravity. Zero can be used to make a Projectile go in a straight line.
--- @field public drag number Deceleration. Important for homing Projectiles (try a value around 5). Negative drag will cause the Projectile to accelerate. Default 0.
--- @field public bouncesRemaining number Number of bounces remaining before it dies. Default 0.
--- @field public bounciness number Velocity % maintained after a bounce. Default 0.6.
--- @field public piercesRemaining number Number of objects that will be pierced before it dies. A piercing Projectile loses no velocity when going through objects, but still fires the impactEvent event. If combined with bounces, all piercesRemaining are spent before bouncesRemaining are counted. Default 0.
--- @field public lifeSpan number Max seconds the Projectile will exist. Default 10.
--- @field public capsuleRadius number Shape of the Projectile's collision. Default 22.
--- @field public capsuleLength number Shape of the Projectile's collision. A value of zero will make it shaped like a Sphere. Default 44.
--- @field public homingTarget Object The projectile accelerates towards its target. Homing targets are meant to be used with spawned projectiles and will not work with weapons.
--- @field public homingAcceleration number Magnitude of acceleration towards the target. Default 10,000.
--- @field public type string 
--- @field GetWorldTransform fun(self): Transform
--- @field GetWorldPosition fun(self): Vector3
--- @field SetWorldPosition fun(self, worldPosition: Vector3 )
--- @field GetVelocity fun(self): Vector3
--- @field SetVelocity fun(self, velocity: Vector3 )
--- @field Destroy fun(self)
--- @field IsA fun(self, typeName: string ): boolean

--- @class Quaternion
--- @field public x number The `x` component of the Quaternion.
--- @field public y number The `y` component of the Quaternion.
--- @field public z number The `z` component of the Quaternion.
--- @field public w number The `w` component of the Quaternion.
--- @field public type string 
--- @field GetRotation fun(self): Rotation
--- @field GetForwardVector fun(self): Vector3
--- @field GetRightVector fun(self): Vector3
--- @field GetUpVector fun(self): Vector3
--- @field IsA fun(self, typeName: string ): boolean

--- @class RandomStream
--- @field public seed number The current seed used for RNG.
--- @field public type string 
--- @field GetInitialSeed fun(self): number
--- @field Reset fun(self)
--- @field Mutate fun(self)
--- @field GetNumber fun(self): number
--- @field GetInteger fun(self, min: number , max: number ): number
--- @field GetVector3 fun(self): Vector3
--- @field GetVector3FromCone fun(self, : Vector3|Vector3 , horizontalHalf: number|number , verticalHalf: number ): Vector3
--- @field IsA fun(self, typeName: string ): boolean

--- @class Rotation
--- @field public x number The `x` component of the Rotation.
--- @field public y number The `y` component of the Rotation.
--- @field public z number The `z` component of the Rotation.
--- @field public type string 
--- @field IsA fun(self, typeName: string ): boolean

--- @class Script
--- @field public context table Returns the table containing any non-local variables and functions created by the script. This can be used to call (or overwrite!) functions on another script.
--- @field public type string 
--- @field IsA fun(self, typeName: string ): boolean

--- @class ScriptAsset
--- @field public name string The name of the script in Project Content.
--- @field public id string The script asset's MUID.
--- @field public type string 
--- @field GetCustomProperties fun(self): table
--- @field GetCustomProperty fun(self, propertyName: string ): table|boolean
--- @field IsA fun(self, typeName: string ): boolean

--- @class SmartAudio
--- @field public isSpatializationEnabled boolean Default true. Set to false to play sound without 3D positioning.
--- @field public isAttenuationEnabled boolean Default true, meaning sounds will fade with distance.
--- @field public isOcclusionEnabled boolean Default true. Changes attenuation if there is geometry between the player and the audio source.
--- @field public fadeInTime number Sets the fade in time for the audio. When the audio is played, it will start at zero volume, and fade in over this many seconds.
--- @field public fadeOutTime number Sets the fadeout time of the audio. When the audio is stopped, it will keep playing for this many seconds, as it fades out.
--- @field public startTime number The start time of the audio track. Default is 0. Setting this to anything else means that the audio will skip ahead that many seconds when played.
--- @field public stopTime number The stop time of the audio track. Default is 0. A positive value means that the audio will stop that many seconds from the start of the track, including any fade out time.
--- @field public isAutoPlayEnabled boolean Default false. If set to true when placed in the editor (or included in a template), the sound will be automatically played when loaded.
--- @field public isTransient boolean Default false. If set to true, the sound will automatically destroy itself after it finishes playing.
--- @field public isAutoRepeatEnabled boolean Loops when playback has finished. Some sounds are designed to automatically loop, this flag will force others that don't. Useful for looping music.
--- @field public pitch number Default 1. Multiplies the playback pitch of a sound. Note that some sounds have clamped pitch ranges (0.2 to 1).
--- @field public volume number Default 1. Multiplies the playback volume of a sound. Note that values above 1 can distort sound, so if you're trying to balance sounds, experiment to see if scaling down works better than scaling up.
--- @field public radius number Default 0. If non-zero, will override default 3D spatial parameters of the sound. Radius is the distance away from the sound position that will be played at 100% volume.
--- @field public falloff number Default 0. If non-zero, will override default 3D spatial parameters of the sound. Falloff is the distance outside the radius over which the sound volume will gradually fall to zero.
--- @field public isPlaying boolean Returns if the sound is currently playing.
--- @field public type string 
--- @field Play fun(self)
--- @field Stop fun(self)
--- @field FadeIn fun(self, time: number )
--- @field FadeOut fun(self, time: number )
--- @field IsA fun(self, typeName: string ): boolean

--- @class SmartObject
--- @field public team number Assigns the SmartObject to a team. Value range from 0 to 4. 0 is neutral team.
--- @field public isTeamColorUsed boolean If `true`, and the SmartObject has been assigned to a valid team, players on that team will see one color, while other players will see another color. Requires a SmartObject that supports team colors.
--- @field public type string 
--- @field GetSmartProperties fun(self): table
--- @field GetSmartProperty fun(self, propertyName: string ): table|boolean
--- @field SetSmartProperty fun(self, propertyName: string , propertyValue: table ): boolean
--- @field IsA fun(self, typeName: string ): boolean

--- @class SpotLight
--- @field public hasNaturalFalloff boolean The attenuation method of the light. When enabled, `attenuationRadius` is used. When disabled, `falloffExponent` is used. Also changes the interpretation of the intensity property, see intensity for details.
--- @field public falloffExponent number Controls the radial falloff of the light when `hasNaturalFalloff` is false. 2.0 is almost linear and very unrealistic and around 8.0 it looks reasonable. With large exponents, the light has contribution to only a small area of its influence radius but still costs the same as low exponents.
--- @field public sourceRadius number Radius of light source shape.
--- @field public sourceLength number Length of light source shape.
--- @field public innerConeAngle number The angle (in degrees) of the cone within which the projected light achieves full brightness.
--- @field public outerConeAngle number The outer angle (in degrees) of the cone of light emitted by this SpotLight.
--- @field public type string 
--- @field IsA fun(self, typeName: string ): boolean

--- @class StaticMesh
--- @field public isSimulatingDebrisPhysics boolean If `true`, physics will be enabled for the mesh.
--- @field public type string 
--- @field IsA fun(self, typeName: string ): boolean

--- @class Task
--- @field public repeatInterval number For repeating Tasks, the number of seconds to wait after the Task completes before running it again. If set to 0, the Task will wait until the next frame.
--- @field public repeatCount number If set to a non-negative number, the Task will execute that many times. A negative number indicates the Task should repeat indefinitely (until otherwise canceled). With the default of 0, the Task will execute once. With a value of 1, the script will repeat once, meaning it will execute twice.
--- @field public id number A unique identifier for the task.
--- @field public type string 
--- @field Cancel fun(self)
--- @field GetStatus fun(self): TaskStatus
--- @field IsA fun(self, typeName: string ): boolean

--- @class Terrain
--- @field public type string 
--- @field IsA fun(self, typeName: string ): boolean

--- @class Transform
--- @field public type string 
--- @field GetRotation fun(self): Rotation
--- @field SetRotation fun(self, rotation: Rotation )
--- @field GetPosition fun(self): Vector3
--- @field SetPosition fun(self, position: Vector3 )
--- @field GetScale fun(self): Vector3
--- @field SetScale fun(self, scale: Vector3 )
--- @field GetQuaternion fun(self): Quaternion
--- @field SetQuaternion fun(self, quaternion: Quaternion )
--- @field GetForwardVector fun(self): Vector3
--- @field GetRightVector fun(self): Vector3
--- @field GetUpVector fun(self): Vector3
--- @field GetInverse fun(self): Transform
--- @field TransformPosition fun(self, position: Vector3 ): Vector3
--- @field TransformDirection fun(self, direction: Vector3 ): Vector3
--- @field IsA fun(self, typeName: string ): boolean

--- @class TreadedVehicle
--- @field public turnSpeed number Returns the turn speed in degrees per second.
--- @field public type string 
--- @field IsA fun(self, typeName: string ): boolean

--- @class Trigger
--- @field public isInteractable boolean Interactable Triggers expect Players to walk up and press the <kbd>F</kbd> key to activate them.
--- @field public interactionLabel string The text players will see in their HUD when they come into range of interacting with this trigger.
--- @field public team number Assigns the trigger to a team. Value range from 0 to 4. 0 is neutral team.
--- @field public isTeamCollisionEnabled boolean If `false`, and the Trigger has been assigned to a valid team, players on that team will not overlap or interact with the Trigger.
--- @field public isEnemyCollisionEnabled boolean If `false`, and the Trigger has been assigned to a valid team, players on enemy teams will not overlap or interact with the Trigger.
--- @field public type string 
--- @field IsOverlapping fun(self, OtherObject: Object ): boolean
--- @field GetOverlappingObjects fun(self): table<number, Object>
--- @field IsA fun(self, typeName: string ): boolean

--- @class UIButton
--- @field public text string Returns the button's label text.
--- @field public fontSize number Returns the font size of the label text.
--- @field public isInteractable boolean Returns whether the Button can interact with the cursor (click, hover, etc).
--- @field public shouldClipToSize boolean Whether or not the button and its shadow should be clipped when exceeding the bounds of this control.
--- @field public type string 
--- @field SetImage fun(self, imageId: string )
--- @field GetButtonColor fun(self): Color
--- @field SetButtonColor fun(self, color: Color )
--- @field GetHoveredColor fun(self): Color
--- @field SetHoveredColor fun(self, color: Color )
--- @field GetPressedColor fun(self): Color
--- @field SetPressedColor fun(self, color: Color )
--- @field GetDisabledColor fun(self): Color
--- @field SetDisabledColor fun(self, color: Color )
--- @field GetFontColor fun(self): Color
--- @field SetFontColor fun(self, color: Color )
--- @field SetFont fun(self, font: string )
--- @field GetShadowColor fun(self): Color
--- @field SetShadowColor fun(self, color: Color )
--- @field GetShadowOffset fun(self): Vector2
--- @field SetShadowOffset fun(self, vector2: Vector2 )
--- @field IsA fun(self, typeName: string ): boolean

--- @class UIContainer
--- @field public opacity number Controls the opacity of the container's contents by multiplying the alpha component of descendants' colors. Note that other UIPanels and UIContainers in the hierarchy may also contribute their own opacity values. A resulting alpha value of 1 or greater is fully opaque, 0 is fully transparent.
--- @field public type string 
--- @field IsA fun(self, typeName: string ): boolean

--- @class UIControl
--- @field public x number Screen-space offset from the anchor.
--- @field public y number Screen-space offset from the anchor.
--- @field public width number Horizontal size of the control.
--- @field public height number Vertical size of the control.
--- @field public rotationAngle number rotation angle of the control.
--- @field public anchor UIPivot The pivot point on this control that attaches to its parent. Can be one of `UIPivot.TOP_LEFT`, `UIPivot.TOP_CENTER`, `UIPivot.TOP_RIGHT`, `UIPivot.MIDDLE_LEFT`, `UIPivot.MIDDLE_CENTER`, `UIPivot.MIDDLE_RIGHT`, `UIPivot.BOTTOM_LEFT`, `UIPivot.BOTTOM_CENTER`, `UIPivot.BOTTOM_RIGHT`, or `UIPivot.CUSTOM`.
--- @field public dock UIPivot The pivot point on this control to which children attach. Can be one of `UIPivot.TOP_LEFT`, `UIPivot.TOP_CENTER`, `UIPivot.TOP_RIGHT`, `UIPivot.MIDDLE_LEFT`, `UIPivot.MIDDLE_CENTER`, `UIPivot.MIDDLE_RIGHT`, `UIPivot.BOTTOM_LEFT`, `UIPivot.BOTTOM_CENTER`, `UIPivot.BOTTOM_RIGHT`, or `UIPivot.CUSTOM`.
--- @field public type string 
--- @field IsA fun(self, typeName: string ): boolean

--- @class UIImage
--- @field public isTeamColorUsed boolean If `true`, the image will be tinted blue if its team matches the Player, or red if not.
--- @field public team number the team of the image, used for `isTeamColorUsed`.
--- @field public shouldClipToSize boolean Whether or not the image and its shadow should be clipped when exceeding the bounds of this control.
--- @field public type string 
--- @field GetColor fun(self): Color
--- @field SetColor fun(self, color: Color )
--- @field SetImage fun(self, : string|Player )
--- @field SetPlayerProfile fun(self, : string|CoreFriendCollectionEntry|CorePlayerProfile|Player )
--- @field GetImage fun(self): string
--- @field GetShadowColor fun(self): Color
--- @field SetShadowColor fun(self, color: Color )
--- @field GetShadowOffset fun(self): Vector2
--- @field SetShadowOffset fun(self, vector2: Vector2 )
--- @field IsA fun(self, typeName: string ): boolean

--- @class UIPanel
--- @field public shouldClipChildren number If `true`, children of this UIPanel will not draw outside of its bounds.
--- @field public opacity number Controls the opacity of the panel's contents by multiplying the alpha component of descendants' colors. Note that other UIPanels and UIContainers in the hierarchy may also contribute their own opacity values. A resulting alpha value of 1 or greater is fully opaque, 0 is fully transparent.
--- @field public type string 
--- @field IsA fun(self, typeName: string ): boolean

--- @class UIPerkPurchaseButton
--- @field public isInteractable boolean Returns whether the button can interact with the cursor (click, hover, etc).
--- @field public type string 
--- @field SetPerkReference fun(self, perkReference: NetReference )
--- @field GetPerkReference fun(self): NetReference
--- @field IsA fun(self, typeName: string ): boolean

--- @class UIProgressBar
--- @field public progress number From 0 to 1, how full the bar should be.
--- @field public type string 
--- @field GetFillColor fun(self): Color
--- @field SetFillColor fun(self, color: Color )
--- @field GetBackgroundColor fun(self): Color
--- @field SetBackgroundColor fun(self, color: Color )
--- @field IsA fun(self, typeName: string ): boolean

--- @class UIScrollPanel
--- @field public orientation Orientation Determines whether the panel scrolls horizontally or vertically. Default is `Orientation.VERTICAL`.
--- @field public scrollPosition number The position in UI space of the scroll panel content. Defaults to 0, which is scrolled to the top or left, depending on orientation. Set to the value of `contentLength` to scroll to the end.
--- @field public contentLength number Returns the height or width of the scroll panel content, depending on orientation. This is the maximum value of `scrollPosition`.
--- @field public type string 
--- @field IsA fun(self, typeName: string ): boolean

--- @class UIText
--- @field public text string The actual text string to show.
--- @field public fontSize number The font size of the UIText control.
--- @field public justification TextJustify Determines the alignment of `text`. Possible values are: TextJustify.LEFT, TextJustify.RIGHT, and TextJustify.CENTER.
--- @field public shouldWrapText boolean Whether or not text should be wrapped within the bounds of this control.
--- @field public shouldClipText boolean Whether or not text should be clipped when exceeding the bounds of this control.
--- @field public type string 
--- @field GetColor fun(self): Color
--- @field SetColor fun(self, color: Color )
--- @field ComputeApproximateSize fun(self): Vector2
--- @field SetFont fun(self, font: string )
--- @field GetShadowColor fun(self): Color
--- @field SetShadowColor fun(self, color: Color )
--- @field GetShadowOffset fun(self): Vector2
--- @field SetShadowOffset fun(self, vector2: Vector2 )
--- @field IsA fun(self, typeName: string ): boolean

--- @class Vector2
--- @field public x number The `x` component of the Vector2.
--- @field public y number The `y` component of the Vector2.
--- @field public size number The magnitude of the Vector2.
--- @field public sizeSquared number The squared magnitude of the Vector2.
--- @field public type string 
--- @field GetNormalized fun(self): Vector2
--- @field IsA fun(self, typeName: string ): boolean

--- @class Vector3
--- @field public x number The `x` component of the Vector3.
--- @field public y number The `y` component of the Vector3.
--- @field public z number The `z` component of the Vector3.
--- @field public size number The magnitude of the Vector3.
--- @field public sizeSquared number The squared magnitude of the Vector3.
--- @field public type string 
--- @field GetNormalized fun(self): Vector3
--- @field IsA fun(self, typeName: string ): boolean

--- @class Vector4
--- @field public x number The `x` component of the Vector4.
--- @field public y number The `y` component of the Vector4.
--- @field public z number The `z` component of the Vector4.
--- @field public w number The `w` component of the Vector4.
--- @field public size number The magnitude of the Vector4.
--- @field public sizeSquared number The squared magnitude of the Vector4.
--- @field public type string 
--- @field GetNormalized fun(self): Vector4
--- @field IsA fun(self, typeName: string ): boolean

--- @class Vehicle
--- @field public isAccelerating boolean Returns `true` if the vehicle is currently accelerating.
--- @field public driver Player The Player currently driving the vehicle, or `nil` if there is no driver.
--- @field public mass number Returns the mass of the vehicle in kilograms.
--- @field public maxSpeed number Returns the maximum speed of the vehicle in centimeters per second.
--- @field public accelerationRate number Returns the approximate acceleration rate of the vehicle in centimeters per second squared.
--- @field public brakeStrength number Returns the maximum deceleration of the vehicle when stopping.
--- @field public tireFriction number Returns the amount of friction tires or treads have on the ground.
--- @field public gravityScale number Returns how much gravity affects this vehicle.  Default value is 1.9.
--- @field public isDriverHidden boolean Returns `true` if the driver is made invisible while occupying the vehicle.
--- @field public isDriverAttached boolean Returns `true` if the driver is attached to the vehicle while they occupy it.
--- @field public isBrakeEngaged boolean Returns `true` if the driver of the vehicle is currently using the brakes.
--- @field public isHandbrakeEngaged boolean Returns `true` if the driver of the vehicle is currently using the handbrake.
--- @field public driverAnimationStance string Returns the animation stance that will be applied to the driver while they occupy the vehicle.
--- @field public enterTrigger Trigger Returns the Trigger a Player uses to occupy the vehicle.
--- @field public camera Camera Returns the Camera used for the driver while they occupy the vehicle.
--- @field public type string 
--- @field GetPhysicsBodyOffset fun(self): Vector3
--- @field GetPhysicsBodyScale fun(self): Vector3
--- @field SetDriver fun(self, driver: Player )
--- @field RemoveDriver fun(self)
--- @field AddImpulse fun(self, impulse: Vector3 )
--- @field GetDriverPosition fun(self): Vector3
--- @field GetDriverRotation fun(self): Rotation
--- @field IsA fun(self, typeName: string ): boolean

--- @class Vfx
--- @field public type string 
--- @field Play fun(self, optionalParameters: table )
--- @field Stop fun(self, optionalParameters: table )
--- @field IsA fun(self, typeName: string ): boolean

--- @class Weapon
--- @field public attackCooldownDuration number Interval between separate burst sequences. The value is set by the Shoot ability's Cooldown duration.
--- @field public animationStance string When the Weapon is equipped this animation stance is applied to the Player.
--- @field public multiShotCount number Number of Projectiles/Hitscans that will fire simultaneously inside the spread area each time the Weapon attacks. Does not affect the amount of ammo consumed per attack.
--- @field public burstCount number Number of automatic activations of the Weapon that generally occur in quick succession.
--- @field public shotsPerSecond number Used in conjunction with burstCount to determine the interval between automatic weapon activations.
--- @field public shouldBurstStopOnRelease boolean If `true`, a burst sequence can be interrupted by the Player by releasing the action button. If `false`, the burst continues firing automatically until it completes or the Weapon runs out of ammo.
--- @field public isHitscan boolean If `false`, the Weapon will produce simulated Projectiles. If `true`, it will instead use instantaneous line traces to simulate shots.
--- @field public range number Max travel distance of the Projectile (isHitscan = False) or range of the line trace (isHitscan = True).
--- @field public damage number Damage applied to a Player when the weapon attack hits a player target. If set to zero, no damage is applied.
--- @field public directDamage number 
--- @field public projectileTemplateId string Asset reference for the visual body of the Projectile, for non-hitscan Weapons.
--- @field public muzzleFlashTemplateId string Asset reference for a Vfx to be attached to the muzzle point each time the Weapon attacks.
--- @field public trailTemplateId string Asset reference for a trail Vfx to follow the trajectory of the shot.
--- @field public beamTemplateId string Asset reference for a beam Vfx to be placed along the trajectory of the shot. Useful for hitscan Weapons or very fast Projectiles.
--- @field public impactSurfaceTemplateId string Asset reference of a Vfx to be attached to the surface of any CoreObjects hit by the attack.
--- @field public impactProjectileTemplateId string Asset reference of a Vfx to be spawned at the interaction point. It will be aligned with the trajectory. If the impacted object is a CoreObject, then the Vfx will attach to it as a child.
--- @field public impactPlayerTemplateId string Asset reference of a Vfx to be spawned at the interaction point, if the impacted object is a player.
--- @field public projectileSpeed number Travel speed (cm/s) of Projectiles spawned by this weapon.
--- @field public projectileLifeSpan number Duration after which Projectiles are destroyed.
--- @field public projectileGravity number Gravity scale applied to spawned Projectiles.
--- @field public projectileLength number Length of the Projectile's capsule collision.
--- @field public projectileRadius number Radius of the Projectile's capsule collision
--- @field public projectileDrag number Drag on the Projectile.
--- @field public projectileBounceCount number Number of times the Projectile will bounce before it's destroyed. Each bounce generates an interaction event.
--- @field public projectilePierceCount number Number of objects that will be pierced by the Projectile before it's destroyed. Each pierce generates an interaction event.
--- @field public maxAmmo number How much ammo the Weapon starts with and its max capacity. If set to -1 then the Weapon has infinite capacity and doesn't need to reload.
--- @field public currentAmmo number Current amount of ammo stored in this Weapon.
--- @field public ammoType string A unique identifier for the ammunition type.
--- @field public isAmmoFinite boolean Determines where the ammo comes from. If `true`, then ammo will be drawn from the Player's Resource inventory and reload will not be possible until the Player acquires more ammo somehow. If `false`, then the Weapon simply reloads to full and inventory Resources are ignored.
--- @field public outOfAmmoSoundId string Asset reference for a sound effect to be played when the Weapon tries to activate, but is out of ammo.
--- @field public reloadSoundId string Asset reference for a sound effect to be played when the Weapon reloads ammo.
--- @field public spreadMin number Smallest size in degrees for the Weapon's cone of probability space to fire Projectiles in.
--- @field public spreadMax number Largest size in degrees for the Weapon's cone of probability space to fire Projectiles in.
--- @field public spreadAperture number The surface size from which shots spawn. An aperture of zero means shots originate from a single point.
--- @field public spreadDecreaseSpeed number Speed at which the spread contracts back from its current value to the minimum cone size.
--- @field public spreadIncreasePerShot number Amount the spread increases each time the Weapon attacks.
--- @field public spreadPenaltyPerShot number Cumulative penalty to the spread size for successive attacks. Penalty cools off based on `spreadDecreaseSpeed`.
--- @field public type string 
--- @field HasAmmo fun(self): boolean
--- @field Attack fun(self, target: CoreObject|Vector3|Player )
--- @field IsA fun(self, typeName: string ): boolean

--- @class WorldText
--- @field public text string The text being displayed by this object.
--- @field public type string 
--- @field GetColor fun(self): Color
--- @field SetColor fun(self, color: Color )
--- @field SetFont fun(self, font: string )
--- @field IsA fun(self, typeName: string ): boolean

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

--- @class Chat
--- @field BroadcastMessage fun(message: string , optionalParams: table ): BroadcastMessageResultCode|string
--- @field LocalMessage fun(message: string , optionalParams: table )
Chat = {}

--- @class CoreDebug
--- @field DrawLine fun(start: Vector3|Vector3 , end: Vector3|Vector3 , : table )
--- @field DrawBox fun(center: Vector3|Vector3 , : Vector3|Vector3 , : table )
--- @field DrawSphere fun(center: Vector3|Vector3 , : number|number , : table )
--- @field GetStackTrace fun(): string
--- @field GetTaskStackTrace fun(): string
CoreDebug = {}

--- @class CoreMath
--- @field Round fun(x: number , decimals: number ): number
--- @field Lerp fun(from: number , to: number , progress: number ): number
--- @field Clamp fun(x: number , min: number , max: number ): number
CoreMath = {}

--- @class CorePlatform
--- @field GetGameInfo fun(gameId: string ): CoreGameInfo
--- @field GetGameCollection fun(collectionId: string ): table<number, CoreGameCollectionEntry>
--- @field GetPlayerProfile fun(playerId: string ): CorePlayerProfile
CorePlatform = {}

--- @class CoreSocial
--- @field IsFriendsWithLocalPlayer fun(player: Player|string ): boolean
--- @field GetFriends fun(player: Player ): CoreFriendCollection
CoreSocial = {}

--- @class CoreString
--- @field Split fun(: string|string|string|string ): void
--- @field Join fun(delimiter: string , strings: void  = nil): string
--- @field Trim fun(string: string , trimmedStrings: void  = nil): string
CoreString = {}

--- @class Environment
--- @field IsClient fun(): boolean
--- @field IsServer fun(): boolean
--- @field IsMultiplayerPreview fun(): boolean
--- @field IsSinglePlayerPreview fun(): boolean
--- @field IsPreview fun(): boolean
--- @field IsLocalGame fun(): boolean
--- @field IsHostedGame fun(): boolean
Environment = {}

--- @class Events
--- @field Connect fun(eventName: string , listener: function , additionalParameters: void  = nil): EventListener
--- @field ConnectForPlayer fun(eventName: string , listener: function , additionalParameters: void  = nil): EventListener
--- @field Broadcast fun(eventName: string , argumentList: void  = nil)
--- @field BroadcastToServer fun(eventName: string , argumentList: void  = nil): BroadcastEventResultCode|string
--- @field BroadcastToAllPlayers fun(eventName: string , argumentList: void  = nil): BroadcastEventResultCode|string
--- @field BroadcastToPlayer fun(player: Player , eventName: string , argumentList: void  = nil): BroadcastEventResultCode|string
Events = {}

--- @class Game
--- @field GetLocalPlayer fun(): Player
--- @field FindPlayer fun(playerId: string ): Player
--- @field GetPlayers fun(optionalParams: table ): table<number, Player>
--- @field FindPlayersInCylinder fun(worldPosition: Vector3 , radius: number , optionalParams: table ): table<number, Player>
--- @field FindPlayersInSphere fun(worldPosition: Vector3 , radius: number , optionalParams: table ): table<number, Player>
--- @field FindNearestPlayer fun(worldPosition: Vector3 , optionalParameters: table ): Player
--- @field StartRound fun()
--- @field EndRound fun()
--- @field GetTeamScore fun(team: number ): number
--- @field SetTeamScore fun(team: number , score: number )
--- @field IncreaseTeamScore fun(team: number , scoreChange: number )
--- @field DecreaseTeamScore fun(team: number , scoreChange: number )
--- @field ResetTeamScores fun()
--- @field StopAcceptingPlayers fun()
--- @field IsAcceptingPlayers fun(): boolean
--- @field TransferAllPlayersToGame fun(gameCollection: CoreGameInfo|string|CoreGameCollectionEntry )
--- @field playerJoinedEvent Event
--- @field playerLeftEvent Event
--- @field abilitySpawnedEvent Event
--- @field roundStartEvent Event
--- @field roundEndEvent Event
--- @field teamScoreChangedEvent Event
Game = {}

--- @class Leaderboards
--- @field SubmitPlayerScore fun(leaderboardReference: NetReference , player: Player , score: number , additionalData: string )
--- @field GetLeaderboard fun(leaderboardReference: NetReference , leaderboardType: LeaderboardType ): table
--- @field HasLeaderboards fun(): boolean
Leaderboards = {}

--- @class Storage
--- @field SizeOfData fun(data: table ): number
--- @field GetPlayerData fun(player: Player ): table
--- @field SetPlayerData fun(player: Player , data: table ): StorageResultCode|string
--- @field GetSharedPlayerData fun(sharedStorageKey: NetReference , player: Player ): table
--- @field SetSharedPlayerData fun(sharedStorageKey: NetReference , player: Player , data: table ): StorageResultCode|string
--- @field GetOfflinePlayerData fun(playerId: string ): table
--- @field GetSharedOfflinePlayerData fun(sharedStorageKey: NetReference , playerId: string ): table
Storage = {}

--- @class Teams
--- @field AreTeamsFriendly fun(team1: number , team2: number ): boolean
--- @field AreTeamsEnemies fun(team1: number , team2: number ): boolean
Teams = {}

--- @class UI
--- @field ShowFlyUpText fun(text: string , worldPosition: Vector3 , optionalParameters: table )
--- @field ShowDamageDirection fun(source: Player|Vector3|CoreObject )
--- @field GetScreenPosition fun(worldPosition: Vector3 ): Vector2
--- @field GetScreenSize fun(): Vector2
--- @field PrintToScreen fun(message: string , color: Color )
--- @field GetCursorPosition fun(): Vector2
--- @field GetCursorHitResult fun(): HitResult
--- @field GetCursorPlaneIntersection fun(pointOn: Vector3|Vector3 , plane: Vector3 ): Vector3
--- @field IsCursorVisible fun(): boolean
--- @field SetCursorVisible fun(isVisible: boolean )
--- @field IsCursorLockedToViewport fun(): boolean
--- @field SetCursorLockedToViewport fun(isLocked: boolean )
--- @field CanCursorInteractWithUI fun(): boolean
--- @field SetCanCursorInteractWithUI fun(canInteract: boolean )
--- @field IsReticleVisible fun(): boolean
--- @field SetReticleVisible fun(isVisible: boolean )
--- @field coreModalChangedEvent Event
UI = {}

--- @class World
--- @field GetRootObject fun(): CoreObject
--- @field FindObjectById fun(id: string ): CoreObject
--- @field FindObjectByName fun(name: string ): CoreObject
--- @field FindObjectsByName fun(name: string ): table<number, CoreObject>
--- @field FindObjectsByType fun(typeName: string ): table<number, CoreObject>
--- @field SpawnAsset fun(assetId: string , optionalParameters: table ): CoreObject
--- @field Raycast fun(startPosition: Vector3 , endPosition: Vector3 , optionalParameters: table ): HitResult
World = {}

