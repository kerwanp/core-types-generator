import { TypeSignature } from './TypeSignature';
import { TypeClass } from './TypeClass';
import { outputConsoleWarning } from './utils';

export class TypeMetamethod {
  public constructor(
    public typeClass: TypeClass,
    public name: string,
    public description: string,
    private signatures: TypeSignature[] = []
  ) {}

  public addSignature(signature: TypeSignature) {
    this.signatures.push(signature);
  }

  private getSignatureAnnotations(): string[] {
    return this.signatures[0].getAnnotations();
  }

  private getOverloadAnnotations(): string[] {
    const lines = [];
    lines.push(this.signatures[0].getOverloadAnnotation(true));
    lines.push(
      ...this.signatures
        .slice(1)
        .map((signature) => signature.getOverloadAnnotation(false))
    );
    return lines;
  }

  public getDefinition() {
    return `function ${this.name}(${this.signatures[0].getArguments()}) end`;
  }

  private getOperatorLine(
    signature: TypeSignature,
    operator: string,
    hasRightHand: boolean
  ) {
    const parameters = signature.getParameters();
    const expectedParams = hasRightHand ? 2 : 1;
    if (parameters.length !== expectedParams) {
      outputConsoleWarning(
        `getOperatorLine(${operator}): other than ${expectedParams} params, skipping`,
        parameters.length,
        parameters
      );
      return null;
    }
    if (
      parameters[0].types.length !== 1 ||
      parameters[0].types[0] !== this.typeClass.getName()
    ) {
      outputConsoleWarning(
        `getOperatorLine(${operator}): expected lh param to be same as class`
      );
      return null;
    }
    if (hasRightHand) {
      return (
        '--- @operator ' +
        operator +
        '(' +
        parameters[1].types[0] +
        ')' +
        signature.getReturnDeclaration() +
        ' @ ' +
        this.description
      );
    }
    return (
      '--- @operator ' +
      operator +
      signature.getReturnDeclaration() +
      ' @ ' +
      this.description
    );
  }

  public getLines(): string[] {
    const lines = [];

    const SUPPORTED_OPERATORS = [
      'mul',
      'div',
      'add',
      'pow',
      'sub',
      'concat',
      'unm'
    ];
    const OPERATORS_LEFT_HAND_ONLY = ['unm'];

    const strippedName = this.name.replace('__', '');

    if (!SUPPORTED_OPERATORS.includes(strippedName)) {
      outputConsoleWarning(
        'TypeMetamethod.getLines()',
        'Operator ' + strippedName + ' not supported'
      );
      return [];
    }

    for (const signature of this.signatures) {
      const resultLine = this.getOperatorLine(
        signature,
        strippedName,
        !OPERATORS_LEFT_HAND_ONLY.includes(strippedName)
      );
      if (resultLine) {
        lines.push(resultLine);
      }
    }

    return lines;
  }
}
