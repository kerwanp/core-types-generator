import http from 'https';
import { Class, CoreLuaAPI, Enum, Func, Namespace, Signature } from './models';
import fetch from 'node-fetch';
import fs from 'fs';
import {
  arrayToString,
  getAnnotation,
  reservedNamesMapping,
  typeMapping
} from './utils';
import { TypeClass } from './TypeClass';
import { TypeField } from './TypeField';
import { TypeFunction } from './TypeFunction';
import { TypeSignature } from './TypeSignature';
import { TypeParameter } from './TypeParameter';
import { TypeReturn } from './TypeReturn';
import { TypeEnum } from './TypeEnum';

const ENVIRONMENT = 'Prod';
const BASE_URL = `https://manticore${ENVIRONMENT.toLowerCase()}.blob.core.windows.net`;
const VERSION_ENDPOINT = `${BASE_URL}/builds/${ENVIRONMENT}-latest_client_build.txt`;

async function getLatestVersion(): Promise<any> {
  const versionResponse = await fetch(VERSION_ENDPOINT);
  const latestVersion = await versionResponse.text();
  return latestVersion;
}

async function getCoreLuaAPI(): Promise<CoreLuaAPI> {
  const latestVersion = await getLatestVersion();
  console.log('Latest Version:', latestVersion);
  const DUMP_ENDPOINT = `${BASE_URL}/builds/api_export/api-${latestVersion}.json`;

  return new Promise((res) => {
    http.get(DUMP_ENDPOINT, (response) => {
      let body = '';
      response.on('data', (chunk) => {
        body += chunk;
      });
      response.on('end', () => res(JSON.parse(body)));
    });
  });
}

function generateClassesLines(classes: Class[]): string[] {
  const lines = [];
  for (const obj of classes) {
    const typeClass = new TypeClass(
      false,
      obj.Name,
      `@${obj.Description}`,
      obj.BaseType,
      undefined,
      undefined,
      undefined,
      undefined,
      undefined
    );
    if (obj.Events) {
      for (const event of obj.Events) {
        typeClass.addField(
          new TypeField(
            event.Name,
            ['Event'],
            event.IsDeprecated
              ? `@${event.DeprecationMessage}`
              : `@${event.Description}`
          )
        );
      }
    }
    if (obj.Hooks) {
      for (const hook of obj.Hooks) {
        typeClass.addField(
          new TypeField(
            hook.Name,
            ['Hook'],
            hook.IsDeprecated
              ? `@${hook.DeprecationMessage}`
              : `@${hook.Description}`
          )
        );
      }
    }
    if (obj.StaticFunctions) {
      for (const staticFunctions of obj.StaticFunctions) {
        typeClass.addFunction(
          generateFunction(obj.Name, staticFunctions, false),
          true
        );
      }
    }
    if (obj.Constructors) {
      for (const construct of obj.Constructors) {
        typeClass.addFunction(
          generateFunction(obj.Name, construct, false),
          true
        );
      }
    }
    for (const property of obj.Properties) {
      if (property.Type == 'Object') {
        property.Type = 'CoreObject|Player';
      }
      typeClass.addField(
        new TypeField(
          property.Name,
          [typeMapping(property.Type)],
          property.Description ? `@${property.Description}` : ''
        )
      );
    }
    for (const memberFunction of obj.MemberFunctions) {
      typeClass.addFunction(generateFunction(obj.Name, memberFunction, true));
    }
    if (obj.Constants) {
      for (const constant of obj.Constants) {
        typeClass.addField(
          new TypeField(constant.Name, [
            typeMapping(constant.Type),
            `@${constant.Description}`
          ]),
          true
        );
      }
    }

    lines.push(...typeClass.getLines());
    lines.push('');
  }

  return lines;
}

