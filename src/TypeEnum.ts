import { getAnnotation } from './utils';

export class TypeEnum {
  constructor(
    private name: string,
    private values: { [key: string]: string } = {}
  ) {}

  public addValue(key: string, value: string) {
    this.values[key] = value;
  }

  private getAnnotation(): string {
    return getAnnotation(
      'alias',
      this.name,
      Object.values(this.values).join(' | ')
    );
  }

  private getDeclaration(): string[] {
    const lines = [];
    lines.push(`${this.name} = {`);
    for (const key of Object.keys(this.values)) {
      lines.push(`    ${key} = ${this.values[key]},`);
    }
    lines.push(`}`);
    return lines;
  }

  public getLines(): string[] {
    const lines = [];
    lines.push(this.getAnnotation());
    lines.push(...this.getDeclaration());
    return lines;
  }
}
