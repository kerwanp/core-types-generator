import http from 'https';
import {
  AnnotationType,
  Class,
  CoreLuaAPI,
  Enum,
  Func,
  Property
} from './models';
import fs from 'fs';
import { getAnnotation, typeMapping } from './utils';
import { getNamespaces } from './namespaces';
import { getFunction } from './signature';

let result = '';

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

// function appendComment(content: string) {
//   return `--- ${content}\n`;
// }

function breakLine() {
  result += `\n`;
}

// function getAnnotation(name: AnnotationType, ...args: string[]): string {
//   appendComment(`@${name} ${args.join(' ')}`);
// }

function generateClasses(classes: Class[]) {
  for (const obj of classes) {
    result += getAnnotation(AnnotationType.CLASS, obj.Name);
    generateProperties(obj.Properties);
    generateMemberFunctions(obj.MemberFunctions);
    breakLine();
  }
}

function generateProperties(properties: Property[]) {
  for (const property of properties) {
    result += getAnnotation(
      AnnotationType.FIELD,
      'public',
      property.Name,
      typeMapping(property.Type),
      property.Description
    );
  }
}

function generateMemberFunctions(memberFunctions: Func[]) {
  for (const memberFunction of memberFunctions) {
    result += getAnnotation(
      AnnotationType.FIELD,
      memberFunction.Name,
      getFunction(memberFunction, true)
    );
  }
}

function generateEnums(enums: Enum[]) {
  for (const obj of enums) {
    result += getAnnotation(AnnotationType.CLASS, obj.Name);
    for (const property of obj.Values) {
      result += getAnnotation(
        AnnotationType.FIELD,
        property.Name,
        property.Value
      );
    }
    result += `${obj.Name} = {}\n`;
    breakLine();
  }
}

async function run() {
  const coreLuaAPI = await getCoreLuaAPI();
  generateClasses(coreLuaAPI.Classes);
  generateEnums(coreLuaAPI.Enums);

  result += getNamespaces(coreLuaAPI.Namespaces);

  for (const key of Object.keys(coreLuaAPI)) {
    console.log(key);
  }

  fs.writeFileSync('core-types.lua', result);
}

run();
