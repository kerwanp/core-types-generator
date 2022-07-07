import { TypeParameter } from './TypeParameter';
import { TypeReturn } from './TypeReturn';
import { getAnnotation } from './utils';

export class TypeSignature {
  public constructor(
    private parameters: TypeParameter[] = [],
    private returns: TypeReturn[] = []
  ) {}

  public addParameter(typeParameter: TypeParameter) {
    this.parameters.push(typeParameter);
  }

  public addReturn(typeReturn: TypeReturn) {
    this.returns.push(typeReturn);
  }

  public getParameters() {
    return this.parameters;
  }

  public getOverloadAnnotation(skipIfNonOptionalArgument: boolean): string {
    if (
      skipIfNonOptionalArgument &&
      !this.parameters.find((argument) => argument.optional)
    ) {
      return;
    }
    return getAnnotation(
      'overload',
      `fun(${this.getTypedArguments(true)})${this.getReturnDeclaration()}`
    );
  }

  public getAnnotations(): string[] {
    const lines = [];
    lines.push(
      ...this.parameters
        .map((parameter) => parameter.getAnnotation())
        .filter((annotation) => !!annotation)
    );
    lines.push(...this.returns.map((typeReturn) => typeReturn.getAnnotation()));
    return lines;
  }

  public getReturnDeclaration(): string {
    if (this.returns.length <= 0) return '';
    if (this.returns.length === 1) return `: ${this.returns[0].getType()}`;
    return `{${this.returns.map((ret) => ret.getType())}}`;
  }

  public getTypedArguments(skipOptionals = false): string {
    return this.parameters
      .filter((parameter) => (skipOptionals ? !parameter.optional : true))
      .map((parameter) => parameter.getTypedArgument())
      .join(',');
  }

  public getArguments(): string {
    return this.parameters.map((parameter) => parameter.name).join(', ');
  }
}
