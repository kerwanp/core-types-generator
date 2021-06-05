import { Func, Signature } from './models';
import { typeMapping } from './utils';

export function getFunction(func: Func, member: boolean): string {
  const parametersStr = generateParameters(func.Signatures);
  const returnsStr = generateReturns(func.Signatures);

  if (member === false) {
    return `fun(${parametersStr})${returnsStr}`;
  }

  if (parametersStr.length > 0) {
    return `fun(self, ${parametersStr})${returnsStr}`;
  }
  return `fun(self)${returnsStr}`;
}

function generateParameters(signatures: Signature[]) {
  const signature = signatures[0];
  const parameters: {
    Name: string;
    Types: string[];
    IsVariadic?: boolean;
  }[] = [];
  let i = 0;
  for (const parameter of signature.Parameters) {
    const types: string[] = [];
    let name = parameter.Name;

    for (const otherSignature of signatures.slice(1)) {
      const nameParts = parameter.Name.split(/(?=[A-Z])/);
      name = nameParts.slice(0, nameParts.length - 1).join('');
      if (otherSignature.Parameters[i]) {
        types.push(typeMapping(otherSignature.Parameters[i].Type));
      }
    }
    types.push(typeMapping(parameter.Type));

    parameters.push({
      Name: name,
      Types: types,
      IsVariadic: parameter.IsVariadic
    });
    i++;
  }

  return parameters
    .map((parameter) => `${parameter.Name}: ${parameter.Types.join('|')} ${parameter.IsVariadic ? ' = nil' : ''}`)
    .join(', ');
}

function generateReturns(signatures: Signature[]): string {
  const signature = signatures[0];
  const returns: string[] = [];
  for (const obj of signature.Returns) {
    if (returns.includes(obj.Type)) {
      continue;
    }

    returns.push(typeMapping(obj.Type));
  }

  if (returns.length <= 0) {
    return '';
  }

  return `: ${returns.join('|')}`;
}
