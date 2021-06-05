import http from 'https';
import { Class, CoreLuaAPI, Enum, Func, Namespace, Signature } from './models';
import fs from 'fs';
import { arrayToString, typeMapping } from './utils';
import { TypeClass } from './TypeClass';
import { TypeField } from './TypeField';
import { TypeFunction } from './TypeFunction';
import { TypeSignature } from './TypeSignature';
import { TypeParameter } from './TypeParameter';
import { TypeReturn } from './TypeReturn';

async function getCoreLuaAPI(): Promise<CoreLuaAPI> {
  return new Promise((res) => {
    http.get(
      'https://raw.githubusercontent.com/ManticoreGamesInc/vscode-core/main/src/CoreLuaAPI.json',
      (response) => {
        let body = '';
        response.on('data', (chunk) => {
          body += chunk;
        });
        response.on('end', () => res(JSON.parse(body)));
      }
    );
  });
}

function generateClassesLines(classes: Class[]): string[] {
  const lines = [];
  for (const obj of classes) {
    const typeClass = new TypeClass(false, obj.Name);
    for (const property of obj.Properties) {
      typeClass.addField(
        new TypeField(property.Name, [typeMapping(property.Type)])
      );
    }
    for (const memberFunction of obj.MemberFunctions) {
      typeClass.addFunction(generateFunction(obj.Name, memberFunction));
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
        typeClass.addField(new TypeField(event.Name, ['Event']));
      }
    }
    for (const memberFunction of obj.StaticFunctions) {
      typeClass.addFunction(generateFunction(obj.Name, memberFunction));
    }

    lines.push(...typeClass.getLines());
    lines.push('');
  }

  return lines;
}

function generateEnumsLines(enums: Enum[]) {
  const lines = [];
  for (const obj of enums) {
    const typeClass = new TypeClass(true, obj.Name);
    for (const field of obj.Values) {
      const typeField = new TypeField(field.Name, [field.Value]);
      typeClass.addField(typeField);
    }
    lines.push(...typeClass.getLines());
  }
  return lines;
}

function generateFunction(className: string, func: Func): TypeFunction {
  const typeFunction = new TypeFunction(`${className}:${func.Name}`);
  const signatures = generateSignatures(func.Signatures);
  for (const signature of signatures) {
    typeFunction.addSignature(signature);
  }
  return typeFunction;
}

function generateSignatures(signatures: Signature[]): TypeSignature[] {
  const typeSignatures = [];
  for (const signature of signatures) {
    const typeSignature = new TypeSignature();
    for (const parameter of signature.Parameters) {
      typeSignature.addParameter(
        new TypeParameter(
          parameter.Name,
          [typeMapping(parameter.Type)],
          parameter.IsVariadic ?? false
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
  lines.push(...['', '', '', '', '']);
  lines.push(...generateNamespacesLines(coreLuaAPI.Namespaces));
  lines.push(...generateEnumsLines(coreLuaAPI.Enums));

  fs.writeFileSync('core-games-api.def.lua', arrayToString(lines));
}

run();
