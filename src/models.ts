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
  Constructors: Func[];
}

export interface Namespace {
  Name: string;
  Description: string;
  StaticFunctions: Func[];
  StaticEvents: Event[];
}

export interface Enum {
  Name: string;
  Description: string;
  Values: {
    Name: string;
    Description: string;
    Value: any;
  }[];
}

export interface Event {
  Name: string;
  Description: string;
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