function generateNamespacesLines(namespaces: Namespace[]): string[] {
  const lines = [];
  for (const obj of namespaces) {
    const typeClass = new TypeClass(true, obj.Name);

    if (obj.StaticEvents) {
      for (const event of obj.StaticEvents) {
        typeClass.addField(
          new TypeField(
            event.Name,
            ['Event'],
            event.IsDeprecated
              ? `@${event.DeprecationMessage}`
              : `@${event.Description}`
          ),
          true
        );
      }
    }

    if (obj.StaticHooks) {
      for (const hook of obj.StaticHooks) {
        typeClass.addField(
          new TypeField(
            hook.Name,
            ['Hook'],
            hook.IsDeprecated
              ? `@${hook.DeprecationMessage}`
              : `@${hook.Description}`
          ),
          true
        );
      }
    }

    if (obj.StaticFunctions) {
      for (const staticFunctions of obj.StaticFunctions) {
        typeClass.addFunction(
          generateFunction(obj.Name, staticFunctions, false),
          true
        );
      }
    }

    if (obj.Constants) {
      for (const constant of obj.Constants) {
        typeClass.addField(
          new TypeField(constant.Name, [
            typeMapping(constant.Type),
            `@${constant.Description}`
          ]),
          true
        );
      }
    }

    lines.push(...typeClass.getLines());
  }

  return lines;
}

function generateEnumsLines(enums: Enum[]) {
  const lines = [];
  for (const obj of enums) {
    const typeEnum = new TypeEnum(obj.Name, obj.Description);
    for (const field of obj.Values) {
      typeEnum.addValue(field.Name, field.Value);
    }

    lines.push(...typeEnum.getLines());
  }

  return lines;
}

function generateFunction(
  className: string,
  func: Func,
  member: boolean
): TypeFunction {
  const typeFunction = new TypeFunction(
    `${className}${member ? ':' : '.'}${func.Name}`,
    func.Description
  );
  const signatures = generateSignatures(func.Signatures, member ? className : undefined);
  for (const signature of signatures) {
    typeFunction.addSignature(signature);
  }

  return typeFunction;
}

function generateSignatures(signatures: Signature[], memberOfClass?: string): TypeSignature[] {
  const typeSignatures = [];
  for (const signature of signatures) {
    const typeSignature = new TypeSignature();

    if (memberOfClass && typeSignatures.length > 0) {
      typeSignature.addParameter(
        new TypeParameter(
          reservedNamesMapping('self'),
          [typeMapping(memberOfClass)],
          false,
          false
        )
      );
    }

    for (const parameter of signature.Parameters) {
      typeSignature.addParameter(
        new TypeParameter(
          reservedNamesMapping(parameter.Name),
          [typeMapping(parameter.Type)],
          parameter.IsOptional,
          parameter.IsVariadic
        )
      );
    }

    if (signature.Returns.length > 0) {
      const typeReturn = new TypeReturn();
      for (const ret of signature.Returns) {
        typeReturn.addtype(typeMapping(ret.Type));
      }
      typeSignature.addReturn(typeReturn);
    }

    typeSignatures.push(typeSignature);
  }

  return typeSignatures;
}

async function run() {
  const coreLuaAPI = await getCoreLuaAPI();
  const lines = [];

  lines.push(...generateClassesLines(coreLuaAPI.Classes));
  lines.push(...generateNamespacesLines(coreLuaAPI.Namespaces));
  lines.push(...generateEnumsLines(coreLuaAPI.Enums));
  lines.push(getAnnotation('type', 'CoreObject'));
  lines.push('script = nil');
  lines.push('');

  const timeFunction = new TypeFunction(
    'time',
    'Returns the time in seconds (floating point) since the game started on the server.',
    [new TypeSignature([], [new TypeReturn(['number'])])]
  );
  lines.push(...timeFunction.getLines());

  const tickFunction = new TypeFunction(
    'Tick',
    'The Tick event is used for things you need to check continuously (e.g. main game loop), but be careful of putting too much logic here or you will cause performance issues. DeltaTime is the time difference (in seconds) between this and the last tick.',
    [
      new TypeSignature(
        [new TypeParameter('deltaTime', ['number'])],
        [new TypeReturn(['number'])]
      )
    ]
  );
  lines.push(...tickFunction.getLines());

  fs.writeFileSync('dist/core-games-api.def.lua', arrayToString(lines));
}

run();
