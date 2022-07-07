export enum AnnotationType {
  CLASS = 'class',
  FIELD = 'field'
}

export interface CoreLuaAPI {
  Classes: Class[];
  Namespaces: Namespace[];
  Enums: Enum[];
}

export interface Class {
  Name: string;
  Description: string;
  BaseType: string;
  Properties: Property[];
  MemberFunctions: Func[];
  StaticFunctions: Func[];
  Events: Event[];
  Hooks: Hook[];
  Constructors: Func[];
  Constants: Constant[];
  Metamethods: Metamethod[];
}

export interface Namespace {
  Name: string;
  Description: string;
  StaticFunctions: Func[];
  StaticEvents: Event[];
  StaticHooks: Hook[];
  Constants: Constant[];
}

export interface Enum {
  Name: string;
  Description: string;
  IsDeprecated: boolean;
  DeprecationMessage: string;
  Values: {
    Name: string;
    Description: string;
    Value: any;
  }[];
}

export interface Event {
  Name: string;
  Description: string;
  IsDeprecated: boolean;
  DeprecationMessage: string;
  Parameters: {
    Type: string;
    Name: string;
  }[];
}

export interface Func {
  Name: string;
  Description: string;
  Signatures: Signature[];
}

export interface Signature {
  Returns: {
    Type: string;
  }[];
  Parameters: Parameter[];
}

export interface Parameter {
  Type: string;
  Name: string;
  IsVariadic: boolean;
  IsOptional: boolean;
}

export interface Property {
  Name: string;
  Description: string;
  Type: string;
  Tags: string[];
}

export interface Constant {
  Name: string;
  Description: string;
  Type: string;
}

export interface Hook {
  Name: string;
  Description: string;
  IsDeprecated: boolean;
  DeprecationMessage: string;
  Parameters: {
    Type: string;
    Name: string;
  }[];
}

export interface Metamethod {
  Name: string;
  Description: string;
  Signatures: Signature[];
}
