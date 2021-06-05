import { TypeFunction } from './TypeFunction';
import { TypeField } from './TypeField';
import { getAnnotation } from './utils';

export class TypeClass {
  public constructor(
    private isGlobal: boolean,
    private name: string,
    private functions: TypeFunction[] = [],
    private fields: TypeField[] = [],
    private description?: string
  ) {}

  public addFunction(typeFunction: TypeFunction) {
    this.functions.push(typeFunction);
  }

  public addField(field: TypeField) {
    this.fields.push(field);
  }

  private getFunctionsLines(): string[] {
    const lines = [];
    for (const typeFunction of this.functions) {
      lines.push(...typeFunction.getLines());
    }
    return lines;
  }

  private getFieldsLines(): string[] {
    const lines = [];
    for (const field of this.fields) {
      lines.push(field.toAnnotation());
    }
    return lines;
  }

  private toAnnotation() {
    return getAnnotation('class', this.name, this.description);
  }

  private toDefinition() {
    if (this.isGlobal) {
      return `${this.name} = {}`;
    }
    return `local ${this.name} = {}`;
  }

  public getLines() {
    const lines = [];
    lines.push(this.toAnnotation());
    lines.push(...this.getFieldsLines());
    lines.push(this.toDefinition());
    lines.push(...this.getFunctionsLines());
    return lines;
  }
}
